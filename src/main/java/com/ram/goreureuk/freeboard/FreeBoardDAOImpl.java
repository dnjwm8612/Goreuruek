package com.ram.goreureuk.freeboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO{
	
	@Autowired
	private SqlSession sql;
	private static final String namespace = "com.ram.goreureuk.mappers.freeBoardMapper";

	@Override
	public void freeInsert(FreeBoardVO vo) throws Exception {
		sql.insert(namespace+".freeInsert",vo);
	}

	@Override
	public void freeDelete(String FB_CODE) throws Exception {
		sql.delete(namespace+".freeDelete", FB_CODE);
	}
	@Override
	public void freeDelete2(String FBC_FBCODE) throws Exception {
		sql.delete(namespace+".freeDelete2", FBC_FBCODE);
		
	}
	@Override
	public List<FreeBoardVO> freeboardList(String keyword) throws Exception {
		return sql.selectList(namespace+".freeboardList",keyword);	
	}

	@Override
	public void freeUpdate(FreeBoardVO vo) throws Exception {
		sql.update(namespace+".freeUpdate", vo);
	}
	@Override
	public void freeUpdate2(FreeBoardVO vo) throws Exception {
		sql.update(namespace+".freeUpdate2", vo);	
	}

	@Override
	public int getBoardLike(FreeBoardVO vo) throws Exception {
		return sql.selectOne(namespace+".getBoardLike",vo);
	}

	@Override
	public void insertBoardLike(FreeBoardVO vo) throws Exception {
		sql.insert(namespace+".createBoardLike",vo);	
	}

	@Override
	public void deleteBoardLike(FreeBoardVO vo) throws Exception {
		sql.delete(namespace+".deleteBoardLike",vo);		
	}

	@Override
	public void updateBoardLike(HashMap<String, Object> map) throws Exception {
		sql.update(namespace+".updateBoardLike",map);		
	}

	@Override
	public void freeBoardLikeDel(String FBL_FBCODE) throws Exception {
		sql.delete(namespace+".freeBoardLikeDel",FBL_FBCODE);		
	}

	@Override
	public List<FreeBoardVO> freeInfiniteDown(int bno) throws Exception {
		return sql.selectList(namespace+".freeInfiniteDown",bno);	
	}

	@Override
	public List<FreeBoardVO> freeTag(String FBC_TAG) throws Exception {
		return sql.selectList(namespace+".freeTag",FBC_TAG);
	}

	@Override
	public void report(BlackList bl) throws Exception {
		sql.insert(namespace+".report",bl);
	}

	@Override
	public void freeReplyInsert(ReplyVO rvo) throws Exception {
		sql.insert(namespace+".freeReplyInsert",rvo);
	}

	@Override
	public List<FreeBoardVO> freeboardListLike(String keyword) throws Exception {
		return sql.selectList(namespace+".freeboardListLike",keyword);
	}

	@Override
	public List<FreeBoardVO> freeboardListReply(String keyword) throws Exception {
		return sql.selectList(namespace+".freeboardListReply",keyword);
	}

	@Override
	public List<ReplyVO> freeboardReplyList(String FBR_FBCODE) throws Exception {
		return sql.selectList(namespace+".freeboardReplyList",FBR_FBCODE);
	}

	@Override
	public void freeReplyDelete(String FBR_CODE) throws Exception {
		sql.delete(namespace+".freeReplyDelete", FBR_CODE);
	}

	@Override
	public void freeMessageInsert(Message vo) throws Exception {
		sql.insert(namespace+".freeMessageInsert",vo);
	}


	

	

	


}
