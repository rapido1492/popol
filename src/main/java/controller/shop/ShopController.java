package controller.shop;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.shop.ShopDAO;
import vo.shop.CartVO;
import vo.shop.PublishVO;
import vo.shop.ShopVO;
import vo.shop.UserVO;

@Controller
public class ShopController {
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	ShopDAO shopdao;
	ShopVO vo;
	
	public ShopController() {
		System.out.println("shopController 생성자 생성");
	}
	
	public ShopController(ShopDAO shopdao) {
		this.shopdao = shopdao;
	}
	
	//상품 리스트
	@RequestMapping(value= {"/","/product_list.do"})
	public String test(Model model) {		
		List<ShopVO> product_list = null;
		product_list = shopdao.select_productList();
		List<PublishVO> pub_list = null;
		pub_list = shopdao.pub_list();
		
		model.addAttribute("pub_list",pub_list);
		model.addAttribute("product_list", product_list);
		return Common.VIEW_PATH + "product_list.jsp";
	}
	
	// 상품 등록 페이지로 전환
	@RequestMapping("/product_insert_form.do")
	public String insert_form(Model model) {
		List<PublishVO> pub_list = null;
		pub_list = shopdao.pub_list();
		for(int i = 0; i < pub_list.size(); i++) {
			System.out.println(pub_list.get(i).getPro_publisher_name());
		}
		model.addAttribute("pub_list", pub_list);
		return common.Common.VIEW_PATH + "product_write.jsp";
	}
	
	// 상품등록
	@RequestMapping("/product_insert.do")
	public String insert(ShopVO vo, Model model, HttpServletRequest req) {
		
		String webPath = "/resources/upload/"; // 절대경로
		
		String savePath = application.getRealPath(webPath);
		
		String lang = null;
		String[] language = req.getParameterValues("language");
		for(int i = 0; i < language.length; i++) {
			lang += language[i];
			System.out.println(lang);
		}
		vo.setLanguage(lang);
		// 업로드된 파일의 정보
		String file_name = "no_file";
		MultipartFile photo = vo.getProduct_photo();

		// 업로드를 위한 이미지가 존재하는 경우
		if( !photo.isEmpty() ) {
			file_name = photo.getOriginalFilename(); // 업로드한 파일의 실제 파일명

			File saveFile = new File(savePath, file_name); // savePath에다가 filename을 넣을것.
			
			if( !saveFile.exists() ) { // 경로가 존재하지 않다면.
				saveFile.mkdirs();
			}else {
				// 동일파일명 중복방지
				long time = System.currentTimeMillis();
				file_name = String.format("%d_%s", time, file_name);
				saveFile = new File(savePath, file_name);
			}
		    try {
		        photo.transferTo(saveFile); // 업로드 파일에 saveFile이라는 이름 입힘 
		    } catch (IOException e) {
		        e.printStackTrace();
		        return null;
		    }
		      
		}//if( !photo.isEmpty() )
		
		vo.setPro_name(vo.getPro_name());
		vo.setP_content(vo.getP_content());
		vo.setPro_price(vo.getPro_price());
		vo.setPro_category(vo.getPro_category());
		vo.setPro_publisher_name(vo.getPro_publisher_name());
		vo.setFile_name(file_name);
		vo.setPro_youtube1(vo.getPro_youtube1());
		vo.setPro_youtube2(vo.getPro_youtube2());
		vo.setPro_youtube3(vo.getPro_youtube3());
		vo.setDeveloper(vo.getDeveloper());
		vo.setPlatform(vo.getPlatform());
		
		int res = shopdao.insert(vo);
		
		return "redirect:product_list.do";
	}
	
	//게시물 보기
	@RequestMapping("/product_view.do")
	public String view(int product_idx, Model model) {
		ShopVO svo = shopdao.product_selectOne(product_idx);
		model.addAttribute("svo", svo);
		return common.Common.VIEW_PATH + "product_view.jsp";
	}
	
	//소개
	@RequestMapping("/product_introduce.do")
	public String introduce() {
		return common.Common.VIEW_PATH + "service_introduce.jsp";
	}
	
	//마이페이지
	@RequestMapping("/product_mypage.do")
	public String mypage() {
		return common.Common.VIEW_PATH + "service_mypage.jsp";
	}
	
	//장바구니 담기
	@RequestMapping("/product_add.do")
	public String product_add(int product_idx, Model model) {
		ShopVO svo = shopdao.product_selectOne(product_idx);
		CartVO cvo = new CartVO();
		cvo.setU_idx(21);
		cvo.setProduct_idx(svo.getProduct_idx());
		cvo.setPro_name(svo.getPro_name());
		cvo.setPro_price(svo.getPro_price());
		cvo.setFile_name(svo.getFile_name());
		int res = shopdao.cart_insert(cvo);

		return "redirect:product_cartList.do";

	}
	
	//장바구니 리스트
	@RequestMapping("/product_cartList.do")
	public String product_cartList(Model model) {
		int u_idx = 21;
		List<CartVO> cart_list = null;
		cart_list = shopdao.cart_list(u_idx);
		int total = 0;
		for(int i = 0; i < cart_list.size(); i++) {
			total += cart_list.get(i).getPro_price();
		}
		
		//유저 보유 캐시 조회 및 불러오기
		int user_idx = 1;
		UserVO uvo = new UserVO();
		uvo = shopdao.user_selectOne(user_idx);
		int user_cash = uvo.getUser_cash();
		
		model.addAttribute("user_cash", user_cash);
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("total", total);
		return common.Common.VIEW_PATH + "cartList.jsp";
	}
	
	//상품 구매
	@RequestMapping("/cart_buy.do")
	public String cart_buy(HttpServletRequest req/* , int user_idx */, Model model) {
		int user_idx = 1;
		UserVO uvo = new UserVO();
		uvo = shopdao.user_selectOne(user_idx);

		String[] chk= req.getParameterValues("cart_check");
		int[] check = new int[chk.length];
		int price = 0;
		int user_cash = uvo.getUser_cash();
		int cash_res = 0;

		for(int i = 0; i< chk.length; i++) {
			CartVO cvo = new CartVO();
			check[i] = Integer.parseInt(chk[i]);
			cvo = shopdao.cart_buy(check[i]); 
			price += cvo.getPro_price();
			if(user_cash > price) {
				cash_res = (uvo.getUser_cash() - price);
				int res = shopdao.cart_del(check[i]);
			}
			else {
				System.out.println("캐시부족");
			}
		}
		model.addAttribute("cash_res", cash_res);
		return "redirect:product_cartList.do";
	}
	
	// 카트 삭제
	@RequestMapping("/cart_del.do")
	public String cart_del(HttpServletRequest req) {
		String[] chk= req.getParameterValues("cart_check");
		int[] check = new int[chk.length];
		for(int i = 0; i< chk.length; i++) {
			check[i] = Integer.parseInt(chk[i]);
			int res = shopdao.cart_del(check[i]);
		}
		return "redirect:product_cartList.do";
	}
	
	@RequestMapping("/product_search.do")
	public String search(HttpServletRequest req, Model model) {
		String searchValue = req.getParameter("searchValue");
		List<ShopVO> product_list = shopdao.search_list(searchValue);
		model.addAttribute("product_list",product_list);
		
		return Common.VIEW_PATH + "product_list.jsp";
	}
 }
