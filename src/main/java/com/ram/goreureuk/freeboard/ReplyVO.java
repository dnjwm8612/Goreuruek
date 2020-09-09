package com.ram.goreureuk.freeboard;

import java.util.Date;

public class ReplyVO {
	private String FBR_FBCODE;
	private String FBR_CODE;
	private String FBR_FBMMID;
	private Date FBR_DATE;
	private String FBR_CONTENT;

	

	public String getFBR_FBCODE() {
		return FBR_FBCODE;
	}
	public void setFBR_FBCODE(String fBR_FBCODE) {
		FBR_FBCODE = fBR_FBCODE;
	}
	public String getFBR_CODE() {
		return FBR_CODE;
	}
	public void setFBR_CODE(String fBR_CODE) {
		FBR_CODE = fBR_CODE;
	}
	public String getFBR_FBMMID() {
		return FBR_FBMMID;
	}
	public void setFBR_FBMMID(String fBR_FBMMID) {
		FBR_FBMMID = fBR_FBMMID;
	}
	public Date getFBR_DATE() {
		return FBR_DATE;
	}
	public void setFBR_DATE(Date fBR_DATE) {
		FBR_DATE = fBR_DATE;
	}
	public String getFBR_CONTENT() {
		return FBR_CONTENT;
	}
	public void setFBR_CONTENT(String fBR_CONTENT) {
		FBR_CONTENT = fBR_CONTENT;
	}
	@Override
	public String toString() {
		return "ReplyVO [FBR_FBCODE=" + FBR_FBCODE + ", FBR_CODE=" + FBR_CODE + ", FBR_FBMMID=" + FBR_FBMMID
				+ ", FBR_DATE=" + FBR_DATE + ", FBR_CONTENT=" + FBR_CONTENT + "]";
	}


	
	
	
	
	
}
