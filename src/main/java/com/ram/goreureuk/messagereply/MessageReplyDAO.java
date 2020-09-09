package com.ram.goreureuk.messagereply;

import java.util.List;

public interface MessageReplyDAO {

	//답변 목록
	public List<MessageReplyVO> msrlist(String msr_mscode);
	//답변 입력
	public void msrinsert(MessageReplyVO vo);
	

	//답변 수정
	public void msrupdate(MessageReplyVO vo);
	//답변 삭제
	public void msrdelete(String msr_code);
}
