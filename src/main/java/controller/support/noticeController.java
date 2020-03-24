package controller.support;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import common.Common;
import common.Pageing;
import dao.support.noticeDAO;
import vo.shop.noticeVO;
import vo.shop.signVO;

@Controller
public class noticeController {

	noticeDAO noticedao;

	public void setNoticedao(noticeDAO noticedao) {
		this.noticedao = noticedao;
	}

	@Autowired // 자동 주입.(Spring으로 부터 application정보를 자동으로 받는다.)
	ServletContext application;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;
	
	//공지사항 게시물
	@RequestMapping("notice.do")
	public String notice(Model model, int notice_idx, int page) {
		String ViewInt = Integer.toString(notice_idx);
		String ViewIntSave = (String) session.getAttribute(ViewInt);
		
		if(ViewIntSave == null) {
			session.setAttribute(ViewInt, "yes");
			int res = noticedao.notice_view(notice_idx);
		}
		
		Map noticevo = noticedao.notice_content(notice_idx);
		
		model.addAttribute("noticeVO",noticevo);
		model.addAttribute("page", page);
		
		return Common.supportPage.VIEW_PATH + "notice.jsp";
	}

	//공지사항 게시물 리스트
	@RequestMapping("notice_list.do")
	public String noticelist(Model model, int page) {

		int noticecnt = noticedao.noticeCnt();
		
		Map pageinfo = Pageing.pageinfo(page, noticecnt , 10, 10);
		
		int startList = (Integer) pageinfo.get("startList");
		int endList = (Integer) pageinfo.get("endList");
		
		List<noticeVO> noticelist = noticedao.notice_list(startList, endList);
		
		model.addAttribute("notice_list" ,noticelist);
		model.addAttribute("page" ,page);
		model.addAttribute("pageinfo",pageinfo);
		
		return Common.supportPage.VIEW_PATH + "notice_list.jsp";
	}

	//게시물 작성 페이지 이동
	@RequestMapping("notice_insert_form.do")
	public String notice_insert_form() {

		return Common.supportPage.VIEW_PATH + "notice_insert.jsp";
	}
	
	//게시물 작성 등록
	@RequestMapping("notice_insert.do")
	public String notice_insert(Model model, noticeVO noticevo) {
		
		HttpSession session = request.getSession();
		signVO vo = (signVO)session.getAttribute("vo");
		
		noticevo.setM_idx(vo.getM_idx());
		
		noticedao.notice_insert(noticevo);
		
		return "notice_list.do";
	}
	
	//게시물 검색
	@RequestMapping("notice_search.do")
	public String notice_search(Model model, String searchValue, String searchType) {
		
		System.out.println(searchValue);
		System.out.println(searchType);
		
		List<noticeVO> notice_list = noticedao.notice_search(searchType, searchValue);
		
		model.addAttribute("notice_list", notice_list);
		model.addAttribute("searchValue",searchValue);
		
		return Common.supportPage.VIEW_PATH + "notice_list.jsp";
	}

	//게시물 이미지 업로드
	@RequestMapping("imageupload.do")
	@ResponseBody
	public String imageupload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception {
		
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		MultipartFile file = multiFile.getFile("upload");
		
		String webPath = "/resources/upload/";
		
		String savePath = application.getRealPath(webPath);
				
		String filename = "no_file";
		
		if( !file.isEmpty() ) {
			//업로드 실제 파일명
			filename = file.getOriginalFilename();
			
			//저장할 파일의 경로
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				//저장할 경로가 존재하지 않을 시, 새로운 폴더 생성.
				saveFile.mkdirs();	
			}else {
				
				printWriter = resp.getWriter();
				resp.setContentType("text/html");
				
				//동일 파일명 방지하기 위해 현재 업로드 시간을 붙여서 중복을 방지한다.
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
				
				System.out.println(filename);
				String fileUrl = req.getContextPath() + "/resources/upload/" + filename;
				
				System.out.println(fileUrl);
				
				json.addProperty("uploaded", 1);
		        json.addProperty("fileName", filename);
		        json.addProperty("url", fileUrl);
			}
			
			try {
				//업로드를 요청받은 파일은 multipartResolver클래스가 저장한 임시 저장소에 있는데,
				//임시 저장소에 있는 파일은 일정 시간이 지나면 사라지므로, 
				//내가 지정해놓은 경로로 복사를 해둔다.
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
		
        printWriter.println(json);
		
		return null;
	}
}
