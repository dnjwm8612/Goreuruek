package com.ram.goreureuk.recipe;

import java.util.HashMap;
import java.util.List;

public interface RecipeService {
	
	public int pageCount() throws Exception;
	
	public List<RecipeVO> recipeList(int start, int end,RecipeSearch rs) throws Exception;
	public List<RecipeVO> recipeViewList(int start, int end,RecipeSearch rs) throws Exception;//
	public List<RecipeVO> recipeLikesList(int start, int end,RecipeSearch rs) throws Exception;//
	public List<RecipeVO> recipeReplyListSort(int start, int end,RecipeSearch rs) throws Exception;//
	// 댓글 갯수
    public int countList(RecipeSearch rs);
	//조회수 증가
	public void viewCnt(String RC_CODE)throws Exception;
	//레시피 뷰
	public List<RecipeVO> recipeView(String rc_code) throws Exception;
	//좋아요
	public int getBoardLike(RecipeVO vo) throws Exception;
	public void insertBoardLike(RecipeVO vo) throws Exception;
	public void deleteBoardLike(RecipeVO vo) throws Exception;
	public void updateBoardLike(HashMap<String, Object> map) throws Exception;
	public void recipeLikeDel(String RCL_RCCODE)throws Exception;
	//댓글 입력
	public void recipeReply(ReplyVO rvo)throws Exception;
	//댓글 리스트
	public List<ReplyVO> recipeReplyList(String RCR_RCCODE)throws Exception;
	//댓글 삭제
	public void recipeReplyDelete(String RCR_CODE)throws Exception;
	//레시피 뷰
	public List<RecipeVO> recipeView2(String RC_CODE) throws Exception;
	//레시피 업데이트
	public void recipeupdateRC(RecipeVO vo) throws Exception;
	public void recipeupdateRCC(RecipeVO vo) throws Exception;
	//게시글 삭제
	public void recipedel(String RC_CODE)throws Exception;
	//더보기 페이징
	public List<ReplyVO> getMoreContents(ReplyVO vo)throws Exception;
	
	
	public String select_bdcode() throws Exception;
	
	public String select_rc_mmcode(String rc_mmid) throws Exception;
	
	public void insert_RC(RecipeVO vo) throws Exception;

	public void insert_RCC(RecipeVO vo) throws Exception;
	
	public void update_RC(RecipeVO vo) throws Exception;
	
	public void update_RCC(RecipeContentVO vo) throws Exception;
	
	public void rcdelete_RCC(String rcc_rccode) throws Exception;
	
	public void delete_RC(String rc_code) throws Exception;
	
	public void delete_RCC(String rcc_code) throws Exception;
	
	
	public List<RecipeContentVO> view_RCC(String rcc_rccode) throws Exception;
	
}
