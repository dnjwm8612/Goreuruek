package com.ram.goreureuk.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ram.goreureuk.freeboard.BlackList;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.qna.QnaBoardVO;
import com.ram.goreureuk.recipe.RecipeVO;
import com.ram.goreureuk.tip.TipBoardVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO ad;

	@Override
	public List<BlackList> reportView() throws Exception {
		return ad.reportView();
	}

	@Override
	public void adminReportReuslt(String name) throws Exception {
		ad.adminReportReuslt(name);
	}

	@Override
	public List<MemberVO> adminUser() throws Exception {
		return ad.adminUser();
	}

	@Override
	public void adminDelUser(String code) throws Exception {
		ad.adminDelUser(code);
	}

	@Override
	public List<FreeBoardVO> freeBoardView() throws Exception {
		return ad.freeBoardView();
	}

	@Override
	public List<RecipeVO> recipeView() throws Exception {
		return ad.recipeView();
	}

	@Override
	public List<TipBoardVO> tipView() throws Exception {
		return ad.tipView();
	}

	@Override
	public List<QnaBoardVO> qnaView() throws Exception {
		return ad.qnaView();
	}

}
