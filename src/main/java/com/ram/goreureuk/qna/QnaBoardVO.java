package com.ram.goreureuk.qna;

import java.util.Date;

public class QnaBoardVO {
	private String qna_bdcode;
	private String qna_mmcode;
	private String qna_mmid;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private String qna_code;
	public String getQna_bdcode() {
		return qna_bdcode;
	}
	public void setQna_bdcode(String qna_bdcode) {
		this.qna_bdcode = qna_bdcode;
	}
	public String getQna_mmcode() {
		return qna_mmcode;
	}
	public void setQna_mmcode(String qna_mmcode) {
		this.qna_mmcode = qna_mmcode;
	}
	public String getQna_mmid() {
		return qna_mmid;
	}
	public void setQna_mmid(String qna_mmid) {
		this.qna_mmid = qna_mmid;
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
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_code() {
		return qna_code;
	}
	public void setQna_code(String qna_code) {
		this.qna_code = qna_code;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_bdcode=" + qna_bdcode + ", qna_mmcode=" + qna_mmcode + ", qna_mmid=" + qna_mmid
				+ ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", qna_date=" + qna_date + ", qna_code="
				+ qna_code + "]";
	}
	
}
