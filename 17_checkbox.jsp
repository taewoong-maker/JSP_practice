<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[17_checkbox.jsp]</title>
</head>
<body>

	<form action="17_paramValues.jsp">
		<input type="checkbox" name="item" value="신발">신발
		<input type="checkbox" name="item" value="가방">가방
		<input type="checkbox" name="item" value="벨트">벨트<br>
		<input type="checkbox" name="item" value="모자">모자
		<input type="checkbox" name="item" value="시계">시계
		<input type="checkbox" name="item" value="쥬얼리">쥬얼리<br>
		<input type="submit" value="전송">
	</form>
	
</body>
</html>