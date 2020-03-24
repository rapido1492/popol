package dao.sign;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.shop.signVO;


public class SignUpDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("signupDAO 생성자 생성");
		this.sqlSession = sqlSession;
	}
	 
	public int signup(signVO vo) {
		
		int res = 0;
		
		res = sqlSession.insert("signup.signupinsert", vo);
		
		System.out.println(res);
		
		return res;
	}
	
	public String email_search(String m_email) {
		
		String res = sqlSession.selectOne("signup.email_search", m_email);
		
		return res;
		
	}
	
	public String nick_search(String m_nick) {
		
		String res = sqlSession.selectOne("signup.nick_search", m_nick);
		
		return res;
		
	}
	
	public int pwd_change(String m_email, String m_pwd) {
		
		Map map = new HashMap();
		
		map.put("m_email", m_email);
		map.put("m_pwd", m_pwd);
		
		int res = sqlSession.insert("signup.pwd_change", map);
		
		return res;
		
	}
	
	public int back_out(String m_email, String m_pwd , int back_out_cause) {
		
		Map map = new HashMap();
		
		map.put("m_email", m_email);
		map.put("m_pwd", m_pwd );
		map.put("back_out_cause", back_out_cause);
		
		int res = sqlSession.insert("signup.back_out", map);
		
		System.out.println(res);
		
		return res;
	}

	
}
