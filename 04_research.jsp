<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[04_research.jsp]</title>
</head>
<body>
	04_research.jsp 315page
	<form action="04_researchSave.jsp">
		좋아하는계절
			제목 : <input type="text" name="title" value="snow">
			나이 : <input type="text" name="age" value="27">
			좋아하는계절 : 
			<input type="checkbox" name="season" value="spring">봄
			<input type="checkbox" name="season" value="summer">여름
			<input type="checkbox" name="season" value="fall">가을
			<input type="checkbox" name="season" value="winter">겨울
			<input type="submit" value="결과보기">
	</form>
	<br>
	<a href="04_research.jsp">계절화면</a>
	<a href="index.jsp">index</a>
	<a href="GuestList.jsp">리스트</a>
</body>
</html>