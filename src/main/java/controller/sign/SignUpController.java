package controller.sign;

import java.util.Random;

import javax.mail.internet.MimeMessage;
//import javax.jws.WebParam.Mode;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.sign.SignUpDAO;
import vo.shop.signVO;

@Controller
public class SignUpController {
	SignUpDAO signupdao;

	public void setSignupdao(SignUpDAO signupdao) {
		this.signupdao = signupdao;
	}

	@Autowired // 자동 주입.(Spring으로 부터 application정보를 자동으로 받는다.)
	ServletContext application;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("/signup_form.do")
	public String signup_form() {

		System.out.println(org.springframework.core.SpringVersion.getVersion());
		return Common.signPage.VIEW_PATH + "signup.jsp";

	}

	@RequestMapping("/pwdsearch_form.do")
	public String pwd_search() {

		System.out.println(org.springframework.core.SpringVersion.getVersion());
		return Common.signPage.VIEW_PATH + "pwd_search.jsp";

	}
	
	@RequestMapping("/back_out_form.do")
	public String back_out_form() {

		System.out.println(org.springframework.core.SpringVersion.getVersion());
		return Common.MyPage.VIEW_PATH + "back_out.jsp";

	}

	@RequestMapping("/signup_insert.do")
	public String signup_insert(signVO vo, String m_id, String email2) {

		vo.setM_email(m_id + "@" + email2);
		vo.setM_cash(0);
		vo.setM_purchasemoney(0);
		vo.setM_savemoney(0);
		vo.setM_seller("no");
		vo.setM_usergrade("normal");
		
		
		int res = signupdao.signup(vo);

		return "/login_form.do";

	}

	@RequestMapping("/email_search.do")
	@ResponseBody
	public String email_search(String m_email) {

		String result = "no";

		String res = signupdao.email_search(m_email);

		System.out.println(res);

		if (res != null) {

			result = res;
		}

		return result;
	}

	@RequestMapping("/nick_search.do")
	@ResponseBody
	public String nick_search(String m_nick) {

		String result = "no";

		String res = signupdao.nick_search(m_nick);

		System.out.println(res);

		if (res != null) {

			result = res;
		}

		return result;
	}

	@RequestMapping("pwd_search_form.do")
	public String pwd_search_form(Model model) {

		return Common.signPage.VIEW_PATH + "pwd_search.jsp";
	}

	@RequestMapping("pwdsearch_nickcheck.do")
	public String pwd_change(Model model, String m_email) {

		String res_do = null;

		String res = signupdao.email_search(m_email);

		if (m_email.equals(res)) {
			res_do = "pwd_number.jsp";
			model.addAttribute("id_res", "true");
			model.addAttribute("m_email", m_email);
			System.out.println("id 맞음");
		} else if (!m_email.equals(res)) {

			res_do = "pwd_search.jsp";
			model.addAttribute("id_res", "fail");
			System.out.println("id 틀림");

		}

		return Common.signPage.VIEW_PATH + res_do;
	}

	@RequestMapping("pwd_change_number_issue.do")
	public String pwd_change_number_issue(Model model, final String m_email, String id_res) {

		System.out.println(m_email);
		System.out.println(id_res);
		
		Random RanNum = new Random();
		
		final int num = RanNum.nextInt(9998)+1;
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				/* helper.setFrom(vo.getFrom()); */
				helper.setTo(m_email);
				helper.setSubject("인증번호 발송");
				helper.setText(num + "가 인증번호입니다.", true);
			}
		};
		mailSender.send(preparator);
		/*
		 * 출처: https: // offbyone.tistory.com/167 [쉬고 싶은 개발자]
		 */
		
		
		model.addAttribute("num", num);
		model.addAttribute("m_email", m_email);
		model.addAttribute("id_res", id_res);
		
		System.out.println(num);
		
		session.setAttribute("num", num );

		return Common.signPage.VIEW_PATH + "pwd_number.jsp";
	}
	
	@RequestMapping("pwd_change_form.do")
	public String pwd_change_form(Model model, String m_email, String id_res, int num_check) {
		
		String res_jsp = null;
		
		int num_chk = (Integer) session.getAttribute("num");
		
		System.out.println(m_email);
		System.out.println(id_res);
		System.out.println(num_check);
		
		
		if(num_check != num_chk) {
			
			model.addAttribute("number_issue", num_check);
			model.addAttribute("number_check", "fail");
			model.addAttribute("m_email", m_email);
			model.addAttribute("id_res", id_res);
			
			res_jsp = "pwd_number.jsp";
			
		}
		else if(num_check == num_chk) {
			
			model.addAttribute("m_email", m_email);
			model.addAttribute("id_res", id_res);
			
			res_jsp = "change_pwd.jsp";
		};
		
		
		return Common.signPage.VIEW_PATH + res_jsp;
	}
	
	@RequestMapping("pwd_change.do")
	public String pwd_change(Model model, String m_email, String m_pwd) {
		
		System.out.println(m_email);
		System.out.println(m_pwd);
		
		signupdao.pwd_change(m_email, m_pwd);
		
		return "login_form.do";
	}
	
	
	@RequestMapping("/back_out.do")
	public String back_out(Model model, String m_pwd, int reason) {

		signVO vo = (signVO) session.getAttribute("vo");
		String jsp_page = null;
		
		int res = signupdao.back_out(vo.getM_email(), m_pwd, reason);
		
		if(res == 0){ 
			model.addAttribute("m_pwd_errer", "패스워드가 잘못 되었습니다.");
			jsp_page = Common.MyPage.VIEW_PATH+"back_out.jsp";
			}
		else {
			jsp_page = "login_form.do";
			session.removeAttribute("vo");
		}
		
		return jsp_page;
		
	}

}
