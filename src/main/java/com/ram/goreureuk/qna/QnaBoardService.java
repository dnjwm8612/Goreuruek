package com.ram.goreureuk.qna;


import java.util.List;




public interface QnaBoardService {
	//게시글 목록
	public List<QnaBoardVO> qnalist(int start, int end, String searchOption, String keyword) throws Exception;
	//게시글 작성
	public void qna_write(QnaBoardVO vo) throws Exception;
	//게시글 상세보기
	public QnaBoardVO qna_view(String qna_code) throws Exception;
	//게시글 수정
	public void qna_update(QnaBoardVO vo) throws Exception;
	//게시글 삭제
	public void qna_delete(String qna_code) throws Exception;
	//게시글 레코드개수
	public int qna_countArticle(String searchOption, String keyword) throws Exception;
	
	public String auth(String name) throws Exception;
	
}
