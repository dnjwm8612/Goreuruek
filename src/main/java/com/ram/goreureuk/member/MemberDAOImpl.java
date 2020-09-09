package com.ram.goreureuk.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sql;
	private static final String namespace="com.ram.goreureuk.mappers.memberMappers";

	@Override
	public MemberVO selectByEmail(String email) {
		 return sql.selectOne(namespace+".selectByEmail", email);
	}

	@Override
	public MemberVO selectById(String id) {
		return sql.selectOne(namespace+".selectById", id);
	}
	
	@Override
	public MemberVO selectByName(String name) {
		return sql.selectOne(namespace+".selectByName", name);
	}

	@Override
	public void insertUser(signUpVO signupvo) {
		 sql.insert(namespace+".register", signupvo);	
	}

	@Override
	public void updateDisabled(String username) {
		sql.update(namespace+".updateDisabled", username);
	}

	@Override
	public void updateFailureCount(String username) {
		sql.update(namespace+".updateFailureCount", username);
		
	}

	@Override
	public int checkFailureCount(String username) {
		return sql.selectOne(namespace+".checkFailureCount", username);
	}

	@Override
	public void updateFailureCountReset(String username) {
		sql.update(namespace+".updateFailureCountReset", username);
		
	}
	
	@Override
	public String findid(String MM_EMAIL) {
		return sql.selectOne(namespace+".findid", MM_EMAIL);
	}

	@Override
	public MemberVO findpw(HashMap<String, Object> map) {
		return sql.selectOne(namespace+".findpw", map);
	}

	@Override
	public void updatepw(HashMap<String, Object> map) {
		sql.update(namespace+".updatepw", map);
	}
	
	@Override
	public void inputGoogleInfo(GoogleInfoVO gvo) {
		sql.insert(namespace+".inputGoogleInfo", gvo);
		
	}

	@Override
	public void comparewithDB(GoogleInfoVO gvo) {
		sql.selectOne(namespace+".comparewithDB", gvo);
		
	}
	
	@Override
	public void editMemberEmail(signUpVO signupvo) {
		sql.update(namespace+".editMemberEmail", signupvo);
	}

	@Override
	public void editMemberName(signUpVO signupvo) {
		sql.update(namespace+".editMemberName", signupvo);
	}

}
