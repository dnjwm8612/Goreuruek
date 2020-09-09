package com.ram.goreureuk.freeboard;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardDAO fd;
	
	@Override
	public void freeInsert(FreeBoardVO vo) throws Exception {
		fd.freeInsert(vo); 
	}

	@Override
	public void freeDelete(String FB_CODE) throws Exception {
		fd.freeDelete(FB_CODE);
	}
	@Override
	public void freeDelete2(String FBC_FBCODE) throws Exception {
		fd.freeDelete2(FBC_FBCODE);
	}
	@Override
	public List<FreeBoardVO> freeboardList(String keyword) throws Exception {
		return fd.freeboardList(keyword);
	}
	@Override
	public void freeUpdate(FreeBoardVO vo) throws Exception {
		fd.freeUpdate(vo);
	}
	@Override
	public void freeUpdate2(FreeBoardVO vo) throws Exception {
		fd.freeUpdate2(vo);		
	}

	@Override
	public int getBoardLike(FreeBoardVO vo) throws Exception {
		return fd.getBoardLike(vo);
	}

	@Override
	public void insertBoardLike(FreeBoardVO vo) throws Exception {
		fd.insertBoardLike(vo);
		
	}

	@Override
	public void deleteBoardLike(FreeBoardVO vo) throws Exception {
		fd.deleteBoardLike(vo);
	}

	@Override//hashmap
	public void updateBoardLike(HashMap<String, Object> map) throws Exception {
		fd.updateBoardLike(map);
	}

	@Override
	public void freeBoardLikeDel(String FBL_FBCODE) throws Exception {
		fd.freeBoardLikeDel(FBL_FBCODE);
		
	}

	@Override
	public List<FreeBoardVO> freeInfiniteDown(int bno) throws Exception {
		return fd.freeInfiniteDown(bno);
	}

	@Override
	public List<FreeBoardVO> freeTag(String FBC_TAG) throws Exception {
		return fd.freeTag(FBC_TAG);
	}

	@Override
	public void report(BlackList bl) throws Exception {
		fd.report(bl);	
	}

	@Override
	public void freeReplyInsert(ReplyVO rvo) throws Exception {
		fd.freeReplyInsert(rvo);
	}

	@Override
	public List<FreeBoardVO> freeboardListLike(String keyword) throws Exception {
		return fd.freeboardListLike(keyword);
	}

	@Override
	public List<FreeBoardVO> freeboardListReply(String keyword) throws Exception {
		return fd.freeboardListReply(keyword);
	}

	@Override
	public List<ReplyVO> freeboardReplyList(String FBR_FBCODE) throws Exception {
		return fd.freeboardReplyList(FBR_FBCODE);
	}

	@Override
	public void freeReplyDelete(String FBR_CODE) throws Exception {
		fd.freeReplyDelete(FBR_CODE);
	}

	@Override
	public void freeMessageInsert(Message vo) throws Exception {
		fd.freeMessageInsert(vo);
	}






	



}
