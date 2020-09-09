package com.ram.goreureuk.tip;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.ram.goreureuk.tipContent.TipBoardContentVO;
import com.ram.goreureuk.tipLike.TipBoardLikeService;
import com.ram.goreureuk.tipLike.TipBoardLikeVO;
import com.ram.goreureuk.tipReply.TipBoardReplyService;
import com.ram.goreureuk.tipReply.TipBoardReplyVO;
import com.ram.goreureuk.utils.PagingVO;




@Controller
@RequestMapping(value = "/tip/*")
public class TipBoardController {
	//Tip게시판   게시글 출력
	@Inject
	private TipBoardService service;

	@Inject
	private TipBoardReplyService replyService;

	@Inject
	private TipBoardLikeService likeService;
	
	@Resource(name="uploadPath") // root context에 작성
	String uploadPath;


	//게시글 목록
	@RequestMapping(value ="/getTipBoardList", method=RequestMethod.GET)
	public String getBoardList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		List<TipBoardVO> list = null;
		PagingVO paging = new PagingVO();

		int listCnt = service.getBoardListCnt();  //게시글 갯수


		paging.pageInfo(page, range, listCnt);	
		list = service.getTipBoardList(paging);

		model.addAttribute("pagination", paging);		
		model.addAttribute("boardList", list);


