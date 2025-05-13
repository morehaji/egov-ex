<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약 관리</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fnPageMove(pageNo) {
		var form = document.createElement("form");
		form.method = "post";
		form.action = "<c:url value='/room/adminRoomManage.do'/>";
		
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "pageIndex";
		input.value = pageNo;
		form.appendChild(input);
		
		document.body.appendChild(form);
		form.submit();
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
            <h2>전체 예약 현황</h2>

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
				                <c:out value="${resv.status}" />
				                <c:if test="${resv.status == 'APPLIED'}">
				                    <form action="<c:url value='/room/updateReservationStatus.do'/>" method="post" style="display:inline;">
				                        <input type="hidden" name="resvId" value="${resv.resvId}" />
				                        <input type="hidden" name="status" value="APPROVED" />
				                        <input type="submit" value="승인" />
				                    </form>
				                    <form action="<c:url value='/room/updateReservationStatus.do'/>" method="post" style="display:inline;">
				                        <input type="hidden" name="resvId" value="${resv.resvId}" />
				                        <input type="hidden" name="status" value="REJECTED" />
				                        <input type="submit" value="반려" />
				                    </form>
				                </c:if>
				            </td>
                            <td><fmt:formatDate value="${resv.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty reservationList}">
                        <tr>
                            <td colspan="8">예약된 항목이 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnPageMove" />
            

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
