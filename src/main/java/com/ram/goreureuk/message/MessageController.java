package com.ram.goreureuk.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;




@RequestMapping("/message/*")
@Controller
public class MessageController {

	@Inject
	private MessageService service;

	//메세지 리스트
	@RequestMapping("msMain")
	public ModelAndView list(@RequestParam(defaultValue="1")int curPage,
							@RequestParam(defaultValue="ms_mmid")String searchOption,
							@RequestParam(defaultValue="")String keyword) throws Exception {
		//레코드 수 계산
		int count = service.ms_countArticle(searchOption, keyword);

		//페이지 나누기 관련 처리
		MessagePager msPager = new MessagePager(count,curPage);
		int start = msPager.getPageBegin();
		int end = msPager.getPageEnd();

		List<MessageVO> list = service.mslist(start, end, searchOption, keyword);

		//데이터를 맵에 저장
		Map<String, Object> mmap = new HashMap<String, Object>();
		mmap.put("list", list);
		mmap.put("count", count);
		mmap.put("searchOption", searchOption);
		mmap.put("keyword", keyword);
		mmap.put("msPager", msPager);

		ModelAndView mav = new ModelAndView();
		//mav.addObject("list", list);
		mav.addObject("mmap", mmap);
		mav.setViewName("message/msMain");
		return mav;
	}
	//메세지 작성화면
	@RequestMapping(value="msWrite", method=RequestMethod.GET)
	public String write(@ModelAttribute("MessageVO") MessageVO vo) throws Exception {
		return "message/msWrite";
	}
	
	//메세지 조회
	@RequestMapping(value="msView", method=RequestMethod.GET)
	public void view(@RequestParam String ms_code, Model model) throws Exception{
		
		MessageVO vo = service.ms_view(ms_code);
		model.addAttribute("ms", vo);
	}
	//메세지 답변(관리자>>유저)


}