		return "tip/list";
	}

	//게시글 상세보기
	@RequestMapping(value="/getTipBoardContent", method=RequestMethod.GET)
	public String getTipBoardContent(@RequestParam("t_code") String t_code, Model model) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		
		TipBoardLikeVO vo = new TipBoardLikeVO();
		vo.setTl_tcode(t_code);
		vo.setTl_tmmid(name);

		model.addAttribute("Content1", service.getSelectContent1(t_code));
		model.addAttribute("Content2", service.getSelectContent2(t_code));

		int boardLike = likeService.getBoardLike(vo);

		model.addAttribute("heart", boardLike);	

		return "tip/content";
	}

	//게시판 글 작성 페이지 이동
	@RequestMapping(value="/boardWrite" , method=RequestMethod.GET)
	public String getBoardWrite(@ModelAttribute("TipBoardVO") TipBoardVO tipBoardVO, Model model) throws Exception {

		return "tip/boardWrite";
	}

	//게시글 수정페이지 이동
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updateTipBoard(@RequestParam("t_code") String t_code, @RequestParam("mode") String mode, Model model) throws Exception {

		model.addAttribute("Content1", service.getSelectContent1(t_code));
		model.addAttribute("Content2", service.getSelectContent2(t_code));


		model.addAttribute("mode", mode);

		model.addAttribute("TipBoardVO", new TipBoardVO());



		return "tip/boardWrite";
	}



	//게시글 작성
	@RequestMapping(value = "/insertTipBoard", method = RequestMethod.POST)
	public String insertTipBoard(@ModelAttribute("TipBoardVO") TipBoardVO tipBoardVO, @RequestParam("mode") String mode, Model model
			) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		
		TipBoardContentVO tipBoardContentVO = new TipBoardContentVO(); 

		String bdcode = service.bd_select();	//board code 가져오기	
		tipBoardVO.setT_bdcode(bdcode);         //board code VO에 저장


		if(mode.equals("edit")) {
			//수정작업
			System.out.println(mode);

			service.updateTipBoard(tipBoardVO);		
			tipBoardContentVO.setTc_content(tipBoardVO.getTc_content());
			tipBoardContentVO.setTc_tcode(tipBoardVO.getT_code());

			System.out.println(tipBoardContentVO);		

			service.updateTipBoard2(tipBoardContentVO);

		} else {	
			//입력작업
			service.insertTipBoard(tipBoardVO);  

			tipBoardContentVO.setTc_tmmid(name);
			tipBoardContentVO.setTc_tcode(service.selectT_code(tipBoardVO.getT_mmid()));
			tipBoardContentVO.setTc_content(tipBoardVO.getTc_content());


			service.insertTipBoard2(tipBoardContentVO);
		}

		return "redirect:/tip/getTipBoardList";
	}

	//게시글 삭제
	@RequestMapping(value="/deleteTipBoard" , method=RequestMethod.GET)
	public String deleteTipBoard(@RequestParam("t_code") String t_code) throws Exception {

		//TipBoardContentVO tipBoardContentVO = new TipBoardContentVO();

		replyService.deleteAllReply(t_code);
		service.deleteTipBoard2(t_code);
		service.deleteTipBoard(t_code);

		return "redirect:/tip/getTipBoardList";
	}



	//댓글 목록
	@RequestMapping(value="/selectReply", method=RequestMethod.GET)
	@ResponseBody
	public List<TipBoardReplyVO> selectReply(@RequestParam("tr_tcode") String tr_tcode, Model model) throws Exception {


		return replyService.selectReply(tr_tcode);
	}


	//댓글 입력	
	@RequestMapping(value ="/insertReply", method=RequestMethod.POST )
	@ResponseBody
	public int insertReply(@RequestParam("tr_tcode") String tr_tcode, @RequestParam("tr_content") String tr_content ) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		
		TipBoardReplyVO tipBoardReplyVO = new TipBoardReplyVO();

		tipBoardReplyVO.setTr_tmmid(name);
		tipBoardReplyVO.setTr_tcode(tr_tcode);
		tipBoardReplyVO.setTr_content(tr_content);

		System.out.println(tipBoardReplyVO);

		return replyService.insertReply(tipBoardReplyVO);
	}

	//댓글 수정
	@RequestMapping(value = "/updateReply")
	public int updateReply(@RequestParam("tr_code") String tr_code, @RequestParam("tr_content") String tr_content) throws Exception {

		TipBoardReplyVO tipBoardReplyVO = new TipBoardReplyVO();

		tipBoardReplyVO.setTr_code(tr_code);
		tipBoardReplyVO.setTr_content(tr_content);

		return replyService.updateReply(tipBoardReplyVO);
	}

	//댓글 삭제
	@RequestMapping(value="/deleteReply" , method=RequestMethod.POST )
	@ResponseBody
	public int deleteReply(@RequestParam("tr_code") String tr_code) throws Exception {

		System.out.println(tr_code);


		return replyService.deleteReply(tr_code);
	}


	//좋아요 
	@ResponseBody
	@RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
	public int heart(HttpServletRequest httpRequest) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}

		int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		String tl_tcode = httpRequest.getParameter("tl_tcode");

		TipBoardLikeVO vo = new TipBoardLikeVO();

		vo.setTl_tcode(tl_tcode);
		vo.setTl_tmmid(name);


		if(heart >= 1) {
			likeService.deleteBoardLike(vo);  // 테이블에 좋아요 숫자 -1, 내가표시한 좋아요가 0으로

			heart = 0;
		} else {
			likeService.insertBoardLike(vo);

			heart = 1;
		}				
		return heart;
	}

	//파일 업로드
	@RequestMapping(value="/fileupload", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
			MultipartHttpServletRequest multiFile) throws Exception {
		
		OutputStream out = null;
		JsonObject json = new JsonObject();
		String fileUrl ="";
		PrintWriter printWriter = null;
		
		MultipartFile file = multiFile.getFile("upload");
		
		try{			
			String fileName = file.getName();
			byte[] bytes = file.getBytes();
			uploadPath = req.getServletContext().getRealPath("/resources/img/");
			
			File uploadFile = new File(uploadPath);
			if(!uploadFile.exists()){
				uploadFile.mkdirs();
			}
			
			fileName = UUID.randomUUID().toString() + ".jpg";
			uploadPath = uploadPath + "/" + fileName;
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);

			printWriter = resp.getWriter();
			resp.setContentType("text/html");
			fileUrl = req.getContextPath() + "/resources/img/" + fileName;

			// json 데이터로 등록
			// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
			// 이런 형태로 리턴이 나가야함.
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);

			printWriter.println(json);
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(out != null){
				out.close();
			}
			if(printWriter != null){
				printWriter.close();
			}	
		}
		return null;
	}
}
