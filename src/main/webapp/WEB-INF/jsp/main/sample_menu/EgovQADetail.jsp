<%--
  Class Name : EgovQADetail.jsp
  Description : 샘플화면 - 묻고답하기 상세조회(sample)
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>표준프레임워크 경량환경 홈페이지템플릿</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
</head>

<body>

<script type="text/javascript">
function goUpdate() {
    location.href = "<c:url value='/main/sample_menu/EgovQAUpdt.do'/>?qaId=${qna.qaId}";
}

function goDelete() {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = "<c:url value='/main/sample_menu/DeleteQA.do'/>?qaId=${qna.qaId}";
    }
}

function CharCount(textarea) {
	document.getElementById('charCount').innerText = textarea.value.length;
}

// 답변 삭제 
function confirmCommentDelete(writerId) {
	const currentUser = '${loginVO.id}'; // 서버 세션에서 로그인 아이디 가져오기 
	const isAdmin = '${loginVO.groupId}' === 'ADMIN_GROUP'; // 관리자 판별
	
	if(currentUser !== writerId && !isAdmin) {
		alert('본인의 답변만 삭제할 수 있습니다.');
		return false;
	}
	return confirm('해당 답변을 삭제하시겠습니까?');
}
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
							<li>묻고답하기</li>
							<li>&gt;</li>
							<li><strong>Q&amp;A상세조회</strong></li>
						</ul>
					</div>
				</div>	
				<!-- //현재위치 네비게이션 끝 -->
				<!-- 타이틀 이미지 -->			
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-02.gif" width="776" height="230" alt="묻고/답하기 각종 문의 사항에 대한 답변을 친절하게 제공해 드리고 있습니다."/>					
				</div>
				<!-- main content 시작 -->
				<div class="content_field"><h2>Q&amp;A 상세조회</h2></div> 
				<!-- //main content 끝 -->	
				<div class="download_div03">
					<div class="qatable_wrap" style="">
						<div id="qna_detailtable">
						<table summary="Q&amp;A상세조회" cellpadding="0" cellspacing="0">
							<colgroup> 
								<col width="120">
								<col width="%">
								<col width="120">
								<col width="%">
							</colgroup>
							<tbody>
							<tr>
								<th>제목</th>
								<td>${qna.qaTitle}</td>
								<th>이메일</th>
								<td>${qna.writerId}</td>
							</tr>
							<tr>
								<th>이메일답변여부</th> 
								<td>답변요청</td>
								<th>등록일자</th>
								<td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${qna.writerName}</td>
								<th>전 화</th>
								<td>011-000-0000</td>
							</tr>
							<tr>
								<th>조회수</th>
								<td>${qna.readCount}</td>
								<th>첨부파일</th>
								<td colspan="3">log.txt [85,320 byte]</td>
							</tr>
							</tbody>
						</table>	
					<!-- 수정/삭제 버튼 영역 추가 -->
					<div class="qna-buttons">
						<c:if test="${loginVO.id == qna.writerId || loginVO.id == 'admin'}">
						    <button type="button" onclick="goUpdate()">수정</button>
						    <button type="button" class="delete-btn" onclick="goDelete()">삭제</button>
					    </c:if>
					</div>
						</div>				
					</div>
				</div>
		        <!-- main content 시작 -->
				<div class="content_field"><h3>질문</h3></div>
				<!-- //main content 끝 -->		
				<div class="qa_1st_wrap">
					<div class="qa_1st_loc">
						<p>${qna.qaContent}</p>
					</div>
				</div>	
				
				<c:forEach var="comment" items="${commentList}">
				<div class="qa_answer">
				    <div>
				        <ul>
				            <li>${comment.writerName}님의 답변</li>
				            <li><fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd HH:mm" /></li>
				            <li><p>${comment.commentText}</p></li>
				            <li>
				            <c:if test="${loginVO.id == comment.writerId || loginVO.groupId eq 'ADMIN_GROUP'}">
				                <form action="<c:url value='/main/sample_menu/deleteComment.do'/>" method="post" style="display:inline;" onsubmit="return confirmCommentDelete('${comment.writerId}')">
				                    <input type="hidden" name="commentId" value="${comment.commentId}" />
				                    <input type="hidden" name="qaId" value="${qna.qaId}" />
				                    <input type="submit" class="qa_btn_delete" value="삭제하기" />
				                </form>
				            </c:if>
				            </li>
				        </ul>
				    </div>
				</div>
				</c:forEach>
				<div class="qa_write_wrap"> 
				    <div class="qa_write_label">
				        <form action="<c:url value='/main/sample_menu/insertComment.do'/>" method="post" onsubmit="return confirm('댓글을 등록하시겠습니까?')">
						    <input type="hidden" name="qaId" value="${qna.qaId}" />
						    
						    <div class="qa_write_inputbox">
						        <textarea name="commentText" rows="2" cols="80" class="qa_write_txtarea"
						                  maxlength="1000" oninput="CharCount(this)" required></textarea>
						        <div class="char-count">
						            <span id="charCount">0</span> / 1000자
						        </div>
						    </div>
						
						    <div class="qa_write_submit">
						        <input type="submit" value="등록" class="btn_style" />
						    </div>
						</form>
					</div>
				</div>
					
				</div>
				
			<!-- //페이지 네비게이션 끝 -->
			</div>				
			<!-- //content 끝 -->
	<!-- //container 끝 -->
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->				
</div>
<!-- //전체 레이어 끝 -->
</body>
<style type="text/css">
    .qna-buttons {
        margin-top: 20px;
        text-align: right;
    }
    .qna-buttons button {
        padding: 7px 10px; /* 크기 키우기 */
        font-size: 12px;    /* 글자 크기 키우기 */
        border: none;
        background-color: #4CAF50; /* 초록색 */
        color: white;
        cursor: pointer;
        margin-left: 5px;
        margin-top: 5px;
        margin-bottom: 10px;
        border-radius: 10px; /* 둥글게 */
    }
    .qna-buttons button:hover {
        background-color: #45a049; /* hover 시 더 진한 초록 */
    }
    .qna-buttons button.delete-btn {
        background-color: #F08080; /* 삭제 버튼은 빨간색 */
    }
    .qna-buttons button.delete-btn:hover {
        background-color: #d32f2f;
    }
    .qa_btn_delete {
    display: inline-block;
    background-color: #F08080;
    color: white;
    padding: 4px 8px;
    font-size: 12px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
	}
	.qa_btn_delete:hover {
	    background-color: #d32f2f;
	}
	.qa_write_label form {
    display: flex;
    align-items: center;
    gap: 10px;
}

.qa_write_txtarea {
    min-width: 650px;
    min-height: 100px;
    resize: none;
    padding: 5px;
    border: 1px solid #dddddd;
    border-radius: 5px;
}
.qa_write_txtarea:focus {
    outline: none;
    box-shadow: none;
}
.char-count {
    font-size: 12px;
    color: #666;
    text-align: right;
    padding-right: 5px;
}

.qa_write_submit {
    margin-top: 10px;
}

.qa_write_submit input[type="submit"] {
    height: 40px;
    padding: 0 16px;
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

.qa_write_submit input[type="submit"]:hover {
    background-color: #45a049;
}


.qa_write_inputrow {
    display: flex;
    align-items: center;
    gap: 10px;
}



.qa_write_inputrow input[type="submit"] {
    height: 40px;
    padding: 0 16px;
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

.qa_write_inputrow input[type="submit"]:hover {
    background-color: #45a049;
}
</style>
</html>