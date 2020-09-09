package com.ram.goreureuk.member;

public class GoogleInfoVO {
	String displayName;
	String emailAddress;
	String MM_CODE;
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getMM_CODE() {
		return MM_CODE;
	}
	public void setMM_CODE(String mM_CODE) {
		MM_CODE = mM_CODE;
	}
	@Override
	public String toString() {
		return "GoogleInfoVO [displayName=" + displayName + ", emailAddress=" + emailAddress + ", MM_CODE=" + MM_CODE
				+ "]";
	}
}
