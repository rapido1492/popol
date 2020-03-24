package dao.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.shop.qnaVO;

public class qnaDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("qnaDAO 생성자 생성");
		this.sqlSession = sqlSession;
	}
	
	public int qnainput(qnaVO vo) {
		
		int res = sqlSession.insert("qna.qnainput", vo);
		
		return res;
	}
	
	public int qna_Cnt() {
		
		int cnt = sqlSession.selectOne("qna.qna_Cnt");
		
		return cnt;
		
	}
	
	public Map qna_post(int qna_idx) {
		
		Map qna_post = sqlSession.selectOne("qna.qna_post", qna_idx);
		
		return qna_post;
	}
	
	public int qna_answer(String qna_answer, int qna_idx) {
		
		Map qna_answer_set = new HashMap();
		
		qna_answer_set.put("qna_answer", qna_answer);
		qna_answer_set.put("qna_idx", qna_idx);
		
		int res = sqlSession.update("qna.qna_answer_set", qna_answer_set);
		
		return res;
	}
	
	public List<qnaVO> qna_list(int startList, int endList){
		
		Map searchNum = new HashMap();
		
		searchNum.put("startList", endList);
		searchNum.put("endList", startList);
		
		System.out.println(searchNum.get("startList"));
		System.out.println(searchNum.get("endList"));
		
		List<qnaVO> qna_list = sqlSession.selectList("qna.qna_list", searchNum);
		
		System.out.println("qna사이즈" + qna_list.size());
		
		for(int i = 0; i < qna_list.size() ; i++) {
			
			System.out.println(qna_list.get(i).getQna_idx());
		}
		
		return qna_list;
	}
	
}
