package com.ram.goreureuk.messagereply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MessageReplyServiceImpl implements MessageReplyService{
	
	@Inject
	private MessageReplyDAO dao;

	//답변 목록
	@Override
	public List<MessageReplyVO> msrlist(String msr_mscode) {
		return dao.msrlist(msr_mscode);
	}

	//답변작성
	@Override
	public void msrinsert(MessageReplyVO vo) {
		String msr_content = vo.getMsr_content();
		
		//줄바꿈 처리
		msr_content = msr_content.replace("\n", "<br>");
		vo.setMsr_content(msr_content);
		dao.msrinsert(vo);
	}

	@Override
	public void msrupdate(MessageReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void msrdelete(String msr_code) {
		// TODO Auto-generated method stub
		
	}
}
