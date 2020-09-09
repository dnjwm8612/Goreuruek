package com.ram.goreureuk.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ram.goreureuk.freeboard.BlackList;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.qna.QnaBoardVO;
import com.ram.goreureuk.recipe.RecipeVO;
import com.ram.goreureuk.tip.TipBoardVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sql;
	private static final String namespace = "com.ram.goreureuk.mappers.adminMapper";

	@Override
	public List<BlackList> reportView() throws Exception {
		return sql.selectList(namespace+".reportView");
	}

	@Override
	public void adminReportReuslt(String name) throws Exception {
		sql.update(namespace+".adminReportReuslt",name);
	}

	@Override
	public List<MemberVO> adminUser() throws Exception {
		return sql.selectList(namespace+".adminUser");
	}

	@Override
	public void adminDelUser(String code) throws Exception {
		sql.delete(namespace+".adminDelUser",code);
	}

	@Override
	public List<FreeBoardVO> freeBoardView() throws Exception {
		return sql.selectList(namespace+".freeBoardView");
	}

	@Override
	public List<RecipeVO> recipeView() throws Exception {
		return sql.selectList(namespace+".recipeView");
	}

	@Override
	public List<TipBoardVO> tipView() throws Exception {
		return sql.selectList(namespace+".tipView");
	}

	@Override
	public List<QnaBoardVO> qnaView() throws Exception {
		return sql.selectList(namespace+".qnaView");
	}
	
}
