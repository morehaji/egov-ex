<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약 관리</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function confirmAction(formId, message) {
	    if (confirm(message)) {
	        document.getElementById(formId).submit();
	    }
	}
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
            <h2>회의실 관리 - 예약관리</h2>

            <table>
                <thead>
                    <tr>
                        <th>예약 ID</th>
                        <th>회의실명</th>
                        <th>예약자</th>
                        <th>목적</th>
                        <th>시작 시간</th>
                        <th>종료 시간</th>
                        <th>상태</th>
                        <th>등록일</th>
                        <th>처리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="resv" items="${reservationList}">
                        <tr>
                            <td><c:out value="${resv.resvId}" /></td>
                            <td><c:out value="${resv.roomName}" /></td>
                            <td><c:out value="${resv.userId}" /></td>
                            <td><c:out value="${resv.purpose}" /></td>
                            <td><fmt:formatDate value="${resv.startTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                            <td><fmt:formatDate value="${resv.endTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                            <td>
				                <c:choose>
							        <c:when test="${resv.status == 'APPLIED'}">신청</c:when>
							        <c:when test="${resv.status == 'APPROVED'}">승인</c:when>
							        <c:when test="${resv.status == 'REJECTED'}">반려</c:when>
							        <c:when test="${resv.status == 'CANCELLED'}">취소</c:when>
							        <c:otherwise><c:out value="${resv.status}" /></c:otherwise>
							    </c:choose>
				                
				            </td>
                            <td><fmt:formatDate value="${resv.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                        	<td>
                        		<c:if test="${resv.status == 'APPLIED'}">
				                    <form id="approveForm_${resv.resvId}" method="post" action="${pageContext.request.contextPath}/room/updateReservationStatus.do">
						                <input type="hidden" name="resvId" value="${resv.resvId}" />
						                <input type="hidden" name="status" value="APPROVED" />
						                <button type="button" onclick="confirmAction('approveForm_${resv.resvId}', '해당 예약을 승인하시겠습니까?')" class="btn-approve">승인</button>
						            </form>
						
						            <form id="rejectForm_${resv.resvId}" method="post" action="${pageContext.request.contextPath}/room/updateReservationStatus.do">
						                <input type="hidden" name="resvId" value="${resv.resvId}" />
						                <input type="hidden" name="status" value="REJECTED" />
						                <button type="button" onclick="confirmAction('rejectForm_${resv.resvId}', '해당 예약을 반려하시겠습니까?')" class="btn-reject">반려</button>
						            </form>
				                </c:if>
                        	</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty reservationList}">
                        <tr>
                            <td colspan="8">예약된 항목이 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
<!--             <div class="pagination"> -->
<%-- 			    <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goPage"/> --%>
<!-- 			</div> -->

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

.btn-approve {
	background-color: #4CAF50;
	color: white;
	padding: 6px 12px;
	border: none;
	border-radius: 4px;
	margin: 2px;
	cursor: pointer;
}

.btn-reject {
	background-color: #f44336;
	color: white;
	padding: 6px 12px;
	border: none;
	border-radius: 4px;
	margin: 2px;
	cursor: pointer;
}
</style>
</html>
