<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsreply_insert.jsp]</title></head>
<body>
 <%
  int sabun=Integer.parseInt(request.getParameter("sabun"));
  String writer=request.getParameter("writer");
  String content=request.getParameter("content");
  msg="insert into bbsreply values(bbsreply_seq.nextval, ?, ?, sysdate, ?)" ;
  PST=CN.prepareStatement(msg);
  	PST.setString(1, writer);
  	PST.setString(2, content);
  	PST.setInt(3, sabun);
  PST.executeUpdate();
  System.out.println("댓글저장 성공했습니다");
  response.sendRedirect("bbsDetail.jsp?idx="+sabun);
 %>
</body>
</html>























