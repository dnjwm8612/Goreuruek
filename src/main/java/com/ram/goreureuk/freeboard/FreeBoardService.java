package com.ram.goreureuk.freeboard;

import java.util.HashMap;
import java.util.List;

public interface FreeBoardService {
			//게시글 입력
			public void freeInsert(FreeBoardVO vo)throws Exception;
			//게시글 삭제
			public void freeDelete(String FB_CODE)throws Exception;
			//게시글 삭제
			public void freeDelete2(String FBC_FBCODE)throws Exception;
			//게시글 리스트
			public List<FreeBoardVO> freeboardList(String keyword)throws Exception;
			//게시글 리스트 인기순
			public List<FreeBoardVO> freeboardListLike(String keyword)throws Exception;
			//게시글 리스트 댓글순
			public List<FreeBoardVO> freeboardListReply(String keyword)throws Exception;
			//게시글 수정
			public void freeUpdate(FreeBoardVO vo)throws Exception;
			//게시글 수정
			public void freeUpdate2(FreeBoardVO vo)throws Exception;
			//좋아요
			public int getBoardLike(FreeBoardVO vo) throws Exception;
			public void insertBoardLike(FreeBoardVO vo) throws Exception;
			public void deleteBoardLike(FreeBoardVO vo) throws Exception;
			public void updateBoardLike(HashMap<String, Object> map) throws Exception;
			public void freeBoardLikeDel(String FBL_FBCODE)throws Exception;
			//태그클릭
			public List<FreeBoardVO> freeTag(String FBC_TAG) throws Exception;
			//게시글 신고
			public void report(BlackList bl)throws Exception;
			//댓글 입력
			public void freeReplyInsert(ReplyVO rvo)throws Exception;
			//댓글 리스트
			public List<ReplyVO> freeboardReplyList(String FBR_FBCODE)throws Exception;
			//댓글 삭제
			public void freeReplyDelete(String FBR_CODE)throws Exception;
			//쪽지보내기
			public void freeMessageInsert(Message vo)throws Exception;

			
			//무한 스크롤
			public List<FreeBoardVO> freeInfiniteDown(int bno) throws Exception;
}
