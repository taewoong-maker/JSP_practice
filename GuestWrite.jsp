<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestWrite.jsp]</title>
<style type="text/css">
	*{
		font-size: 20pt;
	}
	table{
		border: 1px solid;
	}
	tr{
		border: 1px solid;
	}
	td{
		border: 1px solid;
		border-width: 0px;
	}
	a{
		text-decoration: none;
		color: green;
	}
	a:hover{
		font-size: 22pt;
		color: blue;
	}
</style>
<script type="text/javascript"></script>
</head>
<body>
	<br>
	GuestWrite 문서입력화면
	<form method="get" action="GuestWriteSave.jsp">
		사번 : <input type="text" name="sabun" id=""><br>
		이름 : <input type="text" name="name" id=""><br>
		제목 : <input type="text" name="title" id=""><br>
		급여 : <input type="text" name="pay" value="79"><br>
		메일 : <input type="email" name="email" id=""><br>		
			 <input type="submit" value="등록하기">
			 <input type="reset" value="입력취소">
	</form>
	<br>
		<a href="GuestWrite.jsp"> [등록] </a>		
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>