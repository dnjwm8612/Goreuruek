package com.ram.goreureuk.tipLike;

public interface TipBoardLikeService {

	//좋아요 생성or삭제 확인 여부
	public int getBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception;
	
	public void insertBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception;
	
	public void deleteBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception;
	
	
}
