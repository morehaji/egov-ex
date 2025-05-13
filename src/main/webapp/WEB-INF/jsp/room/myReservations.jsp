<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>내 예약</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
</head>
<body>
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
			<div id="leftmenu">
				<c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" />
			</div>
			<!-- //좌측메뉴 끝 -->
			<div id="content">
				<h2>내 예약</h2>
				<table border="1" style="width:100%; border-collapse:collapse;">
				    <thead>
				        <tr>
				            <th>회의실</th>
				            <th>시작 시간</th>
				            <th>종료 시간</th>
				            <th>목적</th>
				            <th>상태</th>
				            <th></th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="resv" items="${myReservations}">
				            <tr>
				                <td><c:out value="${resv.roomName}" /></td>
				                <td><fmt:formatDate value="${resv.startTime}" pattern="yyyy-MM-dd HH:mm" /></td>
				                <td><fmt:formatDate value="${resv.endTime}" pattern="yyyy-MM-dd HH:mm" /></td>
				                <td><c:out value="${resv.purpose}" /></td>
				                <td><c:out value="${resv.status}" /></td>
				                <td>
								  <c:choose>
								    <c:when test="${resv.status eq 'CANCELLED'}">
								      <span style="color: gray;">취소됨</span>
								    </c:when>
								    <c:otherwise>
								      <form action="<c:url value='/room/cancelReservation.do'/>" method="post" style="display:inline;">
								        <input type="hidden" name="resvId" value="${resv.resvId}" />
								        <button type="submit" onclick="return confirm('정말 취소하시겠습니까?')">취소</button>
								      </form>
								    </c:otherwise>
								  </c:choose>
								</td>
				            </tr>
				        </c:forEach>
				        <c:if test="${empty myReservations}">
				            <tr>
				                <td colspan="5" style="text-align:center;">예약 내역이 없습니다.</td>
				            </tr>
				        </c:if>
				    </tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<style>
/* 전체 콘텐츠 영역 */
#content {
	background-color: #fff;
	padding: 30px;
	margin: 20px auto;
	border-radius: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
	max-width: 800px;
	font-family: 'Segoe UI', sans-serif;
}

/* 제목 */
h2 {
	text-align: center;
	color: #333;
	margin-bottom: 24px;
}

/* 테이블 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 15px;
}

/* 테이블 헤더 */
table thead {
	background-color: #f2f2f2;
}

table th, table td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
}

/* 테이블 행 호버 효과 */
table tbody tr:hover {
	background-color: #f9f9f9;
}

/* 비어 있는 메시지 셀 */
td[colspan="5"] {
	color: #999;
	font-style: italic;
}
.cancel-btn {
	background-color: #e74c3c;
	color: white;
	border: none;
	padding: 8px 12px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 12px;
	transition: background-color 0.3s;
}
.cancel-btn:hover {
	background-color: #c0392b;
}
</style>
</html>