<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Gugudan.jsp]</title>
<style type:"text/css">
	*{
		font-size: 24pt
	}
</style>
<script type="text/javascript">
</script>

</head>

<body>
	<% 
	Date dt = new Date();
	int dan=3;
	for(int i =1;i<=9;i++){
		System.out.println(dan + "*" + i + "=" + dan*i + "<br>");
		out.println(dan + "*" + i + "=" + dan*i + "<br>");
	}//out 객체를 사용하면 웹 브라우저에 출력
//	out.println("날짜 = " + dt.toLocaleString() + "<br>");
	%>
	
</body>
</html>