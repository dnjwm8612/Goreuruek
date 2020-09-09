package com.ram.goreureuk.messagereply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/message/*")
public class MessageReplyController {

	@Inject
	private MessageReplyService service;
	
	//답변 입력
	//@RequestMapping("msrinsert")
	//public void msrinsert(@ModelAttribute MessageReplyVO vo) {
	//	service.msrinsert(vo);
	//}
	//@RequestMapping(value="msrinsert", method=RequestMethod.POST)
	//public String msrinsert(@ModelAttribute MessageReplyVO vo) throws Exception{
	//	service.msrinsert(vo);
	//	return "redirect:msMain";
	//}
	@RequestMapping(value="insertRest", method=RequestMethod.POST)
	public ResponseEntity<String> insertRest(@RequestBody MessageReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.msrinsert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//답변 목록
	@RequestMapping("msrlist")
	public ModelAndView msrlist(@RequestParam String msr_mscode, ModelAndView mav) {
		List<MessageReplyVO> msrlist = service.msrlist(msr_mscode);
		mav.setViewName("message/msrlist");
		System.out.println(msrlist);
		mav.addObject("msrlist", msrlist);
		return mav;
	}
	
	@RequestMapping("msrlistJson")
	@ResponseBody
	public List<MessageReplyVO> msrlist(@RequestParam String msr_mscode){
		List<MessageReplyVO> msrlist = service.msrlist(msr_mscode);
		return msrlist;
	}
}
