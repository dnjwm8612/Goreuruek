package com.ram.goreureuk.tip;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ram.goreureuk.tipContent.TipBoardContentVO;
import com.ram.goreureuk.utils.PagingVO;

@Repository
public class TipBoardDAOImpl implements TipBoardDAO {

	@Inject 
	private SqlSession sqlSession;
	
	private static String tipBoard = "com.ram.goreureuk.mappers.tipBoardMapper.";
	
	

	@Override
	public List<TipBoardVO> getTipBoardList(PagingVO paging) throws Exception {
			
		
		return sqlSession.selectList(tipBoard + "getTipBoardList", paging);
	}
	
	//게시판 상세보기1
	@Override
	public TipBoardVO getSelectContent1(String t_code) throws Exception {
		
		return sqlSession.selectOne(tipBoard+ "getSelectContent1", t_code);
	}

	//게시판 상세보기2
	@Override
	public TipBoardContentVO getSelectContent2(String t_code) throws Exception {
		
		return sqlSession.selectOne(tipBoard + "getSelectContent2", t_code);
	}

	
	//board코드 가져오기
	public String bd_select() throws Exception {
		
		
		return sqlSession.selectOne(tipBoard +"bd_select");
	}
	
	
	//게시글 작성
	@Override
	public void insertTipBoard(TipBoardVO tipBoardVO) throws Exception {
	
		sqlSession.insert(tipBoard+"insertTipBoard", tipBoardVO);
	
	}	
	@Override
	public void insertTipBoard2(TipBoardContentVO tipBoardContentVO) throws Exception {
		
		sqlSession.insert(tipBoard+ "insertTipBoard2", tipBoardContentVO);		
	}
	
	//게시글 수정1
	@Override
	public void updateTipBoard(TipBoardVO tipBoardVO) throws Exception {
				
		sqlSession.update(tipBoard +"updateTipBoard", tipBoardVO);
	}
	//게시글 수정2
	@Override
	public void updateTipBoard2(TipBoardContentVO tipBoardContentVO) throws Exception {
		
		sqlSession.update(tipBoard +"updateTipBoard2", tipBoardContentVO );
	}
	
	@Override
	public String selectT_code(String t_mmid) throws Exception {
		return sqlSession.selectOne(tipBoard +"selectT_code", t_mmid);
	}

	@Override
	public void deleteTipBoard(String t_code) throws Exception {
		
		sqlSession.delete(tipBoard +"deleteTipBoard", t_code);		
	}

	@Override
	public void deleteTipBoard2(String t_code) throws Exception {
		
		sqlSession.delete(tipBoard +"deleteTipBoard2", t_code);		
	}

	@Override
	public int updateView(String t_code) throws Exception {
		
		return sqlSession.update(tipBoard +"updateView", t_code);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		
		return sqlSession.selectOne(tipBoard +"getTipBoardListCnt");
	}

	

	
	
}
