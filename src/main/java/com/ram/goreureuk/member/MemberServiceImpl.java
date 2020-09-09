package com.ram.goreureuk.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO bd;

	@Override
	public void register(signUpVO signupvo) throws Exception {
		MemberVO MM_EMAIL = bd.selectByEmail(signupvo.getMM_EMAIL());
        if(MM_EMAIL!=null) {
            throw new AlreadyExistingEmailException(signupvo.getMM_EMAIL()+" is duplicate email.");
        }
        MemberVO MM_ID = bd.selectById(signupvo.getMM_ID());
        if(MM_ID!=null) {
            throw new AlreadyExistingIdException(signupvo.getMM_ID()+" is duplicate id.");
        }
        MemberVO MM_NAME = bd.selectByName(signupvo.getMM_NAME());
        if(MM_NAME!=null) {
            throw new AlreadyExistingNameException(signupvo.getMM_NAME()+" is duplicate name.");
        }
        bd.insertUser(signupvo);
	}

	@Override
	public void countFailure(String MM_ID) {
		bd.updateFailureCount(MM_ID);
		
	}

	@Override
	public int checkFailureCount(String MM_ID) {
		 return bd.checkFailureCount(MM_ID);
	}

	@Override
	public void disabledUsername(String MM_ID) {
		bd.updateDisabled(MM_ID);
	}

	@Override
	public void resetFailureCnt(String MM_ID) {
		bd.updateFailureCountReset(MM_ID);
	}
	
	@Override
	public String findid(HttpServletResponse response, String MM_EMAIL) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = bd.findid(MM_EMAIL);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override
	public MemberVO findpw(HashMap<String, Object> map) throws IOException {
		
		return bd.findpw(map);
	}

	@Override
	public void updatepw(HashMap<String, Object> map) {
		bd.updatepw(map);
	}
	
	@Override
	public void inputGoogleInfo(GoogleInfoVO gvo) {
		bd.inputGoogleInfo(gvo);
		
	}

	@Override
	public void comparewithDB(GoogleInfoVO gvo) {
		bd.comparewithDB(gvo);
		
	}

	@Override
	public void editMemberEmail(signUpVO signupvo) throws Exception {
		MemberVO MM_ID = bd.selectById(signupvo.getMM_EMAIL());
        if(MM_ID!=null) {
            throw new AlreadyExistingIdException(signupvo.getMM_EMAIL()+" is duplicate id.");
        }
        bd.editMemberEmail(signupvo);
	}

	@Override
	public void editMemberName(signUpVO signupvo) throws Exception {
		MemberVO MM_ID = bd.selectById(signupvo.getMM_NAME());
        if(MM_ID!=null) {
            throw new AlreadyExistingIdException(signupvo.getMM_NAME()+" is duplicate id.");
        }
        bd.editMemberName(signupvo);
	}

	
}
