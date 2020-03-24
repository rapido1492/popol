package controller.support;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.support.faqDAO;
import vo.shop.faqVO;

@Controller
public class faqController {

	faqDAO faqdao;

	public void setFaqdao(faqDAO faqdao) {
		this.faqdao = faqdao;
	}

	@Autowired // 자동 주입.(Spring으로 부터 application정보를 자동으로 받는다.)
	ServletContext application;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@RequestMapping("/faq.do")
	public String faqlist(int item_cd, Model model, HttpServletRequest request) {

		List<faqVO> vo;

		if (item_cd == 0) {
			vo = faqdao.categoryall();
		} else {
			vo = faqdao.categoryaselect(item_cd);
		}
		model.addAttribute("item_cd", item_cd);
		model.addAttribute("vo", vo);

		return Common.supportPage.VIEW_PATH + "faq.jsp";
	}

	@RequestMapping("/faq_insert.do")
	public String faq_insert() {

		return Common.supportPage.VIEW_PATH + "faq_insert.jsp";
	}

	@RequestMapping("/faq_input.do")
	public String faq_input(faqVO vo) {
		
		int res = faqdao.faq_input(vo);

		return "faq.do?item_cd=0";
	}

}
