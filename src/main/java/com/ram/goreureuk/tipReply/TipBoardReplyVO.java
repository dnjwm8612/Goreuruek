package com.ram.goreureuk.tipReply;

public class TipBoardReplyVO {

	public String tr_tcode;
	public String tr_code;
	public String tr_tmmcode;
	public String tr_tmmid;
	public String tr_content;
	public String tr_date;
	
	public String getTr_tcode() {
		return tr_tcode;
	}
	public void setTr_tcode(String tr_tcode) {
		this.tr_tcode = tr_tcode;
	}
	public String getTr_code() {
		return tr_code;
	}
	public void setTr_code(String tr_code) {
		this.tr_code = tr_code;
	}
	public String getTr_tmmcode() {
		return tr_tmmcode;
	}
	public void setTr_tmmcode(String tr_tmmcode) {
		this.tr_tmmcode = tr_tmmcode;
	}
	public String getTr_tmmid() {
		return tr_tmmid;
	}
	public void setTr_tmmid(String tr_tmmid) {
		this.tr_tmmid = tr_tmmid;
	}
	public String getTr_content() {
		return tr_content;
	}
	public void setTr_content(String tr_content) {
		this.tr_content = tr_content;
	}
	public String getTr_date() {
		return tr_date;
	}
	public void setTr_date(String tr_date) {
		this.tr_date = tr_date;
	}
	
	@Override
	public String toString() {
		return "TipBoardReplyVO [tr_tcode=" + tr_tcode + ", tr_code=" + tr_code + ", tr_tmmcode=" + tr_tmmcode
				+ ", tr_tmmid=" + tr_tmmid + ", tr_content=" + tr_content + ", tr_date=" + tr_date + "]";
	}
	
	
}
