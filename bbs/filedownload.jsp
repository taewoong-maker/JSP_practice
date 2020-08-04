<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [filedownload.jsp]</title>
  <style type="text/css">
    *{font-size:26pt; font-weight:bold; font-family:comic Sans MS ;  }
    a{font-size:26pt; font-weight:bold; color:blue; text-decoration:none; }
    a:hover{font-size:26pt; font-weight:bold; color:green; text-decoration:underline; }                
  </style>
  
</head>
<body>
<%
 String data=request.getParameter("fileName");
 String path=application.getRealPath("./storage");
 System.out.println("경로: " + path);
 System.out.println("filedownload.jsp 넘어온파일명: " + data);
 
  File file = new File(path, data); 
 
  response.setHeader("Content-Disposition", "attachment; filename="+data);
  try{
	  InputStream is=new FileInputStream(file); 
	  OutputStream os=response.getOutputStream(); 
	  
	  byte[ ] bit=new byte[(int)file.length()];
	  is.read(bit, 0, bit.length);
	  os.write(bit); 
	  
	  is.close(); os.close();
  }catch(Exception ex){System.out.println("다운로드실패:"+ex); }
%>

 <img src="<%=request.getContextPath()%>/storage/<%=data%>" width=350 height="300">
</body>
</html>









