package com.ram.goreureuk.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserAuthDAO {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	private static final String namespace="com.ram.goreureuk.mappers.memberMappers";

    public CustomUserDetails getUserById(String username) {
        return sqlSession.selectOne(namespace+".selectUserById", username);
    }

}
