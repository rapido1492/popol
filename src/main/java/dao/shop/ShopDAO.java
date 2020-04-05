package dao.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.shop.CartVO;
import vo.shop.PublishVO;
import vo.shop.ShopVO;
import vo.shop.UserVO;

public class ShopDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ShopVO> select_productList() {
		List<ShopVO> list = null;
		list = sqlSession.selectList("shop.product_list");
		return list;	
	}
	
	//상품 등록
	public int insert(ShopVO vo) {
		int res = sqlSession.insert("shop.product_insert",vo);
		return res;
	}
	
	//퍼블리셔 목록
	public List<PublishVO> pub_list() {
		List<PublishVO> p_list = null;
		p_list = sqlSession.selectList("shop.publish_list");
		return p_list;
	}
	//상품 페이지
	public ShopVO product_selectOne(int product_idx) {
		ShopVO svo = null;
		svo = sqlSession.selectOne("product_one", product_idx);
		return svo;
	}
	
	public UserVO user_selectOne(int user_idx) {
		UserVO uvo = null;
		uvo = sqlSession.selectOne("user_one",user_idx);
		return uvo;
	}
	
	public int user_cashUpdate(int resultprice) {
		int res = 0;
		res = sqlSession.update("user_cashupdate", resultprice);
		return res;
	}
	public CartVO cart_add(int product_idx) {
		CartVO cvo = null;
		cvo = sqlSession.selectOne("cart_one", product_idx);
		return cvo;
	}
	public int cart_insert(CartVO cvo) {
		int res = 0;
		res = sqlSession.insert("cart_insert", cvo);
		return res;
	}
	
	public List<CartVO> cart_list(int u_idx) {
		List<CartVO> cart_list = null;
		cart_list = sqlSession.selectList("cart_list",u_idx);
		return cart_list;
	}
	
	public CartVO cart_buy(int c_idx) {
		CartVO cvo = null;
		cvo = sqlSession.selectOne("cart_buy",c_idx);
		return cvo;
	}
	
	public int cart_del(int c_idx) {
		int res = 0;
		res = sqlSession.delete("cart_del",c_idx);
		return res;
	}
	
	public List<ShopVO> search_list (String searchValue) {
		List<ShopVO> search_list = null;
		search_list = sqlSession.selectList("search_list", searchValue);
		return search_list;
	}
	
	public int history_insert(ShopVO svo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pro_name", svo.getPro_name());
		System.out.println("dao"+svo.getPro_name());
		map.put("pro_price", svo.getPro_price());
		System.out.println("dao:"+svo.getPro_price());
		int res = sqlSession.insert("history_insert", map);
		return res;
	}
}
