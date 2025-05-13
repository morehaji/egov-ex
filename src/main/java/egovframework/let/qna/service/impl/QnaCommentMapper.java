package egovframework.let.qna.service.impl;

import java.util.List;

import egovframework.let.qna.service.QnaCommentVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("qnaCommentMapper")
public interface QnaCommentMapper {
    List<QnaCommentVO> selectCommentList(int qaId);
    void insertComment(QnaCommentVO comment);
    void deleteComment(int commentId);
    QnaCommentVO selectComment(int commentId);
    
}