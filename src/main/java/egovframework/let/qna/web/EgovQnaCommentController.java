package egovframework.let.qna.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.LoginVO;
import egovframework.let.qna.service.QnaBoardVO;
import egovframework.let.qna.service.QnaCommentService;
import egovframework.let.qna.service.QnaCommentVO;

@Controller
public class EgovQnaCommentController {

    @Resource(name = "qnaCommentService")
    private QnaCommentService qnaCommentService;

    @RequestMapping("/main/sample_menu/insertComment.do")
    public String insertComment(QnaCommentVO commentVO, HttpSession session) throws Exception {
        LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");

        if (loginVO == null) throw new Exception("로그인 필요");

        commentVO.setWriterId(loginVO.getId());
        commentVO.setWriterName(loginVO.getName());

        qnaCommentService.insertComment(commentVO);

        return "redirect:/main/sample_menu/EgovQADetail.do?qaId=" + commentVO.getQaId();
    }

    @RequestMapping("/main/sample_menu/deleteComment.do")
    public String deleteComment(@RequestParam("commentId") int commentId, @RequestParam("qaId") int qaId, HttpSession session) throws Exception {
        LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
        if (loginVO == null) throw new Exception("로그인이 필요합니다.");

        QnaCommentVO comment = qnaCommentService.selectComment(commentId);
        if (comment == null) throw new Exception("댓글이 존재하지 않습니다.");

        boolean isWriter = loginVO.getId().equals(comment.getWriterId());
        boolean isAdmin = "ADMIN_GROUP".equals(loginVO.getGroupId());

        if (!isWriter && !isAdmin) {
            throw new Exception("댓글 삭제 권한이 없습니다.");
        }

        qnaCommentService.deleteComment(commentId);
        return "redirect:/main/sample_menu/EgovQADetail.do?qaId=" + qaId;
    }
}