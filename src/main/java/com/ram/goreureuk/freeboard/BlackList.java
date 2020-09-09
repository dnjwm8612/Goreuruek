package com.ram.goreureuk.freeboard;

import java.util.Date;

public class BlackList {
	private String BL_MMID;
	private Date BL_DATE;
	private String BL_REASON;
	private String BL_REPORTER;
	
	
	
	public String getBL_REPORTER() {
		return BL_REPORTER;
	}
	public void setBL_REPORTER(String bL_REPORTER) {
		BL_REPORTER = bL_REPORTER;
	}
	public String getBL_MMID() {
		return BL_MMID;
	}
	public void setBL_MMID(String bL_MMID) {
		BL_MMID = bL_MMID;
	}
	public Date getBL_DATE() {
		return BL_DATE;
	}
	public void setBL_DATE(Date bL_DATE) {
		BL_DATE = bL_DATE;
	}
	public String getBL_REASON() {
		return BL_REASON;
	}
	public void setBL_REASON(String bL_REASON) {
		BL_REASON = bL_REASON;
	}
	@Override
	public String toString() {
		return "BlackList [BL_MMID=" + BL_MMID + ", BL_DATE=" + BL_DATE + ", BL_REASON=" + BL_REASON + ", BL_REPORTER="
				+ BL_REPORTER + "]";
	}

	
	
	
}
