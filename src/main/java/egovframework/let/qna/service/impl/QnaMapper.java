package egovframework.let.qna.service.impl;
import java.util.List;
import java.util.Map;

import egovframework.let.qna.service.QnaBoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("qnaMapper")
public interface QnaMapper {
	// Qna 게시글 리스트 조회
	List<QnaBoardVO> selectQnaList(Map<String, Object> paramMap);
	
	// Qna 게시글 등록
	void insertQA(QnaBoardVO qnaBoardVO);
	

	// Qna 게시글 상세 조회
	QnaBoardVO selectQnaDetail(int qaId);

	// Qna 게시글 삭제
	void deleteQA(int qaId);

	// Qna 게시글 수정
	void updateQA(QnaBoardVO qnaBoardVO) throws Exception;

	// Qna 게시글 조회수 증가
	void updateReadCount(int qaId);

	int selectQnaListTotalCount(Map<String, Object> paramMap);
}
