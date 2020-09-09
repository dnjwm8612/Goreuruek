package com.ram.goreureuk.recipe;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Inject
	RecipeDAO dao;
	
	@Override
	public int pageCount() throws Exception {
		return dao.pageCount();
	}

	@Override
	public List<RecipeVO> recipeList(int start, int end,RecipeSearch rs) throws Exception {
		return dao.recipeList(start,end,rs);
	}

	@Override
	public String select_bdcode() throws Exception {
		return dao.select_bdcode();
	}
	
	@Override
	public String select_rc_mmcode(String rc_mmid) throws Exception {
		return dao.select_rc_mmcode(rc_mmid);
	}

	@Override
	public void insert_RC(RecipeVO vo) throws Exception {
		dao.insert_RC(vo);
	}

	@Override
	public void insert_RCC(RecipeVO vo) throws Exception {
		dao.insert_RCC(vo);
	}

	@Override
	public void update_RC(RecipeVO vo) throws Exception {
		dao.update_RC(vo);
	}

	@Override
	public void update_RCC(RecipeContentVO vo) throws Exception {
		dao.update_RCC(vo);
	}

	@Override
	public void rcdelete_RCC(String rcc_rccode) throws Exception {
		dao.rcdelete_RCC(rcc_rccode);
	}

	@Override
	public void delete_RC(String rc_code) throws Exception {
		dao.delete_RC(rc_code);
	}

	@Override
	public void delete_RCC(String rcc_code) throws Exception {
		dao.delete_RCC(rcc_code);
	}

	@Override
	public List<RecipeVO> recipeView(String rc_code) throws Exception {
		return dao.recipeView(rc_code);
	}

	@Override
	public List<RecipeContentVO> view_RCC(String rcc_rccode) throws Exception {
		return dao.view_RCC(rcc_rccode);
	}

	@Override
	public void viewCnt(String RC_CODE) throws Exception {
		dao.viewCnt(RC_CODE);
	}

	@Override
	public List<RecipeVO> recipeViewList(int start, int end,RecipeSearch rs) throws Exception {
		return dao.recipeViewList(start,end,rs);
	}

	@Override
	public List<RecipeVO> recipeLikesList(int start, int end,RecipeSearch rs) throws Exception {
		return dao.recipeLikesList(start,end,rs);
	}

	@Override
	public List<RecipeVO> recipeReplyListSort(int start, int end,RecipeSearch rs) throws Exception {
		return dao.recipeReplyListSort(start,end,rs);
	}

	@Override
	public int countList(RecipeSearch rs) {
		return dao.countList(rs);
	}

	@Override
	public int getBoardLike(RecipeVO vo) throws Exception {
		return dao.getBoardLike(vo);
	}

	@Override
	public void insertBoardLike(RecipeVO vo) throws Exception {
		dao.insertBoardLike(vo);
	}

	@Override
	public void deleteBoardLike(RecipeVO vo) throws Exception {
		dao.deleteBoardLike(vo);
	}

	@Override
	public void updateBoardLike(HashMap<String, Object> map) throws Exception {
		dao.updateBoardLike(map);
	}

	@Override
	public void recipeLikeDel(String RCL_RCCODE) throws Exception {
		dao.recipeLikeDel(RCL_RCCODE);
	}

	@Override
	public void recipeReply(ReplyVO rvo) throws Exception {
		dao.recipeReply(rvo);
	}

	@Override
	public List<ReplyVO> recipeReplyList(String RCR_RCCODE) throws Exception {
		return dao.recipeReplyList(RCR_RCCODE);
	}

	@Override
	public void recipeReplyDelete(String RCR_CODE) throws Exception {
		dao.recipeReplyDelete(RCR_CODE);
	}

	@Override
	public List<RecipeVO> recipeView2(String RC_CODE) throws Exception {
		return dao.recipeView2(RC_CODE);
	}

	@Override
	public void recipeupdateRC(RecipeVO vo) throws Exception {
		dao.recipeupdateRC(vo);
	}


	@Override
	public void recipeupdateRCC(RecipeVO vo) throws Exception {
		dao.recipeupdateRCC(vo);
	}

	@Override
	public void recipedel(String RC_CODE) throws Exception {
		dao.recipedel(RC_CODE);
	}

	@Override
	public List<ReplyVO> getMoreContents(ReplyVO vo) throws Exception {
		return dao.getMoreContents(vo);
	}

}
