package com.ram.goreureuk.message;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO dao;
	
	//메세지 리스트
	@Override
	public List<MessageVO> mslist(int start, int end, String searchOption, String keyword) throws Exception {
		return dao.mslist(start, end, searchOption, keyword);
	}

	//메세지 작성
	@Override
	public void ms_write(MessageVO vo) throws Exception {
		String ms_content = vo.getMs_content();
		String ms_mmid = vo.getMs_mmid();
		
		//태그문자 처리
		ms_mmid = ms_mmid.replace("<", "&lt;");
		ms_mmid = ms_mmid.replace("<", "&gt;");
		//공백문자 처리
		ms_mmid = ms_mmid.replace("   ",      "&nbsp;&nbsp;");
		//줄바꿈 처리
		ms_content = ms_content.replace("\n", "<br>");
		vo.setMs_content(ms_content);
		vo.setMs_mmid(ms_mmid);
		dao.ms_write(vo);
	}

	//메세지 답변(관리자>>유저)
	@Override
	public void ms_answer(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	//메세지 상세보기
	@Override
	public MessageVO ms_view(String ms_code) throws Exception {
		
		return dao.ms_view(ms_code);
	}

	//메세지 레코드 갯수
	@Override
	public int ms_countArticle(String searchOption, String keyword) throws Exception {
		return dao.ms_countArticle(searchOption, keyword);
	}

	@Override
	public String code(String name) throws Exception {
		return dao.code(name);
	}

}
