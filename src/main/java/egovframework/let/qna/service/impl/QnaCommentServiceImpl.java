package egovframework.let.qna.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.qna.service.QnaCommentService;
import egovframework.let.qna.service.QnaCommentVO;

@Service("qnaCommentService")
public class QnaCommentServiceImpl implements QnaCommentService {

    @Resource(name = "qnaCommentMapper")
    private QnaCommentMapper qnaCommentMapper;

    public List<QnaCommentVO> selectCommentList(int qaId) {
        return qnaCommentMapper.selectCommentList(qaId);
    }

    public void insertComment(QnaCommentVO comment) throws Exception {
        qnaCommentMapper.insertComment(comment);
    }

    public void deleteComment(int commentId) throws Exception {
        qnaCommentMapper.deleteComment(commentId);
    }
    
    @Override
    public QnaCommentVO selectComment(int commentId) throws Exception {
        return qnaCommentMapper.selectComment(commentId);
    }
}
