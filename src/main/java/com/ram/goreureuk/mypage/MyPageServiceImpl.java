package com.ram.goreureuk.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ram.goreureuk.freeboard.FreeBoardLikes;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.freeboard.Message;
import com.ram.goreureuk.freeboard.ReplyVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.member.signUpVO;
import com.ram.goreureuk.message.MessageVO;
import com.ram.goreureuk.messagereply.MessageReplyVO;
import com.ram.goreureuk.recipe.RecipeVO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO md;

	@Override
	public MemberVO mypageView(String name) {
		return md.mypageView(name);
	}

	@Override
	public List<FreeBoardVO> mypageFreeList(String name) {
		return md.mypageFreeList(name);
	}

	@Override
	public List<RecipeVO> mypageRecipeList(String name) {
		return md.mypageRecipeList(name);
	}

	@Override
	public List<ReplyVO> mypageFreeReply(String name) {
		return md.mypageFreeReply(name);
	}

	@Override
	public List<com.ram.goreureuk.recipe.ReplyVO> mypageRecipeReply(String name) {
		return md.mypageRecipeReply(name);
	}

	@Override
	public List<FreeBoardLikes> mypageFreeLikes(String name) {
		return md.mypageFreeLikes(name);
	}

	@Override
	public List<FreeBoardVO> mypageFreeLikesList(String code) {
		return md.mypageFreeLikesList(code);
	}

	@Override
	public List<RecipeVO> mypageRecipeLikes(String name) {
		return md.mypageRecipeLikes(name);
	}

	@Override
	public List<RecipeVO> mypageRecipeLikesList(String code) {
		return md.mypageRecipeLikesList(code);
	}

	@Override
	public signUpVO editView(String name) {
		return md.editView(name);
	}

	@Override
	public void editPw(signUpVO vo) {
		md.editPw(vo);
	}

	@Override
	public void DeleteUser(String name) {
		md.DeleteUser(name);
	}

	@Override
	public List<Message> mypageMessage(String name) {
		return md.mypageMessage(name);
	}

	@Override
	public List<MyqnaVO> Myqna(String name) {
		return md.Myqna(name);
	}

}
