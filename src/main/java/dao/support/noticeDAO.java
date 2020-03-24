package dao.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.shop.noticeVO;

public class noticeDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("noticeDAO 생성자 생성");
		this.sqlSession = sqlSession;
	
	}
	
	public int notice_insert(noticeVO noticevo) {
		
		int req = sqlSession.insert("notice.notice_insert", noticevo);
		
		return req;
	}
	
	public List<noticeVO> notice_list(int startList, int endList){
		
		Map searchNum = new HashMap();
		
		searchNum.put("startList", endList);
		searchNum.put("endList", startList);
		
		System.out.println(searchNum.get("startList"));
		System.out.println(searchNum.get("endList"));
		
		List<noticeVO> notice_list = sqlSession.selectList("notice.notice_list", searchNum);
		
		System.out.println(notice_list.size());
		
		/*DB 연결 전 테스트 코드.
		 * List<noticeVO> notice_list = new ArrayList<noticeVO>();
		 * 
		 * for( int i = 1 ; i <= 300 ; i++) {
		 * 
		 * noticeVO vo = new noticeVO();
		 * 
		 * vo.setM_idx(i); vo.setNotice_category(1); vo.setNotice_content(i +
		 * "텍스트 입니다."); vo.setNotice_date("2020-01-31"); vo.setNotice_idx(i);
		 * vo.setNotice_title(i+"제목입니다."); vo.setNotice_view(0);
		 * 
		 * notice_list.add(vo);
		 * 
		 * }
		 */
		
		return notice_list;
	}
	
	public int noticeCnt() {
		
		int cnt = sqlSession.selectOne("notice.noticeCnt");
		
		return cnt;
		
	}
	
	
	public Map notice_content(int notice_idx) {
		
		Map notice_content = sqlSession.selectOne("notice.notice_content", notice_idx);
		
		return notice_content;
	}
	
	public List<noticeVO> notice_search(String Searchtype, String SearchValue) {
		
		List<noticeVO> notice_list = null;
		
		/*
		 * Map search = new HashMap();
		 * 
		 * search.put("SearchColumm", SearchColumm); System.out.println("컬럼" +
		 * search.get("SearchColumm")); search.put("SearchValue", SearchValue);
		 * System.out.println("값" + search.get("SearchValue"));
		 */
		if( Searchtype.equals("notice_title")) {
			notice_list = sqlSession.selectList("notice.notice_search_title", SearchValue);
		}
		else if( Searchtype.equals("notice_content") ) {
			notice_list = sqlSession.selectList("notice.notice_search_content", SearchValue);
		}
		else if( Searchtype.equals("notice_all") ) {
			notice_list = sqlSession.selectList("notice.notice_search_all", SearchValue);
		}
		
		return notice_list;
	}
	
	/*
	 * public List<noticeVO> notice_search_all(String SearchValue) {
	 * 
	 * List<noticeVO> notice_list = null;
	 * 
	 * notice_list = sqlSession.selectList("notice.notice_search_all", SearchValue);
	 * 
	 * return notice_list; }
	 */
	
	public int notice_view(int notice_idx) {
		
		int result = sqlSession.update("notice.notice_view", notice_idx);
		
		return result;
	}
	
}
