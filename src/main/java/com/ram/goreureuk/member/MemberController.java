package com.ram.goreureuk.member;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService ms;

	//회원가입창
	@RequestMapping("signUpView")
	public String signUpView(Model model)throws Exception {
		model.addAttribute("signUpVO", new signUpVO());//폼 오류 해결
		return ("member/signUp");
	}

	//회원가입 
	@RequestMapping("signCheck")
	public String signCheck(signUpVO signupvo, Errors errors,Model model) throws Exception{
		new RegisterRequestValidator().validate(signupvo, errors);
		//시큐리티 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		signupvo.setMM_PASSWORD(passwordEncoder.encode(signupvo.getMM_PASSWORD()));

		if(errors.hasErrors()) {
			return ("member/signUp");
		}
		try {
			ms.register(signupvo);
			//닉네임 중복확인 에러안잡힘 해결하기
		} catch (AlreadyExistingEmailException e) {
			errors.rejectValue("MM_EMAIL", "duplicate", "이미 가입된 이메일입니다.");
			return ("member/signUp");
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("MM_ID", "duplicate", "이미 가입된 아이디입니다.");
			return ("member/signUp");
		} catch (AlreadyExistingNameException e) {
			errors.rejectValue("MM_NAME", "duplicate", "이미 가입된 닉네임입니다.");
			return ("member/signUp");
		}
		model.addAttribute("MemberVO", new MemberVO());
		return ("member/loginView");
	}

	//로그인 창
	@RequestMapping("loginView")
	public String loginView(Model model)throws Exception {
		model.addAttribute("MemberVO", new MemberVO());
		return ("member/loginView");
	}
	
//	 @RequestMapping("/access_denied_page")
//	    public String accessDeniedPage() throws Exception {
//	        return "access_denied_page";
//	    }
	
	// 아이디 찾기 폼
	@RequestMapping(value = "/findid")
	public String findid() throws Exception{
		return "/member/forgotid";
	}
		
	// 아이디 찾기
	@RequestMapping(value = "/findid2", method = RequestMethod.POST)
	public String findid2(HttpServletResponse response, @RequestParam String MM_EMAIL, Model md) throws Exception{
		String id = ms.findid(response, MM_EMAIL);
		md.addAttribute("id", id);
		return "/member/resultid";
	}
	
	// 비번 찾기 널오류뜸 
		@RequestMapping(value = "/findpw", method = RequestMethod.POST)
		public String findpw(HttpServletResponse response, @RequestParam String MM_EMAIL,@RequestParam String MM_ID, Model md) throws Exception{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("MM_EMAIL", MM_EMAIL);
			map.put("MM_ID", MM_ID);
			MemberVO vo = ms.findpw(map);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (vo.getMM_ID() == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("</script>");
				out.close();
				return null;
			}else if(vo.getMM_EMAIL() == null) {
				out.println("<script>");
				out.println("alert('가입된 이메일이 없습니다.');");
				out.println("</script>");
				out.close();
				return null;
			}
			
			md.addAttribute("id",vo.getMM_ID());
			return "member/resultpw";
		}
		
		// 비번 재설정
		@RequestMapping(value = "/updatepw", method = RequestMethod.POST)
		public String updatepw(@RequestParam String MM_PASSWORD,@RequestParam String MM_ID) throws Exception{
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("MM_PASSWORD", passwordEncoder.encode(MM_PASSWORD));
			map.put("MM_ID", MM_ID);
			ms.updatepw(map);
			return "member/resultpw";
		}	
		
		
		@RequestMapping("receiveCode")
		public String receiveCode()throws Exception {
			return ("member/receiveCode");
		}
		
		@RequestMapping("googleLogin")
		public String googleLogin()throws Exception {
			return ("member/googleLogin");
		}
		
		@RequestMapping("refreshToken")
		public String refreshToken()throws Exception {
			return ("member/refreshToken");
		}
		
		@ResponseBody
		@RequestMapping(value="inputGoogleInfo", method= {RequestMethod.POST,RequestMethod.GET})
		public String inputGoogleInfo(@RequestParam String displayName , @RequestParam String emailAddress)throws Exception {
			GoogleInfoVO gvo = new GoogleInfoVO();
			gvo.setDisplayName(displayName);
			gvo.setEmailAddress(emailAddress);
			ms.inputGoogleInfo(gvo);
		
			
			return "true";
		}
		
		@RequestMapping(value="comparewithDB")
		public String comparewithDB(@RequestParam String displayName , @RequestParam String emailAddress, Model model)throws Exception {
			GoogleInfoVO gvo = new GoogleInfoVO();
			gvo.setDisplayName(displayName);
			gvo.setEmailAddress(emailAddress);
			ms.comparewithDB(gvo);
			model.addAttribute("MemberVO", new MemberVO());
			model.addAttribute("emailAddress", gvo);
			
			return "member/loginView";
		}

}
