<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestEditSave.jsp]</title></head>
<body>
 <%
 	 sabun=Integer.parseInt(request.getParameter("sabun"));
	 title=request.getParameter("title");		//수정 화면에선 제목과 내용만 변경 가능
	 content=request.getParameter("content");
	 
   msg="update bbs set b_title=?,b_content=? where b_sabun=?"; 
 
   PST=CN.prepareStatement(msg); 
   	PST.setString(1,title);
   	PST.setString(2,content);
   	PST.setInt(3,sabun);
   PST.executeUpdate();
   
   System.out.println("수정완료");
   response.sendRedirect("bbsList.jsp"); 
 %>
</body>
</html>


















