package com.ram.goreureuk.tip;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ram.goreureuk.tipContent.TipBoardContentVO;
import com.ram.goreureuk.utils.PagingVO;

public interface TipBoardDAO {

	//게시글 목록
	public List<TipBoardVO> getTipBoardList(PagingVO paging) throws Exception;
	
	//게시글 상세보기
	public TipBoardVO getSelectContent1(String t_code) throws Exception;	
	public TipBoardContentVO getSelectContent2(String t_code) throws Exception;
	
	//게시판 고유번호 가져오기
	public String bd_select() throws Exception;
	
	//게시글 번호 가져오기
	public String selectT_code(String t_mmid) throws Exception;
	
	//게시글 입력 
	public void insertTipBoard(TipBoardVO tipBoardVO) throws Exception;
	public void insertTipBoard2(TipBoardContentVO tipBoardContentVO) throws Exception;
	
	//게시글 수정
	public void updateTipBoard(TipBoardVO tipBoardVO) throws Exception;	
	public void updateTipBoard2(TipBoardContentVO tipBoardContentVO) throws Exception;
	
	//게시글 삭제	
	public void deleteTipBoard(String t_code) throws Exception;
	public void deleteTipBoard2(String t_code) throws Exception;
	
	//조회수 증가
	public int updateView(String t_code) throws Exception;
	
	//전체 게시글
	public int getBoardListCnt() throws Exception;
	
}
