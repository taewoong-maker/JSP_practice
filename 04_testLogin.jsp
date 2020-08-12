<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[04_testLogin.jsp]</title>
</head>
<body>
	04_testLogin.jsp 318page
	
	당신이 입력한 정보입니다(고전적 방식)<br><br>
	
	아이디 : <%=request.getParameter("id") %>
	비밀번호 : <%=request.getParameter("pwd") %><br><br>
	
	당신이 입력한 정보입니다(EL 방식)<br><br>
	아이디 : ${param.id }
	비밀번호 : ${param.pwd } // ${param["pwd"] } <br><br>
	<br>
	<a href="04_login.jsp">04_login.jsp</a>
	<a href="index.jsp">index</a>
	<a href="GuestList.jsp">리스트</a>
</body>
</html>