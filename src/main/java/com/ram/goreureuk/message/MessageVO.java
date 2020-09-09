package com.ram.goreureuk.message;

import java.util.Date;

public class MessageVO {
	private String ms_mmcode;
	private String ms_mmid;
	private String ms_content;
	private Date ms_date;
	private String ms_code;
	private int recnt;
	
	public String getMs_mmcode() {
		return ms_mmcode;
	}
	public void setMs_mmcode(String ms_mmcode) {
		this.ms_mmcode = ms_mmcode;
	}
	public String getMs_mmid() {
		return ms_mmid;
	}
	public void setMs_mmid(String ms_mmid) {
		this.ms_mmid = ms_mmid;
	}
	public String getMs_content() {
		return ms_content;
	}
	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}
	public Date getMs_date() {
		return ms_date;
	}
	public void setMs_date(Date ms_date) {
		this.ms_date = ms_date;
	}
	
	public String getMs_code() {
		return ms_code;
	}
	public void setMs_code(String ms_code) {
		this.ms_code = ms_code;
	}
	
	
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	@Override
	public String toString() {
		return "MessageVO [ms_mmcode=" + ms_mmcode + ", ms_mmid=" + ms_mmid + ", ms_content=" + ms_content
				+ ", ms_date=" + ms_date + ", ms_code=" + ms_code + ", recnt=" + recnt + "]";
	}
	
	
}
