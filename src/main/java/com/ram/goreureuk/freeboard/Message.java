package com.ram.goreureuk.freeboard;

import java.util.Date;

public class Message {
	private String MS_CODE;
	private String TARGET_MMID;
	private String SENDER_MMID;
	private String MS_CONTENT;
	private Date senddate;
	public String getMS_CODE() {
		return MS_CODE;
	}
	public void setMS_CODE(String mS_CODE) {
		MS_CODE = mS_CODE;
	}
	public String getTARGET_MMID() {
		return TARGET_MMID;
	}
	public void setTARGET_MMID(String tARGET_MMID) {
		TARGET_MMID = tARGET_MMID;
	}
	public String getSENDER_MMID() {
		return SENDER_MMID;
	}
	public void setSENDER_MMID(String sENDER_MMID) {
		SENDER_MMID = sENDER_MMID;
	}
	public String getMS_CONTENT() {
		return MS_CONTENT;
	}
	public void setMS_CONTENT(String mS_CONTENT) {
		MS_CONTENT = mS_CONTENT;
	}
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
	@Override
	public String toString() {
		return "Message [MS_CODE=" + MS_CODE + ", TARGET_MMID=" + TARGET_MMID + ", SENDER_MMID=" + SENDER_MMID
				+ ", MS_CONTENT=" + MS_CONTENT + ", senddate=" + senddate + "]";
	}
	
	
}
