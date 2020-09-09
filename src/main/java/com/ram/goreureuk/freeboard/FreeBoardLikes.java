package com.ram.goreureuk.freeboard;

public class FreeBoardLikes {
	private String FBL_CODE;
	private String FBL_FBCODE;
	private String FBL_FBMMID;
	
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
	@Override
	public String toString() {
		return "FreeBoardLikes [FBL_CODE=" + FBL_CODE + ", FBL_FBCODE=" + FBL_FBCODE + ", FBL_FBMMID=" + FBL_FBMMID
				+ "]";
	}

}
