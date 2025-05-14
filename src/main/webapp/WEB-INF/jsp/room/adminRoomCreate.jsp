<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 생성 관리</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">

</script>
</head>
<body>
	<div id="wrap">
		<div id="header_mainsize">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" />
		</div>
		<div id="topnavi">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" />
		</div>
		<div id="container">
			<div id="leftmenu">
				<c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" />
			</div>
			<div id="content">
				<h2>회의실 관리 - 생성 관리</h2>

				<!-- 회의실 등록 버튼 -->
				<div style="text-align: right; margin-bottom: 10px;">
					<a href="<c:url value='/room/adminRoomCreateForm.do'/>"><button
						style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;">
						회의실 등록</button></a>
				</div>

				<!-- 회의실 목록 -->
				<table>
					<thead>
						<tr>
							<th>회의실 ID</th>
							<th>회의실명</th>
							<th>수용 인원</th>
							<th>위치</th>
							<th>비품 정보</th>
							<th>사용여부</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="room" items="${roomList}">
							<tr>
								<td><c:out value="${room.roomId}" /></td>
								<td><c:out value="${room.roomName}" /></td>
								<td><c:out value="${room.capacity}" /></td>
								<td><c:out value="${room.location}" /></td>
								<td><c:out value="${room.equipmentInfo}" /></td>
								<td>
								    <c:choose>
								        <c:when test="${room.useYn eq 'Y'}">사용</c:when>
								        <c:otherwise>미사용</c:otherwise>
								    </c:choose>
								</td>
								<td><fmt:formatDate value="${room.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
						<c:if test="${empty roomList}">
							<tr>
								<td colspan="6">등록된 회의실이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}
</style>
</html>
