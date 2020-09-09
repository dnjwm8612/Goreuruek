package com.ram.goreureuk.tip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ram.goreureuk.tipContent.TipBoardContentVO;
import com.ram.goreureuk.utils.FileUtils;
import com.ram.goreureuk.utils.PagingVO;

@Service
public class TipBoardServiceImpl implements TipBoardService {
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private TipBoardDAO dao;
		

	//게시글 목록
	@Override
	public List<TipBoardVO> getTipBoardList(PagingVO paging) throws Exception {
		
		return dao.getTipBoardList(paging);
	}

	//게시글 상세보기1
	@Override
	public TipBoardVO getSelectContent1(String t_code) throws Exception {
		
		
		return dao.getSelectContent1(t_code);
	}

	//게시글 상세보기2
	@Override
	public TipBoardContentVO getSelectContent2(String t_code) throws Exception {
		
		dao.updateView(t_code);
		return dao.getSelectContent2(t_code);
	}

	//게시글 입력1
	@Override
	public void insertTipBoard(TipBoardVO tipBoardVO) throws Exception {
						
		dao.insertTipBoard(tipBoardVO);			
	}
	
	//게시글 입력2
	@Override
	public void insertTipBoard2(TipBoardContentVO tipBoardContentVO) throws Exception {
				
		dao.insertTipBoard2(tipBoardContentVO);
		
	}
	
	//게시글 수정1
	@Override
	public void updateTipBoard(TipBoardVO tipBoardVO) throws Exception {
		dao.updateTipBoard(tipBoardVO);
	}
	//게시글 수정2
	@Override
	public void updateTipBoard2(TipBoardContentVO tipBoardContentVO) throws Exception {
		
		dao.updateTipBoard2(tipBoardContentVO);
	}
	
	//게시판 고유번호 가져오기
	@Override
	public String bd_select() throws Exception {
		
		return dao.bd_select();
	}
	
	//게시글 번호 가져오기
	@Override
	public String selectT_code(String t_mmid) throws Exception {
		return dao.selectT_code(t_mmid);
	}

	//게시글 삭제1
	@Override
	public void deleteTipBoard(String t_code) throws Exception {
		
		dao.deleteTipBoard(t_code);		
	}

	//게시글 삭제2
	@Override
	public void deleteTipBoard2(String t_code) throws Exception {
		
		dao.deleteTipBoard2(t_code);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		// 
		return dao.getBoardListCnt();
	}

	

	

}
