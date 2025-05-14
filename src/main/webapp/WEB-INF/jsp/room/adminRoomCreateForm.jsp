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
	function comfirmSubmit() {
		return confirm("회의실을 등록하시겠습니까?");
	}
	
	function confirmCancel() {
		if(confirm("등록을 취소하고 이전 페이지로 돌아가시겠습니까?")) {
			history.back();
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
				<h2>회의실 관리 - 회의실 등록</h2>
				<form action="${pageContext.request.contextPath}/room/insertRoom.do"
					method="post">
					<table>
						<tr>
							<th>회의실명</th>
							<td><input type="text" name="roomName" required /></td>
						</tr>
						<tr>
							<th>수용 인원</th>
							<td><input type="number" name="capacity" min="1" required /></td>
						</tr>
						<tr>
							<th>위치</th>
							<td><input type="text" name="location" required /></td>
						</tr>
						<tr>
							<th>비품 정보</th>
							<td><input type="text" name="equipmentInfo" /></td>
						</tr>
						<tr>
							<th>사용 여부</th>
							<td>
								<label><input type="radio" name="useYn" value="Y" checked> 사용</label>
								<label style="margin-left: 10px;"><input type="radio" name="useYn" value="N"> 미사용</label>
							</td>
						</tr>
						
					</table>

					<div style="margin-top: 20px; text-align: right;">
						<button type="submit" onclick="return confirmSubmit()"
							style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 4px;">등록</button>
						<button type="button" onclick="confirmCancel()"
							style="padding: 8px 16px; margin-left: 10px; background-color: #ccc; border: none; border-radius: 4px;">취소</button>
					</div>
				</form>


			</div>
		</div>
	</div>
</body>
<style>
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    font-size: 15px;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #f5f5f5;
    color: #333;
    width: 150px;
}

td input[type="text"],
td input[type="number"] {
    width: 95%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 8px;
}

td label {
    font-weight: normal;
    font-size: 14px;
}

button {
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #45a049;
}

button[type="button"]:hover {
    background-color: #b3b3b3;
}

h2 {
    margin-bottom: 20px;
    font-size: 18px;
    color: #2c3e50;
}
</style>
</html>
