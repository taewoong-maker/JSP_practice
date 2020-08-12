<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[06_addition.jsp]</title>
</head>
<body>
	EL과 JSTL
	
	고전적인 방식 : <%-- 스크립트릿에서의 복잡한 자바코드 --%>
	<%
		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
	%>
	<%=num1 %> + <%=num2 %> = <%=num1 +num2%><br>
	
	EL 방식 : <%--보다 깔끔함 --%><br><br>
	${param.num1 } + ${param.num2 } = ${param.num1 +param.num2} <br>
	${param.num1 } * ${param.num2 } = ${param.num1 *param.num2}<br>
	${param.num1 } / ${param.num2 } = ${param.num1 /param.num2}<br>
	${param.num1 } % ${param.num2 } = ${param.num1 %param.num2}<br>
</body>
</html>