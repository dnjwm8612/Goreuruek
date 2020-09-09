package com.ram.goreureuk.recipe;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ram.goreureuk.freeboard.BlackList;
import com.ram.goreureuk.freeboard.FreeBoardService;
import com.ram.goreureuk.freeboard.UploadFileUtils;


@Controller
@RequestMapping("recipe")
public class RecipeController {
	
	@Resource(name="uploadPath") // root context에 작성
	String uploadPath;
	
	@Inject 
	RecipeService recipeService;
	
	@Autowired
	private FreeBoardService service;
	
	//레시피 작성 페이지 이동
	@RequestMapping(value="recipeWrite")
	public String recipeWhite(Model model)throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		RecipeVO rcvo = new RecipeVO();
		rcvo.setRC_MMID(name);
		model.addAttribute("recipe",rcvo.getRC_MMID());
		return ("recipe/recipeWrite");
	}
	
	//레시피 작성
	@RequestMapping(value="recipeInsert",method = RequestMethod.POST)
	public String recipeInsert(RecipeVO rcvo,HttpServletRequest request,MultipartHttpServletRequest mr)throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName2 = null;
		
		
		List<MultipartFile> filename = mr.getFiles("file");
		//파일 이름 String[]형식으로 가져오기 중요~~!!
		//String[] filetest = mr.getParameterValues("file");
		String[] RCC_STEP = request.getParameterValues("RCC_STEP");
		String[] RCC_STEPINFO = request.getParameterValues("RCC_STEPINFO");
	
		rcvo.setRC_MMID(name);
		recipeService.insert_RC(rcvo);	
		if(filename.size()>0) {
			for(MultipartFile file : filename) { 
				String fileName = file.getOriginalFilename();
				
				fileName2 =  UploadFileUtils.fileUpload(imgUploadPath, fileName, file.getBytes(), ymdPath); 
				
				rcvo.setRCC_STEP(RCC_STEP[filename.indexOf(file)]);
				rcvo.setRCC_STEPINFO(RCC_STEPINFO[filename.indexOf(file)]);
				rcvo.setRCC_SOURCE(File.separator + "imgUpload" + ymdPath + File.separator + fileName2);
	
				recipeService.insert_RCC(rcvo);
				System.out.println(rcvo);
			}
		}
		
		return ("redirect:recipeList");
	}
	
	//레시피 리스트
	@RequestMapping(value="recipeList")
	public String recipeList(Model model,RecipeSearch rs,@RequestParam(defaultValue="1") int curPage)throws Exception {
		List<RecipeVO> rcvo = null;
		int count = recipeService.countList(rs);
		BoardPager boardPager = new BoardPager(count,curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		if(rs.getReleasedate().equals("최신순")) {
			boardPager = new BoardPager(count,curPage);start = boardPager.getPageBegin();end = boardPager.getPageEnd();
			rcvo=recipeService.recipeList(start,end,rs);
		}else if(rs.getViews().equals("조회순")) {
			boardPager = new BoardPager(count,curPage);start = boardPager.getPageBegin();end = boardPager.getPageEnd();
			rcvo=recipeService.recipeViewList(start,end,rs);}
		else if(rs.getPopular().equals("인기순")) {
			boardPager = new BoardPager(count,curPage);start = boardPager.getPageBegin();end = boardPager.getPageEnd();
			rcvo=recipeService.recipeLikesList(start,end,rs);}
		else if(rs.getComments().equals("댓글순")) {
			boardPager = new BoardPager(count,curPage);start = boardPager.getPageBegin();end = boardPager.getPageEnd();
			rcvo=recipeService.recipeReplyListSort(start,end,rs); System.out.println(rcvo+"ffdsafsa");}
		else {rcvo=recipeService.recipeList(start,end,rs);}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", rcvo);
		map.put("rs",rs);
		map.put("boardPager", boardPager);
		model.addAttribute("map",map);
		
		return ("recipe/recipeMain");
	}
	
	//레시피 상세보기
	@RequestMapping(value="recipeView")
	public String recipeView(Model model,@RequestParam String RC_CODE)throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		recipeService.viewCnt(RC_CODE);
		List<RecipeVO> rcvo = null;
		rcvo = recipeService.recipeView(RC_CODE);
		rcvo.get(0).setRCL_RCCODE(rcvo.get(0).getRC_CODE());
		rcvo.get(0).setRCL_RCMMID(name);
		rcvo.get(0).setBoardlike(recipeService.getBoardLike(rcvo.get(0)));
		model.addAttribute("view",rcvo);
		return ("recipe/recipeView");
	}
	
	@ResponseBody
	@RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
	public int heart(HttpServletRequest httpRequest,HttpSession session,Model model,RecipeVO rcvo) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RC_CODE", rcvo.getRC_CODE());
		map.put("RCL_RCCODE", rcvo.getRC_CODE());
		System.out.println(rcvo.getRC_CODE()+rcvo.getRC_CODE());
		int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		rcvo.setRCL_RCMMID(name);

		if(heart >= 1) {
			recipeService.deleteBoardLike(rcvo);
			recipeService.updateBoardLike(map);
			heart=0;
		} else {
			recipeService.insertBoardLike(rcvo);
			recipeService.updateBoardLike(map);
			heart=1;
		}
		return heart;
	}
	
	//댓글
	@ResponseBody
	@RequestMapping(value="/recipeReply", method=RequestMethod.POST)
	public String recipeReply(ReplyVO rvo,Model model)throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		rvo.setRCR_RCMMID(name);
		recipeService.recipeReply(rvo);
		return null;
	}
	
	//댓글 리스트
	@ResponseBody
	@RequestMapping(value="/recipeReplyList", method=RequestMethod.POST)
	public ModelAndView recipeReplyList(@RequestParam String RCR_RCCODE,ModelAndView mav)throws Exception{
		List<ReplyVO> rvo=recipeService.recipeReplyList(RCR_RCCODE);
		mav.addObject("reply",rvo);
		mav.setViewName("recipe/recipeReplyList");
		return mav;
	}
	
	//댓글 삭제 
	@ResponseBody
	@RequestMapping(value="/recipeReplyDelete", method=RequestMethod.POST)
	public String recipeReplyDelete(@RequestParam String RCR_CODE)throws Exception{
		recipeService.recipeReplyDelete(RCR_CODE);
		return null;
	}
	
	//레시피 수정 뷰
	@RequestMapping(value="/recipeupdateView")
	public String recipeupdateView(@RequestParam String RC_CODE,Model model)throws Exception{
		List<RecipeVO> rcvo=recipeService.recipeView2(RC_CODE);
		model.addAttribute("view", rcvo);
		return ("recipe/recipeUpdate");
	}
	
	//레시피 수정
	@RequestMapping(value="/recipeupdate")
	public String recipeupdate(RecipeVO rcvo,HttpServletRequest request,MultipartHttpServletRequest mr)throws Exception{
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName2 = null;
		List<MultipartFile> filename = mr.getFiles("file");
		String[] RCC_STEP = request.getParameterValues("RCC_STEP");
		String[] RCC_STEPINFO = request.getParameterValues("RCC_STEPINFO");
		String[] RCC_CODE = request.getParameterValues("RCC_CODE");
		recipeService.recipeupdateRC(rcvo);
		System.out.println(rcvo.getRCC_CODE());
		if(filename.size()>0) {
			for(MultipartFile file : filename) {
				String fileName = file.getOriginalFilename();
				
				fileName2 =  UploadFileUtils.fileUpload(imgUploadPath, fileName, file.getBytes(), ymdPath); 
				
				rcvo.setRCC_CODE(RCC_CODE[filename.indexOf(file)]);
				rcvo.setRCC_STEP(RCC_STEP[filename.indexOf(file)]);
				rcvo.setRCC_STEPINFO(RCC_STEPINFO[filename.indexOf(file)]);
				rcvo.setRCC_SOURCE(File.separator + "imgUpload" + ymdPath + File.separator + fileName2);
	
				recipeService.recipeupdateRCC(rcvo);
			}
		}
		return ("redirect:recipeList");
	}
	
	//글삭제
	@RequestMapping(value="/recipedel")
	public String recipedel(@RequestParam String RC_CODE)throws Exception{
		recipeService.recipedel(RC_CODE);
		return ("recipe/recipeView");
	}
	
	//신고
	@RequestMapping(value="/report", method=RequestMethod.POST)
	public String report(BlackList bl,Model model)throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		bl.setBL_REPORTER(name);
		service.report(bl);		
		return ("redirect:recipeList");
	}	
	

}
