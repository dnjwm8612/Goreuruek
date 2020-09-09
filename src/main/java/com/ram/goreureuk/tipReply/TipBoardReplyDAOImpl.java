package com.ram.goreureuk.tipReply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TipBoardReplyDAOImpl implements TipBoardReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String tipBoardReply = "com.ram.goreureuk.mappers.tipBoardReplyMapper.";

	//댓글 목록
	@Override
	public List<TipBoardReplyVO> selectReply(String t_code) throws Exception {

		return sqlSession.selectList(tipBoardReply+"selectReply", t_code);
	}

	//댓글 입력
	@Override
	public int insertReply(TipBoardReplyVO tipBoardReplyVO) throws Exception {
	
		return sqlSession.insert(tipBoardReply + "insertReply", tipBoardReplyVO );
	}
	
	//댓글 수정
	@Override
	public int updateReply(TipBoardReplyVO tipBoardReplyVO) throws Exception {
		
		return 0;
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(String tr_code) throws Exception {
		
		return sqlSession.delete(tipBoardReply +"deleteReply", tr_code);
	}

	@Override
	public int deleteAllReply(String t_code) throws Exception {
		
		return sqlSession.delete(tipBoardReply+ "deleteAllReply", t_code);
	}

	
	

}
