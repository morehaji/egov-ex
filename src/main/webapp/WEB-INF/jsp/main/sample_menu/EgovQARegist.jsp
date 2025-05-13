<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<title>묻고답하기(Q&A) 등록</title>

<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css">

<style type="text/css">
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 8px; border: 1px solid #ddd; }
    th { background-color: #f5f5f5; text-align: left; }
    .buttons { margin-top: 20px; text-align: center; }
    .buttons a, .buttons button { margin: 0 5px; padding: 6px 12px; background-color: #4CAF50; color: white; border: none; cursor: pointer; text-decoration: none; }
    .buttons a { background-color: #2196F3; }
</style>
</head>

<body>
<div id="wrap">

    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>
    <!-- //header 끝 -->

    <!-- container 시작 -->
    <div id="container">
        
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        <!-- //좌측메뉴 끝 -->

        <div id="content">
            
            <div id="cur_loc">
                <div id="cur_loc_align">
                    <ul>
                        <li>HOME</li>
                        <li>&gt;</li>
                        <li>고객지원</li>
                        <li>&gt;</li>
                        <li><strong>묻고답하기</strong></li>
                    </ul>
                </div>
            </div>

            <div id="search_field">
                <div id="search_field_loc"><h2><strong>게시글 쓰기</strong></h2></div>
            </div>

            <div class="content_field">
                <form action="<c:url value='/main/sample_menu/insertQA.do'/>" method="post" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <th><label for="qaTitle">제목</label><span style="color:red">*</span></th>
                            <td><input type="text" id="qaTitle" name="qaTitle" size="80" maxlength="200" required></td>
                        </tr>
                        <tr>
                            <th><label for="qaContent">내용</label><span style="color:red">*</span></th>
                            <td><textarea id="qaContent" name="qaContent" cols="80" rows="15" required style="width:100%;"></textarea></td>
                        </tr>
                        <tr>
                            <th><label for="writerId">작성자 ID</label><span style="color:red">*</span></th>
                            <td><input type="text" id="writerId" name="writerId" size="30" maxlength="50" required></td>
                        </tr>
                        <tr>
                            <th><label for="writerName">작성자명</label><span style="color:red">*</span></th>
                            <td><input type="text" id="writerName" name="writerName" size="30" maxlength="50" required></td>
                        </tr>
                    </table>

                    <!-- 버튼 영역 -->
                    <div class="buttons">
                        <button type="submit">등록</button>
                        <a href="<c:url value='/main/sample_menu/EgovQA.do'/>">목록으로</a>
                    </div>

                </form>
            </div>

        </div>

    </div>
    <!-- //container 끝 -->

    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->

</div>

</body>
</html>
