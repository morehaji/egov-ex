package egovframework.let.qna.service;

import java.util.List;
import java.util.Map;

public interface QnaBoardService {
	
	// Qna 게시글 리스트 조회
	List<QnaBoardVO> selectQnaList(Map<String, Object> paramMap) throws Exception;
	
	// Qna 게시글 등록
	void insertQA(QnaBoardVO qnaBoardVO) throws Exception;
	
	// Qna 게시글 상세 조회
	QnaBoardVO selectQnaDetail(int qaId);
	
	// Qna 조회수 증가
	void updateReadCount(int qaId) throws Exception;
	
	// Qna 게시글 삭제
	void deleteQA(int qaId) throws Exception;

	// Qna 게시글 수정
	void updateQA(QnaBoardVO qnaBoardVO) throws Exception;

	int selectQnaListTotalCount(Map<String, Object> paramMap) throws Exception;
	
	
}