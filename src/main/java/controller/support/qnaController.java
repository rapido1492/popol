package controller.support;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import common.Pageing;
import dao.support.qnaDAO;
import vo.shop.qnaVO;

@Controller
public class qnaController {

	qnaDAO qnadao;

	public void setQnadao(qnaDAO qnadao) {
		this.qnadao = qnadao;
	}
	
	@Autowired//자동 주입.(Spring으로 부터 application정보를 자동으로 받는다.)
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/qna.do")
	public String qna(Model model, HttpServletRequest request) {
		
		return Common.supportPage.VIEW_PATH + "qna.jsp";
	}
	
	@RequestMapping("/qna_post")
	public String qna_post(Model model, int qna_idx, int page) {

		Map qna_post = qnadao.qna_post(qna_idx);
		
		System.out.println(qna_post.get("qna_idx"));
		
		model.addAttribute("qna_post",qna_post);
		model.addAttribute("page", page);
		
		return Common.supportPage.VIEW_PATH + "qna_post.jsp";
	}
	@RequestMapping("/qna_answer.do")
	public String qna_answer(Model model, String qna_answer, int qna_idx, int page) {
		
		qnadao.qna_answer(qna_answer, qna_idx);
		
		return "qna_list.do?page="+page;
	}
	
	@RequestMapping("/qna_list.do")
	public String qna_list(Model model, HttpServletRequest request, int page) {
		
		int qna_cnt = qnadao.qna_Cnt();
		
		Map pageinfo = Pageing.pageinfo(page, qna_cnt , 10, 10);
		
		int startList = (Integer) pageinfo.get("startList");
		int endList = (Integer) pageinfo.get("endList");
		
		List<qnaVO> qna_list = qnadao.qna_list(startList, endList);
		System.out.println("컨트롤러"+qna_list.size());
		
		model.addAttribute("qna_list", qna_list);
		model.addAttribute("pageinfo", pageinfo);
		model.addAttribute("page", page);
		
		return Common.supportPage.VIEW_PATH + "qna_list_maneger.jsp";
	}
	
	@RequestMapping("/qna_insert.do")
	public String qna_insert(qnaVO vo) {
		
		/*
		 * System.out.println(vo.getQna_category());
		 * System.out.println(vo.getQna_content());
		 * System.out.println(vo.getQna_title());
		 * System.out.println(vo.getPhoto1().getOriginalFilename());
		 * System.out.println(vo.getPhoto2().getOriginalFilename());
		 * System.out.println(vo.getPhoto3().getOriginalFilename());
		 */
				
		vo.setM_idx(1);
		
		if(!vo.getPhoto1().isEmpty()) {
			vo.setQna_photo1(photosave(vo.getPhoto1()));
		}
		else {vo.setQna_photo1("null");}
		
		if(!vo.getPhoto2().isEmpty()) {
			vo.setQna_photo2(photosave(vo.getPhoto2()));
		}
		
		else {vo.setQna_photo2("null");}
		
		if(!vo.getPhoto3().isEmpty()) {
			vo.setQna_photo3(photosave(vo.getPhoto3()));
		}
		else {vo.setQna_photo3("null");}
		
		qnadao.qnainput(vo);
		
		return "faq.do?item_cd=0";
	}
	
	public String photosave( MultipartFile multipartfile ) {

		String webPath = "/resources/upload/";
		
		System.out.println(webPath);
		
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		//사용자가 업로드한 파일 정보
		MultipartFile photo = multipartfile ;
		
		String filename = "no_file";
		
		if( !photo.isEmpty() ) {
			//업로드 실제 파일명
			filename = photo.getOriginalFilename();
			
			//저장할 파일의 경로
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				//저장할 경로가 존재하지 않을 시, 새로운 폴더 생성.
				saveFile.mkdirs();	
			}else {
				//동일 파일명 방지하기 위해 현재 업로드 시간을 붙여서 중복을 방지한다.
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			
			try {
				//업로드를 요청받은 파일은 multipartResolver클래스가 저장한 임시 저장소에 있는데,
				//임시 저장소에 있는 파일은 일정 시간이 지나면 사라지므로, 
				//내가 지정해놓은 경로로 복사를 해둔다.
				photo.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
		return filename;
	}
	
}
