<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[07_gugudan.jsp]</title>
</head>
<body>
	07_gugudan.jsp<br>
	<%-- 349페이지 JSTL 태그 변수선언 --%>
	<%-- 366페이지 JSTL태그 반복문 forEach begin end --%>

	<c:set var="dan" value="${9}" scope="page"/>
	dan 변수값 = ${dan}<br>
	<c:catch>
		<c:forEach var="cnt" begin="1" end="9">
			${dan}*${cnt}=${dan*cnt}<br>
		</c:forEach>		
	</c:catch>
</body>
</html>