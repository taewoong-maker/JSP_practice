<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/InputJS.js"></script>
<title> [openSbSave.jsp]</title></head>
<body>
 <%
   String data = request.getParameter("userid");
   msg="select count(*) as cnt from bbs where b_sabun="+data;
   
   ST=CN.createStatement();
   RS = ST.executeQuery(msg);
   if(RS.next()==true)
	   Gtotal=RS.getInt("cnt");
   
   if(Gtotal>0){
	   System.out.println(data + " 사번은 이미 사용중입니다.");
 %>
	 <script type="text/javascript">
	 	alert(<%=data%> + " 사번은 이미 사용중입니다.");
	 	opener.iform.sabun.value="";
	 	self.close();
	 </script>
 <%
   }else{
	   System.out.println(data + " 사번은 사용가능합니다.");
 %>
	 <script type="text/javascript">
	 	flagS_t();
	 	self.close();
	 </script>
 <%}%>
 
</body>
</html>


















