<%--
  Class Name : EgovQA.jsp
  Description : 샘플화면 - 묻고답하기 목록조회(sample)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>표준프레임워크 경량환경 홈페이지템플릿</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
</head>
<body>
<script type="text/javascript">
window.onpageshow = function(event) {
    if (event.persisted) {
        location.reload();
    }
};
</script>
<!-- 전체 레이어 시작 -->
<div id="wrap">
	<!-- header 시작 -->
    <div id="header_mainsize">
        <c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" />
    </div>
    <div id="topnavi">
        <c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" />
    </div>
    <!-- //header 끝 -->
	<!-- container 시작 -->
	<div id="container">
		<!-- 좌측메뉴 시작 -->
		<div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
		<!-- //좌측메뉴 끝 -->
			<!-- content 시작 -->
			<div id="content">
				<!-- 현재위치 네비게이션 시작 -->
				<div id="cur_loc">
					<div id="cur_loc_align">
						<ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>고객지원</li>
                            <li>&gt;</li>
                            <li><strong>묻고/답하기</strong></li>
						</ul>
					</div>
				</div>
				<!-- //현재위치 네비게이션 끝 -->
				<!-- 타이틀 이미지 -->
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-02.gif" width="776" height="230" alt="둗고/답하기 각종 문의 사항에 대한 답변을 친절하게 제공해 드리고 있습니다."/></div>
				<!-- main content 시작 -->
				<div class="content_field"><h2>묻고 답하기(Q&amp;A)</h2></div>
				<!-- //main content 끝 -->

				 <!-- 검색 필드 박스 시작 -->
				<div id="search_field">
					<form action="<c:url value='/main/sample_menu/EgovQA.do'/>" method="get">
					  	<fieldset><legend>조건정보 영역</legend>
					  	<div class="sf_start" style="display: flex; align-items: center; gap: 10px;">
						    <div class="search_leftselect" style="padding-left:1.2em;">
						        <select name="search_select" id="search_select">
						            <option value="0" ${searchSelect  == '0' ? 'selected' : ''}>전체</option>
								    <option value="1" ${searchSelect  == '1' ? 'selected' : ''}>제목</option>
								    <option value="2" ${searchSelect  == '2' ? 'selected' : ''}>제목/내용</option>
								    <option value="3" ${searchSelect  == '3' ? 'selected' : ''}>작성자</option>
						        </select>
						    </div>
						
						    <div class="inputbox_style01">
						        <input type="text" name="st_date" value="${stDate}" />
						    </div>
						
						    <div class="buttons" style="display: flex; gap: 5px;">
						        <button type="submit">
								  <img src="<c:url value='/'/>images/img_search.gif" alt="search" />
								  검색
								</button>
						
						        <% if (session.getAttribute("LoginVO") != null) { %>
						            <a href="<c:url value='/main/sample_menu/EgovQARegist.do'/>">등록</a>
						        <% } %>
						    </div>
						</div>
						</fieldset>
					</form>
				</div>
				<!-- //검색 필드 박스 끝 -->
 				<div id="page_info"><div id="page_info_align"></div></div>
				<!-- table add start -->
				<div id="wrap">
				    
				
				    <div class="default_tablestyle">
				    <h4>총 게시글 수 : ${searchVO.totalCount}</h4>
				        <table summary="QnA 목록" cellpadding="0" cellspacing="0">
				            <caption>QnA 목록</caption>
				            <colgroup>
				                <col width="5%">
				                <col width="50%">
				                <col width="15%">
				                <col width="10%">
				                <col width="20%">
				            </colgroup>
				            <thead>
				                <tr>
				                    <th>번호</th>
				                    <th>제목</th>
				                    <th>작성자</th>
				                    <th>조회수</th>
				                    <th>등록일</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach var="qna" items="${qnaList}" varStatus="status">
				                	<tr>
					                	<td>${fn:length(qnaList) - status.index}</td>
				                        <td class="align_left_text">
				                            <a href="<c:url value='/main/sample_menu/EgovQADetail.do?qaId=${qna.qaId}'/>">
				                                ${qna.qaTitle}
				                            </a>
				                        </td>
				                        <td>${qna.writerName}</td>
				                        <td>${qna.readCount}</td>
				                        <td>
					                        <c:choose>
											    <c:when test="${not empty qna.regDate}">
											      <fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd" />
											    </c:when>
											    <c:otherwise>
											      -
											    </c:otherwise>
											</c:choose>
  										</td>
				                    </tr>
				                </c:forEach>
				            </tbody>
				        </table>
				    </div>
				</div>
				<!-- 페이지 네비게이션 시작 -->
				<div id="paging_div">
				  <ul class="paging_align">
			      <li class="first"><img src="<c:url value='/'/>images/btn/btn_prev.gif" alt="prev" /></li>
				    <c:forEach var="i" begin="1" end="${(searchVO.totalCount - 1) / searchVO.recordCountPerPage + 1}">
				      <li>
				        <a href="?pageIndex=${i}&search_select=${searchSelect}&st_date=${stDate}">${i}</a>
				      </li>
				    </c:forEach>
			      <li class="first"><img src="<c:url value='/'/>images/btn/btn_next.gif" alt="next" /></li>
				  </ul>
				</div>
			</div>
			<!-- //페이지 네비게이션 끝 -->


			</div>
	<!-- //container 끝 -->
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>