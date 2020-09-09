package com.ram.goreureuk.member;

import java.util.HashMap;

public interface MemberDAO {
	public MemberVO selectByEmail(String email);
 
    public MemberVO selectById(String id);
    
    public MemberVO selectByName(String name);
 
    public void insertUser(signUpVO signupvo);
    
    public void updateDisabled(String username);
    
    public void updateFailureCount(String username);
    
    public int checkFailureCount(String username);
    
    public void updateFailureCountReset(String username);
    
    public String findid(String MM_EMAIL);
    
    public MemberVO findpw(HashMap<String, Object> map);
    
    public void updatepw(HashMap<String, Object> map);
    
    public void inputGoogleInfo(GoogleInfoVO gvo);
    
    public void comparewithDB(GoogleInfoVO gvo);
    
    //회원정보수정
    public void editMemberEmail(signUpVO signupvo);
    public void editMemberName(signUpVO signupvo);

}
