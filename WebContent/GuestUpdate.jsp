<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestUpdate.jsp]</title>
<style>
	tr:nth-child(1) {
	text-align:center;	
	}
	tr:nth-child(2) td:nth-child(1) {
	text-align:center;	
	}
	.sabun{
	background-color: lightgray;
	}
	td{
	padding:7px;
	}
</style>
<script type="text/javascript"></script>
</head>
<body>
	<p>
	
<%-- <%	GuestDTO dt = (GuestDTO)request.getAttribute("dto"); %> --%>
	수정화면(EL태그로 데이터 접근)
	<form action="gupdate.do" >
		사번 : <input type="text" name="sabun" value="${dto.sabun}" readonly><br>
		이름 : <input type="text" name="name" value="${dto.name}"><br>
		제목 : <input type="text" name="title" value="${dto.title}"><br>
		급여 : <input type="text" name="pay" value="${dto.pay}"><br>
		메일 : <input type="email" name="email" value="${dto.email}"><br>		
			 <input type="submit" value="MVC2 수정하기">
<!-- 			 <input type="button" value="뒤로가기"> -->
	</form>
</body>
</html>