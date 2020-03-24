package vo.shop;

import org.springframework.web.multipart.MultipartFile;

public class CartVO {
	
	private int c_idx;
	private int product_idx;
	private String pro_name;
	private int pro_price;
	private MultipartFile product_photo;
	private String file_name;
	private int u_idx;
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}	
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public MultipartFile getProduct_photo() {
		return product_photo;
	}
	public void setProduct_photo(MultipartFile product_photo) {
		this.product_photo = product_photo;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
}
