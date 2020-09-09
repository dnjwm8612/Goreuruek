package com.ram.goreureuk.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ram.goreureuk.freeboard.FreeBoardLikes;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.freeboard.Message;
import com.ram.goreureuk.freeboard.ReplyVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.member.signUpVO;
import com.ram.goreureuk.message.MessageVO;
import com.ram.goreureuk.messagereply.MessageReplyVO;
import com.ram.goreureuk.recipe.RecipeVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Autowired
	private SqlSession sql;
	private static final String namespace="com.ram.goreureuk.mappers.memberMappers";
	private static final String nameSpace = "com.ram.goreureuk.mappers.freeBoardMapper";
	private static final String Namespace = "com.ram.goreureuk.mappers.RecipeMapper";


	@Override
	public MemberVO mypageView(String name) {
		return sql.selectOne(namespace+".mypageView", name);
	}


	@Override
	public List<FreeBoardVO> mypageFreeList(String name) {
		return sql.selectList(nameSpace+".mypageFreeList", name);
	}


	@Override
	public List<RecipeVO> mypageRecipeList(String name) {
		return sql.selectList(Namespace+".mypageRecipeList", name);
	}


	@Override
	public List<ReplyVO> mypageFreeReply(String name) {
		return sql.selectList(nameSpace+".mypageFreeReply", name);
	}


	@Override
	public List<com.ram.goreureuk.recipe.ReplyVO> mypageRecipeReply(String name) {
		return sql.selectList(Namespace+".mypageRecipeReply", name);
	}


	@Override
	public List<FreeBoardLikes> mypageFreeLikes(String name) {
		return sql.selectList(nameSpace+".mypageFreeLikes", name);
	}


	@Override
	public List<FreeBoardVO> mypageFreeLikesList(String code) {
		return sql.selectList(nameSpace+".mypageFreeLikesList", code);
	}


	@Override
	public List<RecipeVO> mypageRecipeLikes(String name) {
		return sql.selectList(Namespace+".mypageRecipeLikes", name);
	}


	@Override
	public List<RecipeVO> mypageRecipeLikesList(String code) {
		return sql.selectList(Namespace+".mypageRecipeLikesList", code);
	}


	@Override
	public signUpVO editView(String name) {
		return sql.selectOne(namespace+".editView", name);
	}


	@Override
	public void editPw(signUpVO vo) {
		sql.update(namespace+".editPw", vo);
	}


	@Override
	public void DeleteUser(String name) {
		sql.delete(namespace+".DeleteUser", name);
	}


	@Override
	public List<Message> mypageMessage(String name) {
		return sql.selectList(namespace+".mypageMessage", name);
	}


	@Override
	public List<MyqnaVO> Myqna(String name) {
		return sql.selectList(namespace+".Myqna", name);
	}


}
