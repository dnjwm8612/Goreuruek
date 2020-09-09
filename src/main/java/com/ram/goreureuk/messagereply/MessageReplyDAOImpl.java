package com.ram.goreureuk.messagereply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MessageReplyDAOImpl implements MessageReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static final String namespace = "com.ram.goreureuk.mappers.MessageReplyMapper";
	
	//답변 목록
	@Override
	public List<MessageReplyVO> msrlist(String msr_mscode) {
		return sql.selectList(namespace+".msrlist", msr_mscode);
	}

	//답변 작성
	@Override
	public void msrinsert(MessageReplyVO vo) {
		sql.insert(namespace+".msrInsert", vo);
	}

	@Override
	public void msrupdate(MessageReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void msrdelete(String msr_code) {
		// TODO Auto-generated method stub
		
	}
}
