package com.ram.goreureuk.tipReply;

import java.util.List;

public interface TipBoardReplyDAO {
	
	
	//댓글 목록
	public List<TipBoardReplyVO> selectReply(String t_code) throws Exception;
	
	//댓글 작성
	public int insertReply(TipBoardReplyVO tipBoardReplyVO) throws Exception;
	
	//댓글 수정
	public int updateReply(TipBoardReplyVO tipBoardReplyVO) throws Exception;
	
	//댓글 삭제
	public int deleteReply(String tr_code) throws Exception;
	
	//댓글 전체삭제
	public int deleteAllReply(String t_code) throws Exception;

	
	
}
