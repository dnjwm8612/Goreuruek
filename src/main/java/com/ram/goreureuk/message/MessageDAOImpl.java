package com.ram.goreureuk.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession sql;

	private static final String namespace = "com.ram.goreureuk.mappers.MessageMapper";
	
	//메세지 리스트
	@Override
	public List<MessageVO> mslist(int start, int end, String searchOption, String keyword) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, Object> mmap = new HashMap<String, Object>();
		mmap.put("searchOption", searchOption);
		mmap.put("keyword", keyword);
		//between #{start}, #{end}에 입력된 값을 맵에
		mmap.put("start", start);
		mmap.put("end", end);
		return sql.selectList(namespace+".mslist", mmap);
	}

	//메세지 작성
	@Override
	public void ms_write(MessageVO vo) throws Exception {
		sql.insert(namespace+".ms_insert", vo);
	}

	//메세지 답변(관리자>>유저)
	@Override
	public void ms_answer(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	//메세지 상세보기
	@Override
	public MessageVO ms_view(String ms_code) throws Exception {
		
		return sql.selectOne(namespace+".ms_view", ms_code);
	}

	//메세지 레코드 갯수
	@Override
	public int ms_countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> mmap = new HashMap<String, String>();
		mmap.put("searchOption", searchOption);
		mmap.put("keyword", keyword);
		return sql.selectOne(namespace+".ms_countArticle", mmap);
	}

	@Override
	public String code(String name) throws Exception {
		return sql.selectOne(namespace+".code", name);
	}

}
