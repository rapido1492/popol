package vo.shop;

import org.springframework.web.multipart.MultipartFile;

public class qnaVO {

	private int qna_idx, m_idx, qna_category;
	
	private String 
	
	qna_title,
	qna_content,
	qna_photo1,
	qna_photo2,
	qna_photo3,
	qna_answer;

	private MultipartFile photo1, photo2, photo3;

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getQna_category() {
		return qna_category;
	}

	public void setQna_category(int qna_category) {
		this.qna_category = qna_category;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_photo1() {
		return qna_photo1;
	}

	public void setQna_photo1(String qna_photo1) {
		this.qna_photo1 = qna_photo1;
	}

	public String getQna_photo2() {
		return qna_photo2;
	}

	public void setQna_photo2(String qna_photo2) {
		this.qna_photo2 = qna_photo2;
	}

	public String getQna_photo3() {
		return qna_photo3;
	}

	public void setQna_photo3(String qna_photo3) {
		this.qna_photo3 = qna_photo3;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public MultipartFile getPhoto1() {
		return photo1;
	}

	public void setPhoto1(MultipartFile photo1) {
		this.photo1 = photo1;
	}

	public MultipartFile getPhoto2() {
		return photo2;
	}

	public void setPhoto2(MultipartFile photo2) {
		this.photo2 = photo2;
	}

	public MultipartFile getPhoto3() {
		return photo3;
	}

	public void setPhoto3(MultipartFile photo3) {
		this.photo3 = photo3;
	}
	
	
	
	
	
}
