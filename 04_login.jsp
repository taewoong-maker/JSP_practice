<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[04_login.jsp]</title>
</head>
<body>
	04_login.jsp 317page
	<form action="04_testLogin.jsp">
		<label for="userid"> 아이디 : </label>
		<input type="text" name="id" id="userid"><br>
		
		<label for="userpwd"> 암 &nbsp; 호 : </label>
		<input type="password" name="" id="userpwd"><br>
		
		<input type="submit" value="로그인">
			
	</form>
	<br>
	<a href="04_testLogin.jsp">04_testLogin.jsp</a>
	<a href="index.jsp">index</a>
	<a href="GuestList.jsp">리스트</a>
</body>
</html>