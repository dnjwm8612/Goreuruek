package com.ram.goreureuk.recipe;

public class RecipeLikes {
	private String RCL_CODE;
	private String RCL_RCCODE;
	private String RCL_RCMMID;
	
	public String getRCL_CODE() {
		return RCL_CODE;
	}
	public void setRCL_CODE(String rCL_CODE) {
		RCL_CODE = rCL_CODE;
	}
	public String getRCL_RCCODE() {
		return RCL_RCCODE;
	}
	public void setRCL_RCCODE(String rCL_RCCODE) {
		RCL_RCCODE = rCL_RCCODE;
	}
	public String getRCL_RCMMID() {
		return RCL_RCMMID;
	}
	public void setRCL_RCMMID(String rCL_RCMMID) {
		RCL_RCMMID = rCL_RCMMID;
	}
	@Override
	public String toString() {
		return "RecipeLikes [RCL_CODE=" + RCL_CODE + ", RCL_RCCODE=" + RCL_RCCODE + ", RCL_RCMMID=" + RCL_RCMMID + "]";
	}
	
	
}
