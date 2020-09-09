package com.ram.goreureuk.tipLike;

public class TipBoardLikeVO {
	
	public String tl_tcode;  //게시글 코드
	public String tl_tmmcode;  //회원 코드
	public String tl_tmmid;  //회원 아이디
	public String tl_code;   //좋아요 코드
	public String getTl_tcode() {
		return tl_tcode;
	}
	public void setTl_tcode(String tl_tcode) {
		this.tl_tcode = tl_tcode;
	}
	public String getTl_tmmcode() {
		return tl_tmmcode;
	}
	public void setTl_tmmcode(String tl_tmmcode) {
		this.tl_tmmcode = tl_tmmcode;
	}
	public String getTl_tmmid() {
		return tl_tmmid;
	}
	public void setTl_tmmid(String tl_tmmid) {
		this.tl_tmmid = tl_tmmid;
	}
	public String getTl_code() {
		return tl_code;
	}
	public void setTl_code(String tl_code) {
		this.tl_code = tl_code;
	}
	@Override
	public String toString() {
		return "TipBoardLikeVO [tl_tcode=" + tl_tcode + ", tl_tmmcode=" + tl_tmmcode + ", tl_tmmid=" + tl_tmmid
				+ ", tl_code=" + tl_code + "]";
	}
	
	

}
