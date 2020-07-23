<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		*{font-size: 24pt;}
		a{font-size: 28pt; text-decoration: none; color: blue;}
		a:hover{font-size: 34pt; text-decoration: line-through; color: green;}
		div{
			align-items: center;
		}
	</style>
</head>
<body>
	AAA.jsp 문서 데이터 던져요<p>
	<%
		String Gname = "hong";
		int Gpay=96;
	%>
	<div>
	<a href="index.jsp">[index]</a>
	<a href="BBB.jsp?idx=<%=Gname%>&idx2=<%=Gpay%>">[BBB]</a>
	<a href="GuestWrite.jsp">[등록]</a>
	<a href="GuestList.jsp">[출력]</a>
	<p>
	<img src="images/bar.gif"><br>
	<img src="images/bar.gif"><br>
	<img src="images/bar.gif"><br>
	</div>
</body>
</html>