package controller.login;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.login.LoginDAO;
import vo.shop.signVO;


@Controller
public class LoginController {
	LoginDAO logindao;
	
	public void setLogindao(LoginDAO logindao) {
		this.logindao = logindao;
	}

	@Autowired//자동 주입.(Spring으로 부터 application정보를 자동으로 받는다.)
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/login_form.do")
	public String login_form( Model model ) {
		System.out.println( org.springframework.core.SpringVersion.getVersion() ); 
		return Common.loginPage.VIEW_PATH + "login.jsp";
	}
	
	@RequestMapping("/login.do")
	public String login(String m_id, String m_pwd, Model model, HttpServletRequest request) {
		
		String m_email = m_id;
		
		signVO vo = logindao.login(m_email);
		
		String loginresultpath = "notice_list.do?page=1";
		String loginerrer = null;
		
		
		if( vo == null ) {
			
			loginerrer = "id가 잘못되었습니다.";
			loginresultpath = "login.jsp";
			model.addAttribute("loginerrer", loginerrer);
			
			return Common.loginPage.VIEW_PATH + loginresultpath;
			
		}
		if( !vo.getM_pwd().equals(m_pwd) ) {
			
			loginerrer = "pwd가 잘못되었습니다.";
			loginresultpath = "login.jsp";
			model.addAttribute("loginerrer", loginerrer);
			
			return Common.loginPage.VIEW_PATH + loginresultpath;
			
		}
		vo.setM_pwd(null);
		
		 session.setAttribute("vo",vo);
		 session.setMaxInactiveInterval(600*60);

		return loginresultpath;
	}
	
	@RequestMapping("/logout.do")
	public String logout() {
		
		session.removeAttribute("vo");
		
		return Common.loginPage.VIEW_PATH + "login.jsp";
	}
	
}
