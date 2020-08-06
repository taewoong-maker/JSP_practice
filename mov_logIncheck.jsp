<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mov_logincheck.jsp</title>
</head>
<body>
	
	<%	
		int a = 0;
		identity = request.getParameter("id");
		pass = request.getParameter("pass");
		msg = "select count(MG_ID) as cnt from mov_guinfo where MG_ID = ? and MG_PASS = ?";
		PST=CN.prepareStatement(msg);				
		PST.setString(1,identity);
		PST.setString(2,pass);
		RS=PST.executeQuery();
		RS.next();
		int Gtotal = RS.getInt("cnt");
		if(Gtotal>0){
			a=1;
			 response.sendRedirect("mov_board.jsp?idx="+a);
		}else{
			response.sendRedirect("mov_login.jsp");
		}
	%>
		
</body>
</html>