package com.ram.goreureuk.member;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterRequestValidator implements Validator{

	private static final String emailRegExp =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    private Pattern pattern;
 
    public RegisterRequestValidator() {
        pattern = Pattern.compile(emailRegExp);
    }
 
    @Override
    public boolean supports(Class<?> clazz) {
        return signUpVO.class.isAssignableFrom(clazz);
    }
 
    @Override
    public void validate(Object target, Errors errors) {
    	signUpVO regReq = (signUpVO) target;
        
        if(regReq.getMM_EMAIL() == null || regReq.getMM_EMAIL().trim().isEmpty()) {
            errors.rejectValue("MM_EMAIL", "required", "필수 정보 입니다.");
        } else {
            Matcher matcher = pattern.matcher(regReq.getMM_EMAIL());
            if(!matcher.matches()) {
                errors.rejectValue("MM_EMAIL", "bad", "올바르지 않는 형식입니다.");
            }
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MM_ID","required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MM_NAME", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MM_PASSWORD", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "checkPw", "required", "필수 정보 입니다.");
        if(!regReq.getMM_PASSWORD().isEmpty()) {
            if(!regReq.isPwEqualToCheckPw()) {
                errors.rejectValue("checkPw", "nomatch", "비밀번호가 일치하지 않습니다.");
            }
        }
    }
    
}
