package egovframework.let.uat.uia.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.let.uat.uia.service.GnrMberVO;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * 일반 로그인을 처리하는 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2009.03.06  박지욱     최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Controller
public class EgovLoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/egovLoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "cmm/uat/uia/EgovLoginUsr";
	}

	/**
	 * 일반 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

	    
		// 1. 일반 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);

		boolean loginPolicyYn = true;
		System.out.println(">> 로그인 시도 아이디: " + loginVO.getId());
		System.out.println(">> 비밀번호: " + loginVO.getPassword());
		System.out.println(">> 사용자구분: " + loginVO.getUserSe());
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

			request.getSession().setAttribute("LoginVO", resultVO);
			return "forward:/cmm/main/mainPage.do";
		} else {

			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/uat/uia/EgovLoginUsr";
		}

	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionMain.do")
	public String actionMain(ModelMap model) throws Exception {

		// 1. 사용자 인증 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/uat/uia/EgovLoginUsr";
		}

		// 2. 메인 페이지 이동
		return "forward:/cmm/main/mainPage.do";
	}

	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/cmm/main/mainPage.do";
	}
	
	/**
	 * 일반회원가입 페이지로 이동
	 */
	@RequestMapping(value = "/cmm/uat/uia/registerGnr.do")
	public String goGnrRegister() {
	    return "cmm/uat/uia/EgovRegisterGnr"; // JSP 파일명과 경로에 맞게 수정
	}
	
	// 일반회원 등록 처리 
	@RequestMapping("/cmm/uat/uia/insertGnrMber.do")
	public String insertGnrMber(@ModelAttribute("gnrMberVO") GnrMberVO gnrMberVO, HttpServletRequest request, ModelMap model) throws Exception {
		loginService.insertGnrMber(gnrMberVO);  // DB 저장
		System.out.println("가입 완료: " + gnrMberVO.getMberId());
		
		// 가입 완료 후 로그인 페이지로 이동 
		return "redirect:/uat/uia/egovLoginUsr.do";
	}

//	/**
//	 * 직원회원가입 페이지로 이동
//	 */
//	@RequestMapping("/cmm/uat/uia/registerEmp.do")
//	public String goEmpRegister() {
//	    return "cmm/uat/uia/EgovRegisterEmp"; // JSP 파일명과 경로에 맞게 수정
//	}
//
//	/**
//	 * 기업회원가입 페이지로 이동
//	 */
//	@RequestMapping("/cmm/uat/uia/registerCmp.do")
//	public String goCmpRegister() {
//	    return "cmm/uat/uia/EgovRegisterCmp"; // JSP 파일명과 경로에 맞게 수정
//	}
	
	

}