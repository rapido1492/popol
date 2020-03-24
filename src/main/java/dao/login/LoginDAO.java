package dao.login;

import org.apache.ibatis.session.SqlSession;

import vo.shop.signVO;


public class LoginDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("loginDAO 생성자 생성");
		this.sqlSession = sqlSession;
	}
	
	public signVO login(String m_email) {
		
		signVO vo = null;
		
		try {
			vo = sqlSession.selectOne("login.login_select",m_email);
		} catch (Exception e) {
			vo = null;
		}
		
		
		return vo;
	}
	
}
