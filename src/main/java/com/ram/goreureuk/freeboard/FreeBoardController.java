package com.ram.goreureuk.freeboard;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("freeboard")
public class FreeBoardController {

	@Resource(name="uploadPath") // root context에 작성
	String uploadPath;

	@Autowired
	private FreeBoardService service;

	@RequestMapping("/freeboardList")
	public String freeboardList(Model model,@RequestParam(defaultValue="") String keyword,freeSearch freesearch,
			@RequestParam(defaultValue = "")String selectview)throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		List<FreeBoardVO> list;
		freesearch.setKeyword(keyword);
		if(selectview.equals("인기순")) {
			list=service.freeboardListLike(freesearch.getKeyword());
		}else if(selectview.equals("댓글많은순")) {
			list=service.freeboardListReply(freesearch.getKeyword());
		}else if(selectview.equals("최신순")){
			list=service.freeboardList(freesearch.getKeyword());
		}else {
			list=service.freeboardList(freesearch.getKeyword());
		}
		for(int i=0;i<list.size();i++) {
			list.get(i).setFBL_FBCODE(list.get(i).getFB_CODE());
			list.get(i).setFBL_FBMMID(name);
			list.get(i).setBoardlike(service.getBoardLike(list.get(i)));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("keyword", freesearch.getKeyword());
		model.addAttribute("map",map);
		return ("freeboard/freeboard");
	}

	@ResponseBody
	@RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
	public int heart(HttpServletRequest httpRequest,HttpSession session,Model model,FreeBoardVO freevo) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("FB_CODE", freevo.getFB_CODE());
		map.put("FBL_FBCODE", freevo.getFBL_FBCODE());

		int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		freevo.setFBL_FBMMID(name);

		if(heart >= 1) {
			service.deleteBoardLike(freevo);
			service.updateBoardLike(map);
			heart=0;
		} else {
			service.insertBoardLike(freevo);
			service.updateBoardLike(map);
			heart=1;
		}
		return heart;
	}

	// 글입력
	@RequestMapping(value="freeInsert", method=RequestMethod.POST)
	public String freeInsert(Model model,FreeBoardVO freeboardvo,MultipartFile file)throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} 

		freeboardvo.setFBC_CONTENT2(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		freeboardvo.setFB_MMID(name);
		service.freeInsert(freeboardvo);
		return ("redirect:freeboardList");
	}

	//글수정
	@RequestMapping(value="/freeUpdate",method= RequestMethod.POST)
	public String freeUpdate(FreeBoardVO freevo,MultipartFile file)throws Exception{
		if(freevo.getFBC_CONTENT() != "") {
			service.freeUpdate(freevo);
		}
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {			
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			freevo.setFBC_CONTENT2(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			service.freeUpdate2(freevo);
		}
		return ("redirect:freeboardList");
	}	
	//글삭제
	@RequestMapping(value="/freeDelete")
	public String freeDelete(FreeBoardVO freevo)throws Exception{
		service.freeDelete2(freevo.getFB_CODE());
		service.freeDelete(freevo.getFBC_FBCODE());	
		return ("redirect:freeboardList");
	}		

	// 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드=> 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	@RequestMapping(value="uploadForm", method=RequestMethod.GET)
	public String uplodaForm(){
		return ("testup");
	}

	@RequestMapping(value="uploadForm2", method=RequestMethod.POST)
	public String uplodaForm(Model model,MultipartFile file) throws Exception{
		String savedName = file.getOriginalFilename();

		savedName = uploadFile(savedName, file.getBytes());

		model.addAttribute("savedName", savedName);

		return ("testup"); 
	}

	// 파일명 랜덤생성 메서드
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	//태그 검색
	@RequestMapping(value="/freeTag", method=RequestMethod.GET)
	public String freeTag(String FBC_TAG,Model model)throws Exception{
		List<FreeBoardVO> list=service.freeTag(FBC_TAG);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		model.addAttribute("map",map);
		return ("freeboard/freeboard");
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
		return ("redirect:freeboardList");
	}	
	
	//댓글
	@ResponseBody
	@RequestMapping(value="/freeReplyInsert", method=RequestMethod.POST)
	public String freeReplyInsert(@RequestBody ReplyVO rvo,Model model)throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		rvo.setFBR_FBMMID(name);
		service.freeReplyInsert(rvo);
		return null;
	}

	//댓글 리스트
	@ResponseBody
	@RequestMapping(value="/freeboardReplyList", method=RequestMethod.POST)
	public ModelAndView freeboardReplyList(@RequestBody ReplyVO rvo2,ModelAndView mav)throws Exception{
		List<ReplyVO> rvo=service.freeboardReplyList(rvo2.getFBR_FBCODE());
		mav.addObject("reply",rvo);
		mav.setViewName("freeboard/freeReplyList");
		return mav;
	}
	
	//댓글 삭제 제이손으로 변경해야함
	@ResponseBody
	@RequestMapping(value="/freeReplyDelete", method=RequestMethod.POST)
	public String freeReplyDelete(@RequestBody ReplyVO rvo)throws Exception{
		service.freeReplyDelete(rvo.getFBR_CODE());
		return null;
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
		return ("redirect:freeboardList");
	}
	
	
	
	
	
	
	

	//무한 스크롤 bno int 테이블 설정
		@RequestMapping(value="freeInfiniteDown", method=RequestMethod.POST)
		public String freeInfiniteDown(@RequestParam int bno,Model model) throws Exception{
			int bnostart = bno-1;
			System.out.println(bno);
			List<FreeBoardVO> list = service.freeInfiniteDown(bnostart);
			model.addAttribute("list",list);
			
			return ("freeboard/freeInfiniteDown");
		}
}
