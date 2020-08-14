<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> BBB.jsp </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
</head>
<body>
<%
	String path = application.getRealPath("storage");
	int size = 1024*1024*7;
	DefaultFileRenamePolicy drp =  new DefaultFileRenamePolicy();
// 	MultipartRequest mr = new MultipartRequest(1 request,2 경로,
// 							3 크기,4 인코딩, 5 문서덮어씌우기);
	MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8", drp);

// 	String a=request.getParameter("num");
// 	String b=request.getParameter("title");
// 	String c=request.getParameter("file1"); request를 써도 값이 넘어오지 않음

	//mr개체로 데이터 가져오기	
	String a=mr.getParameter("num");
	String b=mr.getParameter("title");
// 	String c=mr.getParameter("file1");//파일은 전송되지만 파일이름은 전송안됨
	String c=mr.getFilesystemName("file1");//파일이름, 파일 모두 전송됨
	
	out.println("넘어온번호 = " + a  + "<br>");
	out.println("넘어온제목 = " + b  + "<br>");
	out.println("넘어온파일 = " + c  + "<p>"); 
	
	File ff = mr.getFile("file1");
	long fsize = ff.length();
	out.println(c + " 파일 크기는 " + fsize + "Byte<br>");
%>	
	<a href="BBBdownload.jsp?fname=<%=c%>">
		 <img src="<%=request.getContextPath()%>/storage/<%=c%>" width="300" height="120"></a>
	<a href="BBBdownload.jsp?fname=<%=c%>">
		 <img src="./storage/<%=c%>" width="300" height="120"></a><br>
	<a href="AAA.jsp">[AAA.jsp]</a>
	<a href="index.jsp">[index.jsp]</a>
	<a href="guestList.jsp">[guestList.jsp]</a>
</body>
</html>


