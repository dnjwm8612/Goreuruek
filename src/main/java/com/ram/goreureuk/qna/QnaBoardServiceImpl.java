package com.ram.goreureuk.qna;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Inject
	private QnaBoardDAO dao;

	//게시글 목록
	@Override
	public List<QnaBoardVO> qnalist(int start, int end, String searchOption, String keyword) throws Exception {
		return dao.qnalist(start, end, searchOption, keyword);
	}

	//게시글 작성
	@Override
	public void qna_write(QnaBoardVO vo) throws Exception {
		String qna_title = vo.getQna_title();
		String qna_content = vo.getQna_content();
		String qna_mmid = vo.getQna_mmid();
		
		//줄바꿈 처리
		//qna_content = qna_content.replace("\n", "<br>");
	
		vo.setQna_title(qna_title);
		vo.setQna_content(qna_content);
		vo.setQna_mmid(qna_mmid);
		dao.qna_write(vo);
	}

	//게시글 보기
	public QnaBoardVO qna_view(String qna_code) throws Exception {
		return dao.qna_view(qna_code);
	}

	//게시글 수정  
	public void qna_update(QnaBoardVO vo) throws Exception {
		String qna_title = vo.getQna_title();
		String qna_content = vo.getQna_content();
		String qna_mmid = vo.getQna_mmid();
		
		//줄바꿈 처리
		qna_content = qna_content.replace("\n", "<br>");
	
		vo.setQna_title(qna_title);
		vo.setQna_content(qna_content);
		vo.setQna_mmid(qna_mmid);
		dao.qna_update(vo);
	}

	//게시글 삭제
	public void qna_delete(String qna_code) throws Exception {
		dao.qna_delete(qna_code);
	}

	//게시글 레코드 개수
	@Override
	public int qna_countArticle(String searchOption, String keyword) throws Exception {
		
		return dao.qna_countArticle(searchOption, keyword);
	}

	@Override
	public String auth(String name) throws Exception {
		return dao.auth(name);
	}
	

}
