package com.ram.goreureuk.test;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EDAO {
	
	@Inject
	private SqlSession session;
	private static final String namespace="com.test";
	
	public ArrayList<EDTO> getEmployeeList(){
		List<EDTO> list = session.selectList(namespace+".selectList");
		return(ArrayList<EDTO>) list;
	}
}
