package egovframework.let.qna.web;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.let.qna.service.QnaBoardService;
import egovframework.let.qna.service.QnaBoardVO;
import egovframework.let.qna.service.QnaCommentService;
import egovframework.let.qna.service.QnaCommentVO;
import egovframework.com.cmm.LoginVO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EgovQnaController {
	@Resource(name = "qnaBoardService")
	private QnaBoardService qnaBoardService;
	@Resource(name = "qnaCommentService")
	private QnaCommentService qnaCommentService; // 추가
	
	
	
	// 목록 조회
    @RequestMapping("/main/sample_menu/EgovQA.do")
    public String selectQnaList(
    		@RequestParam(value = "search_select", required = false) String searchSelect,
            @RequestParam(value = "st_date", required = false) String stDate,
            @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
    		ModelMap model) throws Exception {
    	
    	// 페이지 설정
    	int recordCountPerPage = 5; // 페이지당 게시물 수 
    	int pageSize = 5;			 // 하단에 보여줄 페이지 번호 개수 
    	QnaBoardVO searchVO = new QnaBoardVO();
    	searchVO.setPageIndex(pageIndex);
    	searchVO.setRecordCountPerPage(recordCountPerPage);
    	searchVO.setPageSize(pageSize);
    	searchVO.setFirstIndex((pageIndex - 1) * recordCountPerPage);
    	
    	// 검색 조건도 담기
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("searchSelect", searchSelect);
        paramMap.put("stDate", stDate);
        paramMap.put("firstIndex", searchVO.getFirstIndex());
        paramMap.put("recordCountPerPage", searchVO.getRecordCountPerPage());
    	
        List<QnaBoardVO> qnaList = qnaBoardService.selectQnaList(paramMap);
        int totalCount = qnaBoardService.selectQnaListTotalCount(paramMap); // 전체 게시물 수

        searchVO.setTotalCount(totalCount);

        model.addAttribute("qnaList", qnaList);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("searchSelect", searchSelect);
        model.addAttribute("stDate", stDate);
        System.out.println("검색 조건: searchSelect=" + searchSelect + ", stDate=" + stDate);
        return "main/sample_menu/EgovQA";
    }
	
	// 등록 폼 호출 
	@RequestMapping("/main/sample_menu/EgovQARegist.do")
	
	public String qaRegistForm(ModelMap model) throws Exception {
		model.addAttribute("qnaBoardVO", new QnaBoardVO());
		return "main/sample_menu/EgovQARegist"; // jsp 파일 경로
	}
	
	// 등록 처리 
	@RequestMapping("/main/sample_menu/insertQA.do")
	public String insertQA(@Valid QnaBoardVO qnaBoardVO, BindingResult bindingResult, ModelMap model) throws Exception {
		if (bindingResult.hasErrors()) {
            // 입력값 오류시 다시 등록 페이지로
            return "main/sample_menu/EgovQARegist";
        }
		qnaBoardService.insertQA(qnaBoardVO);  // DB 등록 처리

        return "redirect:/main/sample_menu/EgovQA.do"; // 등록 후 목록 페이지로 이동
	}
	
	// qna글 상세조회
	@RequestMapping("/main/sample_menu/EgovQADetail.do")
	public String selectQnaDetail(QnaBoardVO qnaBoardVO, ModelMap model, HttpSession session) throws Exception {
		
		// 조회수 1 증가시키기
	    qnaBoardService.updateReadCount(qnaBoardVO.getQaId());
		
	    // 상세 조회
		QnaBoardVO result = qnaBoardService.selectQnaDetail(qnaBoardVO.getQaId());
		model.addAttribute("qna",result);
		List<QnaCommentVO> commentList = qnaCommentService.selectCommentList(qnaBoardVO.getQaId()); // 추가
	    model.addAttribute("commentList", commentList); // 커멘트 리스트 모델에 추가
		
	    LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
	    model.addAttribute("loginVO", loginVO);
	    
		return "main/sample_menu/EgovQADetail";
	}
	
	// qna글 삭제
	@RequestMapping("/main/sample_menu/DeleteQA.do")
	public String deleteQA(@RequestParam("qaId") int qaId, HttpSession session, ModelMap model) throws Exception {
		
	    // 글 작성자 or 관리자만 삭제 가능
	    QnaBoardVO qna = qnaBoardService.selectQnaDetail(qaId);
	    LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");

	    if (loginVO != null) {
	        String loginId = loginVO.getId();

	        if (qna.getWriterId().equals(loginId) || "admin".equals(loginId)) {
	            qnaBoardService.deleteQA(qaId); // 삭제 서비스 호출
	        } else {
	            throw new Exception("삭제 권한이 없습니다.");
	        }
	    } else {
	        throw new Exception("로그인 정보가 없습니다.");
	    }

	    return "redirect:/main/sample_menu/EgovQA.do"; // 삭제 후 목록으로 리다이렉트
	}
	
	// qna글 수정 페이지
	@RequestMapping("/main/sample_menu/EgovQAUpdt.do")
	public String updateQA(@RequestParam("qaId") int qaId, ModelMap model, HttpSession session) throws Exception {
	    QnaBoardVO result = qnaBoardService.selectQnaDetail(qaId);
	    LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
	    
	    if (loginVO == null || (!loginVO.getId().equals(result.getWriterId()) && !"admin".equals(loginVO.getId()))) {
	        throw new Exception("수정 권한이 없습니다.");
	    }
	    
	    model.addAttribute("qna", result);

	    return "main/sample_menu/EgovQAUpdt"; // 수정 화면으로 이동
	}
	
	// 수정 처리
	@RequestMapping("/main/sample_menu/UpdateQA.do")
	public String updateQADo(QnaBoardVO qnaBoardVO, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
	    LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");

	    if (loginVO != null) {
	        String loginId = loginVO.getId();
	        QnaBoardVO dbQna = qnaBoardService.selectQnaDetail(qnaBoardVO.getQaId());

	        if (dbQna.getWriterId().equals(loginId) || "admin".equals(loginId)) {
	            qnaBoardService.updateQA(qnaBoardVO); // 수정 처리
	            redirectAttributes.addFlashAttribute("message", "수정이 완료되었습니다.");
	        } else {
	            throw new Exception("수정 권한이 없습니다.");
	        }
	    } else {
	        throw new Exception("로그인이 필요합니다.");
	    }

	    return "redirect:/main/sample_menu/EgovQA.do";
	}
	
	
	
	
	
	
}
