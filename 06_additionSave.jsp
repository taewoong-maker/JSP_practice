<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[06_additionSave.jsp]</title>
</head>
<body>
	06_additionSave.jsp 324페이지 단독실행
	<%-- 377페이지 17번라인 참고 --%>
	<c:catch>
	${param.num1}+${param.num2}=${param.num1+param.num1}<br>
	</c:catch>
	

</body>
</html>