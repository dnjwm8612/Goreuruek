package com.ram.goreureuk.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ram.goreureuk.freeboard.FreeBoardLikes;
import com.ram.goreureuk.freeboard.FreeBoardService;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.freeboard.Message;
import com.ram.goreureuk.freeboard.ReplyVO;
import com.ram.goreureuk.member.AlreadyExistingEmailException;
import com.ram.goreureuk.member.AlreadyExistingIdException;
import com.ram.goreureuk.member.AlreadyExistingNameException;
import com.ram.goreureuk.member.MemberService;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.member.RegisterRequestValidator;
import com.ram.goreureuk.member.signUpVO;
import com.ram.goreureuk.message.MessageVO;
import com.ram.goreureuk.messagereply.MessageReplyVO;
import com.ram.goreureuk.recipe.RecipeVO;

@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService mps;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private FreeBoardService service;
	
	//마이페이지 뷰
	@RequestMapping(value="/mypageView")
	public String mypageView(MemberVO mvo,Model model)throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		List<FreeBoardVO> fbvo;
		List<RecipeVO> rcvo;
		List<ReplyVO> frvo;
		List<com.ram.goreureuk.recipe.ReplyVO> rrvo;
		List<FreeBoardLikes> fbl;
		List<FreeBoardVO> fbvoL = null;
		List<RecipeVO> rcL;
		List<RecipeVO> rcvoL = null;
		List<Message> msvo;
		mvo.setMM_ID(name);
		
		//문의 내역 
		List<MyqnaVO> mqvo;

		mqvo = mps.Myqna(name);
		msvo = mps.mypageMessage(name);
		mvo = mps.mypageView(mvo.getMM_ID());
		fbvo = mps.mypageFreeList(mvo.getMM_ID());
		rcvo = mps.mypageRecipeList(mvo.getMM_ID());
		frvo = mps.mypageFreeReply(mvo.getMM_ID());
		rrvo = mps.mypageRecipeReply(mvo.getMM_ID());
		fbl = mps.mypageFreeLikes(mvo.getMM_ID());// 좋아요 코드 불러와서 다시 해당 코드 검색
		for(int i=0;fbl.size()>i;i++) {
			fbvoL=mps.mypageFreeLikesList(fbl.get(i).getFBL_FBCODE());
		}
		rcL = mps.mypageRecipeLikes(mvo.getMM_ID());
		for(int i=0;rcL.size()>i;i++) {
			rcvoL=mps.mypageRecipeLikesList(rcL.get(i).getRCL_RCCODE());
		}
		
		model.addAttribute("myqna", mqvo);
		model.addAttribute("mymessage", msvo);
		model.addAttribute("myrecipelike", rcvoL);
		model.addAttribute("myfreelike", fbvoL);
		model.addAttribute("myrecipereply", rrvo);
		model.addAttribute("myfreereply", frvo);
		model.addAttribute("myrecipe", rcvo);
		model.addAttribute("myfree", fbvo);
		model.addAttribute("myinfo", mvo);
		
		return ("mypage/mypage");
	}
	
	//회원수정창
	@RequestMapping("editMemberView")
	public String editMemberView(Model model)throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		signUpVO vo = mps.editView(name);
		model.addAttribute("signupvo", new signUpVO());//폼 오류 해결
		model.addAttribute("member",vo);
			
		return ("mypage/editMember");
	}
	
	//회원수정
	@RequestMapping("editMember")
	public String editMember(signUpVO signupvo,BindingResult result,Errors errors)throws Exception {
		if(errors.hasErrors()) {
			return ("mypage/editMember");
		}
		try {
			if(signupvo.getMM_EMAIL() != null && signupvo.getMM_EMAIL() != "") {ms.editMemberEmail(signupvo);}
			if(signupvo.getMM_NAME() != null && signupvo.getMM_NAME() != "") {ms.editMemberName(signupvo);}
		} catch (AlreadyExistingEmailException e) {
			errors.rejectValue("MM_EMAIL", "duplicate", "이미 가입된 이메일입니다.");
			return ("mypage/editMember");
		} catch (AlreadyExistingNameException e) {
			errors.rejectValue("MM_NAME", "duplicate", "이미 가입된 닉네임입니다.");
			return ("mypage/editMember");
		}
		return ("redirect:mypageView");
	}
	
	//비밀번호수정창
	@RequestMapping("editPwView")
	public String editPwView(Model model)throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		signUpVO vo = mps.editView(name);

		model.addAttribute("signupvo", new signUpVO());//폼 오류 해결
		model.addAttribute("member",vo);
		return ("mypage/editPassword");
	}
	
	//비밀번호 수정
	@RequestMapping("editPw")
	public String editPw(signUpVO signupvo,BindingResult result,Errors errors) throws Exception{
		//시큐리티 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		signupvo.setMM_PASSWORD(passwordEncoder.encode(signupvo.getMM_PASSWORD()));

		if(errors.hasErrors()) {
			return ("mypage/editPassword");
		}
		mps.editPw(signupvo);
		
		
		return ("redirect:mypageView");
	}
	
	//회원탈퇴
	@RequestMapping("DeleteUser")
	public String DeleteUser(Model model) throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		mps.DeleteUser(name);
		
		model.addAttribute("MemberVO", new MemberVO());
		return ("member/loginView");
	}
	
	//쪽지보내기
	@RequestMapping(value="/message")
	public String message(Message message)throws Exception{
		System.out.println(message);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		message.setSENDER_MMID(name);
		service.freeMessageInsert(message);
		return ("redirect:mypageView");
	}
}
