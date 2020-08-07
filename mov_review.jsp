<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mov_review.jsp</title>
<script src="js/mov_review.js"></script>
</head>
<link rel="stylesheet" href="css/mov_review.css">
<body>

<div class="container">
        <h2>영화후기</h2>
        <form name="revform" method="post" enctype="multipart/form-data" action="mov_reviewsave.jsp">
            <div class="id">
                <input type="text" name="id" placeholder="ID">
            </div>
            <div class="pass">
                <input type="password" name="pass" placeholder="password">
            </div>
            <div class="title">
                <input type="text" name="title" placeholder="제목">
            </div>
            <div class="poster">
                <input type="file" name="file" id="file">
            </div>
            <div class="content">
                <input type="text" name="content">
            </div>
            <div class="btn">
                <input type="button" value="등록하기" onclick="rev_sav();">
                <input type="button" value="리뷰게시판"
                 onclick="location.href='mov_board.jsp'">
            </div>
        </form>
    </div>
    <p>
</body>
</html>