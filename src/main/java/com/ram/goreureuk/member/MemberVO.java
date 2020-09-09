package com.ram.goreureuk.member;

import java.util.Date;

public class MemberVO {
	private String MM_CODE;
	private String MM_ID;
	private String MM_NAME;
	private String MM_PASSWORD;
	private String MM_EMAIL;
	private String MM_AUTH;
	private Date MM_REGDATE;
	private String MM_ENABLED;
	private boolean rememberId;
	
	//비밀번호 확인(로그인시)
    public boolean matchPassword(String mM_PASSWORD) {
        return this.MM_PASSWORD.equals(mM_PASSWORD);
    }
    
    
    
	public String getMM_ENABLED() {
		return MM_ENABLED;
	}



	public void setMM_ENABLED(String mM_ENABLED) {
		MM_ENABLED = mM_ENABLED;
	}



	public String getMM_CODE() {
		return MM_CODE;
	}
	public void setMM_CODE(String mM_CODE) {
		MM_CODE = mM_CODE;
	}
	public String getMM_ID() {
		return MM_ID;
	}
	public void setMM_ID(String mM_ID) {
		MM_ID = mM_ID;
	}
	public String getMM_NAME() {
		return MM_NAME;
	}
	public void setMM_NAME(String mM_NAME) {
		MM_NAME = mM_NAME;
	}
	public String getMM_PASSWORD() {
		return MM_PASSWORD;
	}
	public void setMM_PASSWORD(String mM_PASSWORD) {
		MM_PASSWORD = mM_PASSWORD;
	}
	public String getMM_EMAIL() {
		return MM_EMAIL;
	}
	public void setMM_EMAIL(String mM_EMAIL) {
		MM_EMAIL = mM_EMAIL;
	}
	public String getMM_AUTH() {
		return MM_AUTH;
	}

	public void setMM_AUTH(String mM_AUTH) {
		MM_AUTH = mM_AUTH;
	}

	public Date getMM_REGDATE() {
		return MM_REGDATE;
	}
	public void setMM_REGDATE(Date mM_REGDATE) {
		MM_REGDATE = mM_REGDATE;
	}
	public boolean isRememberId() {
		return rememberId;
	}
	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}



	@Override
	public String toString() {
		return "MemberVO [MM_CODE=" + MM_CODE + ", MM_ID=" + MM_ID + ", MM_NAME=" + MM_NAME + ", MM_PASSWORD="
				+ MM_PASSWORD + ", MM_EMAIL=" + MM_EMAIL + ", MM_AUTH=" + MM_AUTH + ", MM_REGDATE=" + MM_REGDATE
				+ ", MM_ENABLED=" + MM_ENABLED + ", rememberId=" + rememberId + "]";
	}




	
	
	
	
}
