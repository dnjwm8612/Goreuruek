package com.ram.goreureuk.qna;

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

import com.ram.goreureuk.message.MessageService;
import com.ram.goreureuk.message.MessageVO;



@RequestMapping("/qna/*")
@Controller
public class QnaBoardController {

	@Inject
	private QnaBoardService service;
	
	@Inject
	private MessageService service2;
	
	//게시글 목록
	@RequestMapping("qnaMain")
	public ModelAndView list(@RequestParam(defaultValue="qna_title")String searchOption,
							@RequestParam(defaultValue="")String keyword,
							@RequestParam(defaultValue="1")int curPage) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		
		//레코드 수 계산
		int count = service.qna_countArticle(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		QnaBoardPager qnaPager = new QnaBoardPager(count,curPage);
		int start = qnaPager.getPageBegin();
		int end = qnaPager.getPageEnd();
		
		List<QnaBoardVO> list = service.qnalist(start, end, searchOption, keyword);
		String auth1 = service.auth(name);
		
		//데이터를 맵에 저장
		Map<String, Object> qmap = new HashMap<String, Object>();
		qmap.put("list", list);
		qmap.put("count", count);
		qmap.put("searchOption", searchOption);
		qmap.put("keyword", keyword);
		qmap.put("qnaPager", qnaPager);

		ModelAndView mav = new ModelAndView();
		//mav.addObject("list", list);
		
		mav.addObject("auth", auth1);
		mav.addObject("qmap", qmap);
		mav.setViewName("qna/qnaMain");
		System.out.println(qmap);
		return mav;
	}
	
	//게시글 작성화면
	@RequestMapping(value="qnaBoardWrite", method=RequestMethod.GET)
	public String write(@ModelAttribute("QnaBoardVO") QnaBoardVO vo) throws Exception {
		return "qna/qnaBoardWrite";
	}
	
	//게시글 작성처리
	@RequestMapping(value="qnaBoardInsert", method=RequestMethod.POST)
	public String insert(@ModelAttribute QnaBoardVO vo) throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		vo.setQna_mmid(name);
		service.qna_write(vo);
		
		return "redirect:qnaMain";
	}
	
	//게시글 조회
	@RequestMapping(value="qnaBoardView", method=RequestMethod.GET)
	public void view(@RequestParam String qna_code, Model model) throws Exception{
		
		QnaBoardVO vo = service.qna_view(qna_code);
		model.addAttribute("qna", vo);
		System.out.println(vo);
	}
	
	//게시글 수정 화면
	@RequestMapping(value="qnaBoardEdit", method=RequestMethod.GET)
	public String edit(@ModelAttribute("QnaBoardVO") QnaBoardVO vo,
						@RequestParam String qna_code, Model model) throws Exception {
		vo = service.qna_view(qna_code);
		
		model.addAttribute("qna", vo);
		
		return "qna/qnaBoardEdit";
	}
	
	//게시굴 수정
	@RequestMapping(value="qnaBoardUpdate", method=RequestMethod.POST)
	public String update(@ModelAttribute QnaBoardVO vo) throws Exception{
		service.qna_update(vo);
		return "redirect:qnaMain";
	}
	
	//게시글 삭제
	@RequestMapping("qnaBoardDelete")
	public String delete(@RequestParam String qna_code) throws Exception{
		service.qna_delete(qna_code);
		return "redirect:qnaMain";
	}
	
	//메세지 작성처리
	@RequestMapping(value="msInsert", method=RequestMethod.POST)
	public String insert(MessageVO vo, Model model) throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		vo.setMs_mmid(name);
		vo.setMs_mmcode(service2.code(name));
		service2.ms_write(vo);
		return "redirect:qnaMain";
	}
}
