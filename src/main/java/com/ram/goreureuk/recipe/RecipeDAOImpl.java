package com.ram.goreureuk.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAOImpl implements RecipeDAO{

	@Inject
	private SqlSession sqlSession;
	String nameSpace = "com.ram.goreureuk.mappers.RecipeMapper";
	
	@Override
	public int pageCount() throws Exception {
		return sqlSession.selectOne(nameSpace +".pageCount");
	}
	
	//레시피 리스트
	@Override
	public List<RecipeVO> recipeList(int start, int end,RecipeSearch rs) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rs", rs);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList(nameSpace+".recipeList",map);
	}

	@Override
	public String select_bdcode() throws Exception {
		return sqlSession.selectOne(nameSpace+".bd_select");
	}

	@Override
	public String select_rc_mmcode(String rc_mmid) throws Exception {
		return sqlSession.selectOne(nameSpace+".rc_mmcode_select", rc_mmid);
	}
	
	@Override
	public void insert_RC(RecipeVO vo) throws Exception {
		sqlSession.insert(nameSpace +".rc_insert", vo);
	}

	@Override
	public void insert_RCC(RecipeVO vo) throws Exception {
		sqlSession.insert(nameSpace+".rcc_insert", vo);
	}

	@Override
	public void update_RC(RecipeVO vo) throws Exception {
		sqlSession.update(nameSpace+".rc_update", vo);
	}

	@Override
	public void update_RCC(RecipeContentVO vo) throws Exception {
		sqlSession.update(nameSpace+".rcc_update", vo);
	}
	
	@Override
	public void rcdelete_RCC(String rcc_rccode) throws Exception {
		sqlSession.delete(nameSpace+".rcc_rcdelete", rcc_rccode);
		
	}

	@Override
	public void delete_RC(String rc_code) throws Exception {
		sqlSession.delete(nameSpace+".rc_delete", rc_code);
	}

	@Override
	public void delete_RCC(String rcc_code) throws Exception {
		sqlSession.delete(nameSpace+".rcc_delete", rcc_code);
		
	}

	@Override
	public List<RecipeVO> recipeView(String rc_code) throws Exception {
		return sqlSession.selectList(nameSpace+".recipeView", rc_code);
	}

	@Override
	public List<RecipeContentVO> view_RCC(String rcc_rccode) throws Exception {
		return sqlSession.selectList(nameSpace, rcc_rccode);
	}

	@Override
	public void viewCnt(String RC_CODE) throws Exception {
		sqlSession.update(nameSpace+".viewCnt", RC_CODE);
	}

	@Override
	public List<RecipeVO> recipeViewList(int start, int end,RecipeSearch rs) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rs", rs);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList(nameSpace+".recipeViewList",map);
	}

	@Override
	public List<RecipeVO> recipeLikesList(int start, int end,RecipeSearch rs) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rs", rs);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList(nameSpace+".recipeLikesList",map);
	}

	@Override
	public List<RecipeVO> recipeReplyListSort(int start, int end,RecipeSearch rs) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rs", rs);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList(nameSpace+".recipeReplyListSort",map);
	}

	@Override
	public int countList(RecipeSearch rs) {
		return sqlSession.selectOne(nameSpace+".countList", rs);
	}

	@Override
	public int getBoardLike(RecipeVO vo) throws Exception {
		return sqlSession.selectOne(nameSpace+".getBoardLike",vo);
	}

	@Override
	public void insertBoardLike(RecipeVO vo) throws Exception {
		sqlSession.insert(nameSpace+".createBoardLike",vo);
	}

	@Override
	public void deleteBoardLike(RecipeVO vo) throws Exception {
		sqlSession.delete(nameSpace+".deleteBoardLike",vo);
	}

	@Override
	public void updateBoardLike(HashMap<String, Object> map) throws Exception {
		sqlSession.update(nameSpace+".updateBoardLike",map);
	}

	@Override
	public void recipeLikeDel(String RCL_RCCODE) throws Exception {
		sqlSession.delete(nameSpace+".freeBoardLikeDel",RCL_RCCODE);
	}

	@Override
	public void recipeReply(ReplyVO rvo) throws Exception {
		sqlSession.insert(nameSpace+".recipeReply",rvo);
	}

	@Override
	public List<ReplyVO> recipeReplyList(String RCR_RCCODE) throws Exception {
		return sqlSession.selectList(nameSpace+".recipeReplyList",RCR_RCCODE);
	}

	@Override
	public void recipeReplyDelete(String RCR_CODE) throws Exception {
		sqlSession.delete(nameSpace+".recipeReplyDelete", RCR_CODE);
	}

	@Override
	public List<RecipeVO> recipeView2(String RC_CODE) throws Exception {
		return sqlSession.selectList(nameSpace+".recipeView2", RC_CODE);
	}

	@Override
	public void recipeupdateRC(RecipeVO vo) throws Exception {
		sqlSession.update(nameSpace+".recipeupdateRC", vo);		
	}

	@Override
	public void recipeupdateRCC(RecipeVO vo) throws Exception {
		sqlSession.update(nameSpace+".recipeupdateRCC", vo);
	}

	@Override
	public void recipedel(String RC_CODE) throws Exception {
		sqlSession.delete(nameSpace+".recipedel", RC_CODE);
	}

	@Override
	public List<ReplyVO> getMoreContents(ReplyVO vo) throws Exception {
		return sqlSession.selectList(nameSpace+".getMoreContents",vo);
	}

}
