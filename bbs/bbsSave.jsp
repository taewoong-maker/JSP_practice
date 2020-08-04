<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="./ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsSave.jsp]</title></head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	
 <%
  String path=application.getRealPath("./storage");
  System.out.println("경로 " + path);
  int size=1024*1024*7;
 
  DefaultFileRenamePolicy dfr = new  DefaultFileRenamePolicy( );
  MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8", dfr);
 
  sabun=Integer.parseInt(mr.getParameter("sabun"));
  msg="select count(*) as cnt from bbs where b_sabun=?";
  PST=CN.prepareStatement(msg);
  PST.setInt(1, sabun);
  RS=PST.executeQuery();
  RS.next();
  Gtotal=RS.getInt("cnt"); 
 if(Gtotal>0){
 %>
  <script type="text/javascript">
    alert(<%=sabun%>+ "데이터가 중복되었습니다.");
    location.href="Input.html";
  </script>
 <%	 
  }else{
	  System.out.println("등록 과정 체크");

	   name=mr.getParameter("name");
	   title=mr.getParameter("title");
	   content=mr.getParameter("content");
	   phone = mr.getParameter("num1")+"-"+mr.getParameter("num2")+"-"+mr.getParameter("num3");
	   System.out.println("폰번호:" + phone);
	   pwd = mr.getParameter("pwd");
	   addr1 = mr.getParameter("juso1");
	   addr2 = mr.getParameter("juso2");
	   email = mr.getParameter("email");
	   url = mr.getParameter("url");
	   file = mr.getFilesystemName("file");
	   
	   msg="insert into bbs values(bbs_seq.nextval, ?,?,?,0, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?)";
	   PST=CN.prepareStatement(msg);
	   	   PST.setInt(1,sabun);
	   	   PST.setString(2,name);
	   	   PST.setString(3, title);
	   	   PST.setString(4, content);
	   	   PST.setString(5, phone);
	   	   PST.setString(6, pwd);
	   	   PST.setString(7, addr1);
	   	   PST.setString(8, addr2);
	   	   PST.setString(9, email);
	   	   PST.setString(10, url);
	   	   PST.setString(11, file);
	   	   PST.setInt(12, size);
	   PST.executeUpdate(); 
	   
	   System.out.println(sabun+ "사번으로 bbs테이블  PST명령어 저장성공했습니다 ");
	   response.sendRedirect("bbsList.jsp");
  }
 %>
  
</body>
</html>


















