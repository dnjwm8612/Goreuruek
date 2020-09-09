package com.ram.goreureuk.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ram.goreureuk.freeboard.BlackList;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.mypage.MyPageService;
import com.ram.goreureuk.qna.QnaBoardVO;
import com.ram.goreureuk.recipe.RecipeVO;
import com.ram.goreureuk.tip.TipBoardVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService as;
	
	//관리자 페이지 첫화면
	@RequestMapping("adminView")
	public String adminView(Model model) throws Exception{
		List<BlackList> bl = as.reportView();		
		model.addAttribute("report",bl);		
		return ("admin/admin");
	}
	
	//관리자 페이지 첫화면
	@RequestMapping("adminReportReuslt")
	public String adminReportReuslt(@RequestParam String MM_ID) throws Exception{		
		as.adminReportReuslt(MM_ID);						
		return ("admin/admin");
	}
	
	//유저 관리 뷰
	@RequestMapping("adminUser")
	public String adminUser(Model model) throws Exception{		
		List<MemberVO> mvo = as.adminUser();
		model.addAttribute("user", mvo);
		return ("admin/adminUser");
	}
	//유저 삭제
	@RequestMapping("adminDelUser")
	public String adminDelUser(HttpServletResponse response,@RequestParam String MM_CODE) throws Exception{			
		as.adminDelUser(MM_CODE);	
		return ("redirect:adminUser");
	}
	
	//게시판 관리뷰 
	@RequestMapping("adminBoard")
	public String adminBoard(Model model) throws Exception{		
		List<FreeBoardVO> fbvo = as.freeBoardView();
		List<RecipeVO> rcvo = as.recipeView();
		List<TipBoardVO> tbvo = as.tipView();
		List<QnaBoardVO> qbvo = as.qnaView();
		
		model.addAttribute("qna", qbvo);
		model.addAttribute("tip", tbvo);
		model.addAttribute("recipe", rcvo);
		model.addAttribute("free",fbvo);
		return ("admin/adminBoard");
	}
	
}
