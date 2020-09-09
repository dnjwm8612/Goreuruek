/*	TIP BOARD TABLE		*
팁 게시판 고유번호       t_bdcode
팁 게시글 번호             t_code
팁 게시글 작성자 코드    t_mmcode
팁 게시글 작성자 아이디  t_mmid
팁 게시글 제목              t_title
팁 게시글 작성날짜       t_date
팁 게시글 좋아요        t_likes	*/

package com.ram.goreureuk.tip;


public class TipBoardVO {
	public String t_bdcode;
	public String t_code;
	public String t_mmcode;
	public String t_mmid;	
	public String t_title;
	public String tc_content;
	public String t_date;
	public int t_likes;
	public int t_view;
	public int t_cnt;
	
	
	
	
	public int getT_cnt() {
		return t_cnt;
	}
	public void setT_cnt(int t_cnt) {
		this.t_cnt = t_cnt;
	}
	public int getT_view() {
		return t_view;
	}
	public void setT_view(int t_view) {
		this.t_view = t_view;
	}
	public String getTc_content() {
		return tc_content;
	}
	public void setTc_content(String tc_content) {
		this.tc_content = tc_content;
	}
	
	public String getT_bdcode() {
		return t_bdcode;
	}
	public void setT_bdcode(String t_bdcode) {
		this.t_bdcode = t_bdcode;
	}
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getT_mmcode() {
		return t_mmcode;
	}
	public void setT_mmcode(String t_mmcode) {
		this.t_mmcode = t_mmcode;
	}
	public String getT_mmid() {
		return t_mmid;
	}
	public void setT_mmid(String t_mmid) {
		this.t_mmid = t_mmid;
	}
	public String getT_title() {
		return t_title;
	}
	public void setT_title(String t_title) {
		this.t_title = t_title;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public int getT_likes() {
		return t_likes;
	}
	public void setT_likes(int t_likes) {
		this.t_likes = t_likes;
	}
	
	@Override
	public String toString() {
		return "TipBoardVO [t_bdcode=" + t_bdcode + ", t_code=" + t_code + ", t_mmcode=" + t_mmcode + ", t_mmid="
				+ t_mmid + ", t_title=" + t_title + ", tc_content=" + tc_content + ", t_date=" + t_date + ", t_likes="
				+ t_likes + "]";
	}

}
