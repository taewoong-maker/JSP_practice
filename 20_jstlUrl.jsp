<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[20_jstlUrl.jsp]</title>
</head>
<body>
	<c:url value="images/bear.jpg" var="data"/>
	<h3>${data }</h3>
	<img src="${data }">
	
</body>
</html>