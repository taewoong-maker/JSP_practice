<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[First.jsp]</title>
<style>
	*{
		font-size: 24pt
	}
</style>
</head>
<body>
<%! int a = 3; %>
1+2 의 결과는 <%=a %> 입니다.

<script type="text/javascript">
var result = confirm("실행하시겠어요 ?");

if(result)
{
    document.write("<h1> 실행합니다. </h1>")
}
else
{
    document.write("<h1> 실행하지 않습니다. </h1>")
}

</script>
</body>
</html>