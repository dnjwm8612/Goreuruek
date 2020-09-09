package com.ram.goreureuk.tipLike;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TipBoardLikeDAOImpl implements TipBoardLikeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String tipLike = "com.ram.goreureuk.mappers.tipBoardLikesMapper.";

	//좋아요 생성or삭제 확인 여부
	@Override
	public int getBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception {
		
		return sqlSession.selectOne(tipLike +"getBoardLike", tipBoardLikeVO);
	}
	
	//좋아요 증가
	@Override
	public void insertBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception {
		
		sqlSession.insert(tipLike +"insertBoardLike", tipBoardLikeVO);
	}

	//좋아요 감소
	@Override
	public void deleteBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception {
		
		sqlSession.delete(tipLike +"deleteBoardLike", tipBoardLikeVO);
	}

	//좋아요 갱신
	@Override
	public void updateBoardLike(String t_code) throws Exception {
		
		sqlSession.update(tipLike+ "updateBoardLike", t_code);
	}
	
}
