<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[17_paramValues.jsp]</title>
</head>
<body>

	당신이 선택한 항목입니다.<hr>
	<c:forEach var="item" items="${paramValues.item }" varStatus="status">
		${item }<br>
	</c:forEach>
	
</body>
</html>