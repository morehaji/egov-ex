<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>회의실 예약</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
</head>
<script>
document.addEventListener('DOMContentLoaded', function() {
  const roomId = '${room.roomId}';  // JSTL로 삽입
  const calendarEl = document.getElementById('calendar');

  const calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek'
    },
    events: '<c:url value="/room/calendarEvents"/>?roomId=${room.roomId}',  // 문자열 템플릿 사용
    timeZone: 'local',
    locale: 'ko'
  });

  calendar.render();
});
</script>
<body>
<c:out value="${param.startTime}"/><br/>
<c:out value="${param.endTime}"/><br/>
<!-- 테스트 출력용 -->
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
				<h2>${room.roomName} 예약</h2>
				
				<!-- 날짜 선택 + 예약 현황 -->
				<div id="calendar" style="margin-top: 40px;"></div>
				
				<form action="<c:url value='/room/submitReservation.do'/>" method="post">
					<input type="hidden" name="roomId" value="${room.roomId}" /> 
					<label>예약자 ID</label><input type="text" name="userId" value="${sessionScope.LoginVO.id}" readonly />
					<label>예약 목적</label><input type="text" name="purpose" /> 
					<label>시작 시간</label><input type="datetime-local" name="startTime" required />
					<label>종료 시간</label><input type="datetime-local" name="endTime" required />
					<button type="submit">예약 제출</button>
				</form>

			</div>
		</div>
	</div>

</body>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background-color: #f4f7f9;
	margin: 0;
	padding: 0;
}

#content {
	background-color: #fff;
	padding: 30px;
	margin: 20px;
	border-radius: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
	max-width: 600px;
	margin-left: auto;
	margin-right: auto;
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 24px;
}

form {
	display: flex;
	flex-direction: column;
	gap: 10px;
}


input[type="text"], input[type="datetime-local"], input[type="date"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
}
button[type="submit"] {
	padding: 12px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}
button[type="submit"]:hover {
	background-color: #45a049;
}
label {
	font-weight: bold;
	margin-bottom: 3px;
	margin-top: 20px;
}
#timeSlotsContainer > div {
	padding: 8px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
	text-align: center;
}
.slot-reserved {
	background-color: #ddd;
	color: #888;
}
.slot-available {
	background-color: #c8f7c5;
	color: #000;
}
</style>
</html>