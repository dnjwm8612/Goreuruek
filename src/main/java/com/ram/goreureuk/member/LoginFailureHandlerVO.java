package com.ram.goreureuk.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandlerVO implements AuthenticationFailureHandler{
	
	@Autowired
	private MemberService ms;
	
	private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;
 
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
    	
    	String MM_ID = request.getParameter(loginidname);
        String MM_PASSWORD = request.getParameter(loginpwdname);
        String errormsg = null;

        if(exception instanceof BadCredentialsException) {
        	loginFailureCount(MM_ID);
        	errormsg= "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if(exception instanceof InternalAuthenticationServiceException) {
        	errormsg= "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if(exception instanceof DisabledException) {
        	errormsg="계정이 비활성화되었습니다. 관리자에게 문의하세요.";
        } else if(exception instanceof CredentialsExpiredException) {
        	errormsg="비밀번호 유효기간이 만료 되었습니다. 관리자에게 문의하세요.";
        }
        
        request.setAttribute(loginidname, MM_ID);
        request.setAttribute(loginpwdname, MM_PASSWORD);
        request.setAttribute(errormsgname, errormsg);
 
        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
    }
    
    protected void loginFailureCount(String MM_ID) {
        ms.countFailure(MM_ID);
        int cnt = ms.checkFailureCount(MM_ID);
        if(cnt==8) {
            ms.disabledUsername(MM_ID);
        }
    }
 
    public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }
 
    public String getLoginpwdname() {
        return loginpwdname;
    }
 
    public void setLoginpwdname(String loginpwdname) {
        this.loginpwdname = loginpwdname;
    }
 
    public String getErrormsgname() {
        return errormsgname;
    }
 
    public void setErrormsgname(String errormsgname) {
        this.errormsgname = errormsgname;
    }
 
    public String getDefaultFailureUrl() {
        return defaultFailureUrl;
    }
 
    public void setDefaultFailureUrl(String defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl;
    }

}
