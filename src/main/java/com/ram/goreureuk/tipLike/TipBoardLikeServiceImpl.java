package com.ram.goreureuk.tipLike;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TipBoardLikeServiceImpl implements TipBoardLikeService {

	@Inject
	private TipBoardLikeDAO dao;
	
	@Override
	public int getBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception {
		
		return dao.getBoardLike(tipBoardLikeVO);
	}

	@Override
	public void insertBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception {
		
		dao.insertBoardLike(tipBoardLikeVO);				
		dao.updateBoardLike(tipBoardLikeVO.tl_tcode);
		
	}

	@Override
	public void deleteBoardLike(TipBoardLikeVO tipBoardLikeVO) throws Exception {
		
		dao.deleteBoardLike(tipBoardLikeVO);
		dao.updateBoardLike(tipBoardLikeVO.tl_tcode);		
	}

	

}
