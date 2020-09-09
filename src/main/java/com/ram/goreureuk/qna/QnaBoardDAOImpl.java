package com.ram.goreureuk.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO{

	@Inject
	private SqlSession sql;
	
	private static final String namespace = "com.ram.goreureuk.mappers.QnaBoardMapper";

	//게시글 수정
	@Override
	public void qna_update(QnaBoardVO vo) throws Exception {
		System.out.println(vo);
		sql.update(namespace+".qna_updateArticle", vo);
	}

	//게시글 삭제
	@Override
	public void qna_delete(String qna_code) throws Exception {
		sql.delete(namespace+".qna_deleteArticle", qna_code);
	}

	//게시글 목록
	@Override
	public List<QnaBoardVO> qnalist(int start, int end, String searchOption, String keyword) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, Object> qmap = new HashMap<String, Object>();
		qmap.put("searchOption", searchOption);
		qmap.put("keyword", keyword);
		//between #{start}, #{end}에 입력된 값을 맵에
		qmap.put("start", start);
		qmap.put("end", end);
		return sql.selectList(namespace+".qnalist", qmap);
	}

	//게시글 작성
	@Override
	public void qna_write(QnaBoardVO vo) throws Exception {
		sql.insert(namespace+".qna_insert", vo);
	}

	//게시글 조회
	@Override
	public QnaBoardVO qna_view(String qna_code) throws Exception {
		return sql.selectOne(namespace + ".qna_view", qna_code);
	}

	//게시글 레코드 개수
	@Override
	public int qna_countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> qmap = new HashMap<String, String>();
		qmap.put("searchOption", searchOption);
		qmap.put("keyword", keyword);
		return sql.selectOne(namespace+".qna_countArticle", qmap);
	}

	@Override
	public String auth(String name) throws Exception {
		return sql.selectOne(namespace+".auth", name);
	}
	
}
