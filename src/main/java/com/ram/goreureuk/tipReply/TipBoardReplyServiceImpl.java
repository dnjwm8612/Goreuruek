package com.ram.goreureuk.tipReply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TipBoardReplyServiceImpl implements TipBoardReplyService {

	
	@Inject
	private TipBoardReplyDAO dao;
	
	//댓글 목록
	@Override
	public List<TipBoardReplyVO> selectReply(String t_code) throws Exception {
		
		return dao.selectReply(t_code);
	}

	//댓글 입력
	@Override
	public int insertReply(TipBoardReplyVO tipBoardReplyVO) throws Exception {

		return dao.insertReply(tipBoardReplyVO);
	}

	//댓글 수정
	@Override
	public int updateReply(TipBoardReplyVO tipBoardReplyVO) throws Exception {
	
		return 0;
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(String tr_code) throws Exception {
		
		return dao.deleteReply(tr_code);
	}

	//댓글 전체삭제
	@Override
	public int deleteAllReply(String t_code) throws Exception {
		
		return dao.deleteAllReply(t_code);
	}

	

}
