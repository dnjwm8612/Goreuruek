package com.ram.goreureuk.message;

import java.util.List;


public interface MessageDAO {

	//메세지 목록
	public List<MessageVO> mslist(int start, int end, String searchOption, String keyword) throws Exception;
	
	//메세지 작성
	public void ms_write(MessageVO vo) throws Exception;
	
	//메세지 답변(관리자>>유저)
	public void ms_answer(MessageVO vo) throws Exception;
	
	//메세지 상세보기
	public MessageVO ms_view(String ms_code) throws Exception;
	
	//메세지 레코드 갯수
	public int ms_countArticle(String searchOption, String keyword) throws Exception;
	
	public String code(String name) throws Exception;

}
