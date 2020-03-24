package vo.shop;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ShopVO {
	private int product_idx;
	private String pro_name;
	private String p_content;
	private int pro_price;
	private MultipartFile product_photo;
	private String file_name;
	private String pro_category;
	private String pro_publisher_name;
	private String language;
	private int p_saleprice;
	private int sale_rate; //할인률
	private String pro_youtube1;
	private String pro_youtube2;
	private String pro_youtube3;
	private String developer;
	private String platform;

	
	public int getSale_rate() {
		//(정가 - 할인가) / 정가 * 100
		//(1000 - 200) / 1000 * 100 = 80%
		if(pro_price == 0) {
			return 0;
		}
		return (int)((pro_price - p_saleprice)/(double)pro_price * 100);
	}
	
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
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
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
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
	
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	public String getPro_publisher_name() {
		return pro_publisher_name;
	}
	public void setPro_publisher_name(String pro_publisher_name) {
		this.pro_publisher_name = pro_publisher_name;
	}
	
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public String getPro_youtube1() {
		return pro_youtube1;
	}

	public void setPro_youtube1(String pro_youtube1) {
		this.pro_youtube1 = pro_youtube1;
	}

	public String getPro_youtube2() {
		return pro_youtube2;
	}

	public void setPro_youtube2(String pro_youtube2) {
		this.pro_youtube2 = pro_youtube2;
	}

	public String getPro_youtube3() {
		return pro_youtube3;
	}

	public void setPro_youtube3(String pro_youtube3) {
		this.pro_youtube3 = pro_youtube3;
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}
}
