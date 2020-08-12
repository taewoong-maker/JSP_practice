<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[14_movieList.jsp]</title>
</head>
<body>

	<%
		String[] movieList={"혹성탈출", "타이타닉", "어벤져스", "킹콩"};
		request.setAttribute("movieList", movieList);
	%>
	
	<c:forEach var="movie" items="${movieList }">
		${movie}<br>
	</c:forEach>
</body>
</html>