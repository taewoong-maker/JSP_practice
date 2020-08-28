<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestWriteSave.jsp]</title>
<style>
	
</style>
<script type="text/javascript"></script>
</head>

<body>
	<p>
<%
	//단독실행하면 에러
	Gsabun= Integer.parseInt(request.getParameter("sabun"));
	
	msg="select sabun from guest";
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
	while(RS.next()){
		if(Gsabun==RS.getInt("sabun")){
			%>
			<script type="text/javascript">
			alert("이미있는 사번입니다. 다른 사번을 이용하세요");
			//setTimeout("location.href='GuestWrite.jsp'", 1500);
			location.href="GuestWrite.jsp";
			</script>
			<%
			//break;
		}
	}
	Gname=request.getParameter("name");	
	Gtitle=request.getParameter("title");
	Gpay=  Integer.parseInt(request.getParameter("pay"));
	Gemail=request.getParameter("email");
	System.out.println("사번=" + Gsabun + "<br>");
	System.out.println("이름=" + Gname + "<br>");
	System.out.println("제목=" + Gtitle + "<br>");
	System.out.println("급여=" + Gpay + "<br>");
	System.out.println("메일=" + Gemail + "<br>");	

	try{
		msg="insert into guest values(?,?,?,sysdate,?,0,?)";
		//PreparedStatement명령어로
		PST=CN.prepareStatement(msg);
		PST.setInt(1, Gsabun);
		PST.setString(2, Gname);
		PST.setString(3, Gtitle);
		PST.setInt(4, Gpay);
		PST.setString(5, Gemail);
		PST.executeUpdate();	
		
		//statement명령어로
     	//ST=CN.createStatement();
		//msg="insert into guest("
		//		+"sabun, name, title, wdate, pay, hit, email)"
		//		+"values("
		//				+Gsabun+",'"+Gname+"','"+Gtitle+"',sysdate,"
		//				+Gpay+",0,'"+Gemail+"')"; 		
		//
		//에러가 있든없든 무조건 index.jsp로 넘어가도록 해놓음
		/* System.out.println(msg);
		out.println(msg); */
	}catch(Exception e){
		//response.sendRedirect("GuestWrite.jsp");
	}
	
	//저장성공 후 전체출력화면으로 이동
	response.sendRedirect("GuestList.jsp");
%>
<br>
		<a href="GuestWrite.jsp"> [등록] </a>		
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>