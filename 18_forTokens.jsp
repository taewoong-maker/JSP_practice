<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[18_forTokens.jsp]</title>
</head>
<body>

	<c:forTokens var="city" items="서울.인천,대구.부산" delims=",">
		${city }
	</c:forTokens>
	<br><br>
	<c:forTokens var="city" items="서울.인천,대구.부산" delims=".">
		${city }
	</c:forTokens>
	<br><br>
	<c:forTokens var="city" items="서울.인천,대구.부산" delims=",.">
		${city }
	</c:forTokens>
</body>
</html>