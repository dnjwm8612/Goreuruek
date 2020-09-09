package com.ram.goreureuk.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	
	public void register(signUpVO signupvo) throws Exception;

	public void countFailure(String MM_ID);
	 
	public int checkFailureCount(String MM_ID);
	 
	public void disabledUsername(String MM_ID);
	
	public void resetFailureCnt(String MM_ID);
	
	public String findid(HttpServletResponse response, String MM_EMAIL) throws IOException;
	
	public MemberVO findpw(HashMap<String, Object> map) throws IOException;
	
	public void updatepw(HashMap<String, Object> map);
	
	public void inputGoogleInfo(GoogleInfoVO gvo);
	 
	public void comparewithDB(GoogleInfoVO gvo);

	//이메일변경
	public void editMemberEmail(signUpVO signupvo) throws Exception;
	//닉네임변경
	public void editMemberName(signUpVO signupvo) throws Exception;

}
