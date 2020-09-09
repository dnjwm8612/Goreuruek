package com.ram.goreureuk.recipe;

import java.util.Date;

public class ReplyVO {
	private String RCR_RCCODE;
	private String RCR_CODE;
	private String RCR_RCMMID;
	private Date RCR_DATE;
	private String RCR_CONTENT;
	private int resultCnt;
	
	
	
	public int getResultCnt() {
		return resultCnt;
	}
	public void setResultCnt(int resultCnt) {
		this.resultCnt = resultCnt;
	}
	public String getRCR_RCCODE() {
		return RCR_RCCODE;
	}
	public void setRCR_RCCODE(String rCR_RCCODE) {
		RCR_RCCODE = rCR_RCCODE;
	}
	public String getRCR_CODE() {
		return RCR_CODE;
	}
	public void setRCR_CODE(String rCR_CODE) {
		RCR_CODE = rCR_CODE;
	}
	public String getRCR_RCMMID() {
		return RCR_RCMMID;
	}
	public void setRCR_RCMMID(String rCR_RCMMID) {
		RCR_RCMMID = rCR_RCMMID;
	}
	public Date getRCR_DATE() {
		return RCR_DATE;
	}
	public void setRCR_DATE(Date rCR_DATE) {
		RCR_DATE = rCR_DATE;
	}
	public String getRCR_CONTENT() {
		return RCR_CONTENT;
	}
	public void setRCR_CONTENT(String rCR_CONTENT) {
		RCR_CONTENT = rCR_CONTENT;
	}
	@Override
	public String toString() {
		return "ReplyVO [RCR_RCCODE=" + RCR_RCCODE + ", RCR_CODE=" + RCR_CODE + ", RCR_RCMMID=" + RCR_RCMMID
				+ ", RCR_DATE=" + RCR_DATE + ", RCR_CONTENT=" + RCR_CONTENT + ", resultCnt=" + resultCnt + "]";
	}

	
	
}
