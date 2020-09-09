package com.ram.goreureuk.messagereply;

import java.util.Date;

public class MessageReplyVO {
	private String msr_mscode;
	private String msr_code;
	private String msr_msmmcode;
	private String msr_msmmid;
	private String msr_content;
	private Date msr_date;
	public String getMsr_mscode() {
		return msr_mscode;
	}
	public void setMsr_mscode(String msr_mscode) {
		this.msr_mscode = msr_mscode;
	}
	public String getMsr_code() {
		return msr_code;
	}
	public void setMsr_code(String msr_code) {
		this.msr_code = msr_code;
	}
	public String getMsr_msmmcode() {
		return msr_msmmcode;
	}
	public void setMsr_msmmcode(String msr_msmmcode) {
		this.msr_msmmcode = msr_msmmcode;
	}
	public String getMsr_msmmid() {
		return msr_msmmid;
	}
	public void setMsr_msmmid(String msr_msmmid) {
		this.msr_msmmid = msr_msmmid;
	}
	public String getMsr_content() {
		return msr_content;
	}
	public void setMsr_content(String msr_content) {
		this.msr_content = msr_content;
	}
	public Date getMsr_date() {
		return msr_date;
	}
	public void setMsr_date(Date msr_date) {
		this.msr_date = msr_date;
	}
	
	@Override
	public String toString() {
		return "MessageReplyVO [msr_mscode=" + msr_mscode + ", msr_code=" + msr_code + ", msr_msmmcode=" + msr_msmmcode
				+ ", msr_msmmid=" + msr_msmmid + ", msr_content=" + msr_content + ", msr_date=" + msr_date + "]";
	}
	
	
}
