<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsreply_edit.jsp]</title></head>
<body>
 <%
  int sabun=Integer.parseInt(request.getParameter("sabun"));
  int num=Integer.parseInt(request.getParameter("num"));
  String writer=request.getParameter("writer");
  String content=request.getParameter("content");
  
  System.out.println("br_num:"+num);
  
  msg="update bbsreply set br_writer=?, br_content=? where br_num=?";
  
  PST=CN.prepareStatement(msg); 
 	PST.setString(1,writer);
 	PST.setString(2,content);
 	PST.setInt(3,num);
  PST.executeUpdate();
  
  System.out.println("댓글수정 성공했습니다");
  response.sendRedirect("bbsDetail.jsp?idx="+sabun);
 %>
</body>
</html>























