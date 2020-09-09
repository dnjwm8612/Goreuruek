package com.ram.goreureuk.member;

public class signUpVO {
	 	private String MM_EMAIL;
	    private String MM_ID;
	    private String MM_NAME;
	    private String MM_PASSWORD;
	    private String checkPw;
	    private String MM_CODE;
	    
	  //비밀번호 확인
	    public boolean isPwEqualToCheckPw() {
	        return MM_PASSWORD.equals(checkPw);
	    }
		public String getMM_EMAIL() {
			return MM_EMAIL;
		}
		public void setMM_EMAIL(String mM_EMAIL) {
			MM_EMAIL = mM_EMAIL;
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
		public String getCheckPw() {
			return checkPw;
		}
		public void setCheckPw(String checkPw) {
			this.checkPw = checkPw;
		}
		public String getMM_CODE() {
			return MM_CODE;
		}
		public void setMM_CODE(String mM_CODE) {
			MM_CODE = mM_CODE;
		}
		@Override
		public String toString() {
			return "signUpVO [MM_EMAIL=" + MM_EMAIL + ", MM_ID=" + MM_ID + ", MM_NAME=" + MM_NAME + ", MM_PASSWORD="
					+ MM_PASSWORD + ", checkPw=" + checkPw + ", MM_CODE=" + MM_CODE + "]";
		}
	
		
		
	    
	  
		
	    
	    
}
