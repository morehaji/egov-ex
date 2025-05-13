<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>회의실 예약</title>
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
				<h2>회의실 목록</h2>
				<table border="1">
					<tr>
						<th>회의실 명</th>
						<th>수용인원</th>
						<th>위치</th>
						<th>시설정보</th>
						<th></th>
					</tr>
					<c:forEach var="room" items="${roomList}">
						<tr>
							<td>${room.roomName}</td>
							<td>${room.capacity}</td>
							<td>${room.location}</td>
							<td>${room.equipmentInfo}</td>
							<td><a href="<c:url value='/room/roomReserve.do?roomId=${room.roomId}'/>">
									<button type="button">예약</button>
							</a></td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
		<!-- //container 끝 -->
		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->
	</div>
	<!-- //전체 레이어 끝 -->

</body>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px 12px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background-color: #f5f5f5;
}
</style>
</html>