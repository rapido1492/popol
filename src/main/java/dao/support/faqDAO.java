package dao.support;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.shop.faqVO;

public class faqDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("faqDAO 생성자 생성");
		this.sqlSession = sqlSession;
	}
	
	public List<faqVO> categoryall() {
		
		List<faqVO> vo = sqlSession.selectList("faq.categoryallselect");
		
		return vo;
	}
	
	public List<faqVO> categoryaselect(int item_cd) {
		
		List<faqVO> vo = sqlSession.selectList("faq.categoryselect", item_cd);
		
		return vo;
	}
	
	public int faq_input(faqVO vo) {
		
		int res = sqlSession.insert("faq.faqinput", vo);
		
		return res;
	}
		
}
