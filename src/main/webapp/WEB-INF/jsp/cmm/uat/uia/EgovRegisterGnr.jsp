<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원가입</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('zip').value = data.zonecode;
            document.getElementById('adres').value = data.address;
            document.getElementById('detailAdres').focus();  // 포커스
        }
    }).open();  // 자동으로 닫힘
}
</script>

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
			<!-- content 시작 -->
			<div id="content">
				<div id="cur_loc">
					<div id="cur_loc_align">
						<ul>
							<li>HOME</li>
							<li>&gt;</li>
							<li><strong>회원가입</strong></li>
						</ul>
					</div>
				</div>
				<h2>일반회원가입</h2>

				<form action="<c:url value='/cmm/uat/uia/insertGnrMber.do'/>"
					method="post" class="register-form">
					<div class="form-group">
						<label for="mberId">아이디</label> <input type="text" id="mberId"
							name="mberId" required />
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							id="password" name="password" required />
					</div>

					<div class="form-group">
						<label for="passwordHint">비밀번호 힌트</label> <select
							id="passwordHint" name="passwordHint" required>
							<option value="">선택</option>
							<option value="1">나의 고향은?</option>
							<option value="2">내가 좋아하는 음식은?</option>
						</select>
					</div>

					<div class="form-group">
						<label for="passwordCnsr">힌트 정답</label> <input type="text"
							id="passwordCnsr" name="passwordCnsr" required />
					</div>

					<div class="form-group">
						<label for="mberNm">이름</label> <input type="text" id="mberNm"
							name="mberNm" required />
					</div>

					<div class="form-group">
						<label for="sexdstnCode">성별</label> <select id="sexdstnCode"
							name="sexdstnCode" required>
							<option value="">선택</option>
							<option value="M">남성</option>
							<option value="F">여성</option>
						</select>
					</div>

					<div class="form-group">
						<label for="zip">우편번호</label>
						<div style="display: flex; gap: 10px;">
							<input type="text" id="zip" name="zip" readonly />
							<button type="button" onclick="execDaumPostcode()" id="post_code">
							우편번호 찾기</button>
						</div>
					</div>

					<div class="form-group">
					  <label for="adres">주소</label>
					  <input type="text" id="adres" name="adres" readonly />
					</div>
					
					<div class="form-group">
					  <label for="detailAdres">상세주소</label>
					  <input type="text" id="detailAdres" name="detailAdres" />
					</div>

					<div class="form-group">
						<label for="mberEmailAdres">이메일</label> <input type="email"
							id="mberEmailAdres" name="mberEmailAdres" />
					</div>

					<div class="form-group">
						<label for="mbtlnum">휴대폰 번호</label> <input type="text"
							id="mbtlnum" name="mbtlnum" />
					</div>

					<div class="form-group full">
						<button type="submit" class="submit-btn">회원가입</button>
					</div>
				</form>
			</div>
			<!-- //content 끝 -->
		</div>
		<!-- //container 끝 -->
		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->
	</div>

</body>
<style>
.register-form {
	width: 500px;
	margin: 40px auto;
	padding: 30px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	font-family: '맑은 고딕', sans-serif;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 6px;
	color: #A1A0A0;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 10px;
	border: 1px solid #bbb;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 14px;
}

.submit-btn {
	width: 100%;
	padding: 12px;
	font-size: 16px;
	background-color: #03c75a;
	color: white;
	font-weight: bold;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.submit-btn:hover {
	background-color: #02b050;
}

.form-group.full {
	text-align: center;
}

#post_code {
	border-radius: 10px;
	padding-left: 2px;
	padding-right: 2px;
}
#post_code:hover {
	cursor:pointer;
}

</style>
</html>