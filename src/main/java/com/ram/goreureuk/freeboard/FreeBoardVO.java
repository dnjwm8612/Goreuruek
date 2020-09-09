package com.ram.goreureuk.freeboard;

import java.util.Date;

public class FreeBoardVO {
	private String FB_CODE;
	private String FBC_FBCODE;
	private String FB_MMID;
	private Date FB_DATE;
	private String FB_LIKES;
	private String FBC_CONTENT;
	private String FBC_CONTENT2;
	private String FBC_TAG;
	private String FBL_CODE;
	private String FBL_FBCODE;
	private String FBL_FBMMID;
	private int boardlike;
	private int bno;


	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBoardlike() {
		return boardlike;
	}
	public void setBoardlike(int boardlike) {
		this.boardlike = boardlike;
	}
	public String getFBL_CODE() {
		return FBL_CODE;
	}
	public void setFBL_CODE(String fBL_CODE) {
		FBL_CODE = fBL_CODE;
	}
	public String getFBL_FBCODE() {
		return FBL_FBCODE;
	}
	public void setFBL_FBCODE(String fBL_FBCODE) {
		FBL_FBCODE = fBL_FBCODE;
	}
	public String getFBL_FBMMID() {
		return FBL_FBMMID;
	}
	public void setFBL_FBMMID(String fBL_FBMMID) {
		FBL_FBMMID = fBL_FBMMID;
	}
	public String getFBC_FBCODE() {
		return FBC_FBCODE;
	}
	public void setFBC_FBCODE(String fBC_FBCODE) {
		FBC_FBCODE = fBC_FBCODE;
	}
	public String getFBC_TAG() {
		return FBC_TAG;
	}
	public void setFBC_TAG(String fBC_TAG) {
		FBC_TAG = fBC_TAG;
	}
	public String getFB_CODE() {
		return FB_CODE;
	}
	public void setFB_CODE(String fB_CODE) {
		FB_CODE = fB_CODE;
	}
	public String getFB_MMID() {
		return FB_MMID;
	}
	public void setFB_MMID(String fB_MMID) {
		FB_MMID = fB_MMID;
	}
	public Date getFB_DATE() {
		return FB_DATE;
	}
	public void setFB_DATE(Date fB_DATE) {
		FB_DATE = fB_DATE;
	}
	public String getFB_LIKES() {
		return FB_LIKES;
	}
	public void setFB_LIKES(String fB_LIKES) {
		FB_LIKES = fB_LIKES;
	}
	public String getFBC_CONTENT() {
		return FBC_CONTENT;
	}
	public void setFBC_CONTENT(String fBC_CONTENT) {
		FBC_CONTENT = fBC_CONTENT;
	}
	public String getFBC_CONTENT2() {
		return FBC_CONTENT2;
	}
	public void setFBC_CONTENT2(String fBC_CONTENT2) {
		FBC_CONTENT2 = fBC_CONTENT2;
	}
	@Override
	public String toString() {
		return "FreeBoardVO [FB_CODE=" + FB_CODE + ", FBC_FBCODE=" + FBC_FBCODE + ", FB_MMID=" + FB_MMID + ", FB_DATE="
				+ FB_DATE + ", FB_LIKES=" + FB_LIKES + ", FBC_CONTENT=" + FBC_CONTENT + ", FBC_CONTENT2=" + FBC_CONTENT2
				+ ", FBC_TAG=" + FBC_TAG + ", FBL_CODE=" + FBL_CODE + ", FBL_FBCODE=" + FBL_FBCODE + ", FBL_FBMMID="
				+ FBL_FBMMID + ", boardlike=" + boardlike + ", bno=" + bno + "]";
	}






	
	
	
}
