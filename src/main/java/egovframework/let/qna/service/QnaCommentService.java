package egovframework.let.qna.service;

import java.util.List;

public interface QnaCommentService {
    List<QnaCommentVO> selectCommentList(int qaId);
    void insertComment(QnaCommentVO comment) throws Exception;
    void deleteComment(int commentId) throws Exception;
    QnaCommentVO selectComment(int commentId) throws Exception;

}