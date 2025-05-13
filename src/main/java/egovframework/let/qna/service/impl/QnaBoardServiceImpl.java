package egovframework.let.qna.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.qna.service.QnaBoardService;
import egovframework.let.qna.service.QnaBoardVO;

@Service("qnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService {

    @Resource(name = "qnaMapper")
    private QnaMapper qnaMapper; // 매퍼 인터페이스 주입 (MyBatis)

    // Qna 게시글 리스트 조회
    @Override
    public List<QnaBoardVO> selectQnaList(Map<String, Object> paramMap) throws Exception {
    	return qnaMapper.selectQnaList(paramMap);
    }
    
    @Override
    public int selectQnaListTotalCount(Map<String, Object> paramMap) throws Exception {
        return qnaMapper.selectQnaListTotalCount(paramMap);
    }
    
    // Qna 게시글 등록
    @Override
    public void insertQA(QnaBoardVO qnaBoardVO) throws Exception {
        qnaMapper.insertQA(qnaBoardVO);
    }
    
    // Qna 게시글 상세 조회
    @Override
    public QnaBoardVO selectQnaDetail(int qaId) {
    	return qnaMapper.selectQnaDetail(qaId);
    }
    
    // Qna 게시글 조회수 증가
    @Override
    public void updateReadCount(int qaId) throws Exception {
        qnaMapper.updateReadCount(qaId);
    }
    
    // Qna 게시글 삭제
    @Override
    public void deleteQA(int qaId) throws Exception {
        qnaMapper.deleteQA(qaId);
    }
    
    // Qna 게시글 수정
    @Override
    public void updateQA(QnaBoardVO qnaBoardVO) throws Exception {
        qnaMapper.updateQA(qnaBoardVO); // Mapper 호출
    }
}
