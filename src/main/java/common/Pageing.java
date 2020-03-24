package common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Pageing {
	// 현재 목록의 페이지, 게시물의 총 갯수, 게시물이 표시될 갯수, 표시될 블록 갯수
	public static Map pageinfo(int page, int listCnt, int listSize, int rangeSize) {

		// 현재 블록
		int range;
		// 총 페이지 갯수
		int pageCnt;
		// 시작 페이지
		int startPage;
		// 게시판 시작 번호
		int startList;
		// 게시판 끝 번호
		int endList;
		// 끝 페이지
		int endPage;
		// 이전 페이지 존재 유무
		boolean prev;
		// 다음 페이지 존재 유무
		boolean next;

		if (page < 11) {
			range = 1;
		} else {
			range = (int) Math.ceil(page * 0.1);
		}

		Map pageinfo = new HashMap();

		// 전체 페이지수
		pageCnt = (int) Math.ceil(listCnt / listSize);
		pageinfo.put("pageCnt", pageCnt);
		System.out.println("전체 페이지 수" + pageCnt);
		
		// 시작 페이지
		startPage = ((range - 1) * rangeSize) + 1;
		pageinfo.put("startPage", startPage);
		System.out.println("시작 블록 : " +  startPage);
		
		// 끝 페이지
		endPage = range * rangeSize;
		
		if(pageCnt <= endPage) {
			endPage = pageCnt;
		}
		if(endPage == 0) {
			endPage = 1;
		}
		
		pageinfo.put("endPage", endPage);
		System.out.println("끝 블록 : " +  endPage);

		// 게시판 시작번호
		/* startList = (page - 1) * listSize; */
		int num = 0;
		//1페이지일 경우 끝 자리 부터 나와야 하므로 굳이 차감 할 필요가 없으.
		if (page == 1) {
			num = 0;
		} 
		else {
			num = (page * 10) - 10;
		}
		startList = listCnt - num;
		pageinfo.put("startList", startList);
		System.out.println("게시판 시작번호"+startList);
		
		//게시판 끝 번호
		endList = startList - listSize;
		if( endList <= 1) {
			endList = 1;
		}
		
		pageinfo.put("endList", endList);
		System.out.println("게시판 끝 번호" + endList);

		// 이전 버튼 상태
		prev = range == 1 ? false : true;
		pageinfo.put("prev", prev);

		// 다음 버튼 상태
		next = true;
		
		if(endPage >= pageCnt) {
			next = false;
		}
		
		pageinfo.put("next", next);
		
		return pageinfo;
	}

}
