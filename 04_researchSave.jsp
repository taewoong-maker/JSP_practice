<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[04_researchSave.jsp]</title>
</head>
<body>
	04_researchSave.jsp 315page<br>
	<%
		String a[] = request.getParameterValues("season");
		for(String i:a){
			out.println(i+"<br>");
		}
	%>
	<br>
	<c:forEach items="${paramValues.season}" var="season">
		${season}<br>
	</c:forEach>
	<br>
	<a href="04_research.jsp">계절화면</a>
	<a href="index.jsp">index</a>
	<a href="GuestList.jsp">리스트</a>
</body>
</html>