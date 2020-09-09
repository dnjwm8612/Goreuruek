package com.ram.goreureuk.admin;

import java.util.List;

import com.ram.goreureuk.freeboard.BlackList;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.qna.QnaBoardVO;
import com.ram.goreureuk.recipe.RecipeVO;
import com.ram.goreureuk.tip.TipBoardVO;

public interface AdminDAO {
	public List<BlackList> reportView() throws Exception; 
	
	public void adminReportReuslt(String name) throws Exception; 
	
	public List<MemberVO> adminUser() throws Exception;
	
	public void adminDelUser(String code) throws Exception;
	
	//보드별 리스트
	public List<FreeBoardVO> freeBoardView() throws Exception;
	public List<RecipeVO> recipeView() throws Exception;
	public List<TipBoardVO> tipView() throws Exception;
	public List<QnaBoardVO> qnaView() throws Exception;
}
