<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_select.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  #rsave{
	    font-size: 26pt; font-weight: bold;
	    background:lightgreen;   height:130px;
	  }
	</style>

	<script type="text/javascript">
	  var gr_num; //전역변수
	  
	  function re_edit(num, writer, content){
		  
	  }//end
	  
	  function re_save(){//3페이지 26번라인
		  
	  }//end
	</script>
</head>
<body>
   
 <%
  //GuestReply.jsp단독실행하면 에러발생
  String Rdata = request.getParameter("Ridx") ; 
  System.out.println("7777777788888888888guest_reply.jsp댓글문서 넘어온  Ridx="+ Rdata);
  Statement ST;	
  ResultSet RS;
 %>
 	
 	<form name="reply_form">
 	 <table width=900 border=1 cellspacing=0>
 	 <tr>
 	  	<td> <img src="images/z1.gif"> Sabun: <img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="sabun" value="<%= Rdata %>" size=30 readonly="readonly"> </td>
 	  	<td rowspan="3"  align="center">
 	  		<input type="button" id="rsave" name="bt_save" onClick="re_save();" value="댓글저장">
 	  	</td>
 	  </tr> 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> 저자: <img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="writer" size=30> </td>
 	  </tr> 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> 내용: <img src="images/z1.gif">  </td>
 	  	<td> <textarea rows="3" cols="27" nam="content"></textarea> </td>
 	  </tr>
 	 </table>
 	</form> 	
 <p>
 <table width=900 border=0 cellspacing=0>
  <tr bgcolor="pink" align="center">
  	<td colspan="4"> 댓글 데이터 출력 </td> 
  </tr>
<%
//   StringBuffer sb = new StringBuffer( );//미사용 , StringBuilder 모아서 처리하니까 속도가 빠름
//   sb.append("select rownum rn, g.sabun, r.num, r.writer, r.content from guest g");
//   sb.append(" inner join guestreply r ");
//   sb.append(" on g.sabun = r.sabun ");
//   sb.append(" and r.sabun = " + Rdata);
  try{  	
// 	 String a=" select rownum rn, g.sabun, r.num, r.writer, r.content from guest g " ; 
// 	 String b=" inner join guestreply r " ;
// 	 String c=" on g.sabun = r.sabun  " ; 
// 	 String d=" and r.sabun =  " + Rdata ; 
	 String e=" select * from guestreply  ";
// 	 msg = a+b+c+d;
	 ST=CN.createStatement();
	 RS=ST.executeQuery(e); //msg대신 sb.toString()변환
	 while(RS.next()) {		 
%>
  <tr onmouseover="style.backgroundColor='yellow'" onmouseout="style.backgroundColor='' ">
<%--   	<td width=70>  <%= RS.getInt("rn") %> </td> --%>
  	<td width=70>  <%= RS.getInt("num") %> </td>
  	<td width=150> <%= RS.getString("writer") %> </td>
  	<td width=200> <%= RS.getString("content") %> </td>
  	<td>
  		<a href="#">[댓글삭제]</a>
  		<a href="#">[댓글수정]</a> 
  	</td>
  </tr>
  <% 
		 }
 	}catch(Exception e){ System.out.println(e);} %>
 </table>	
 
 <p style="margin-bottom:150px">
 <p><br>
</body>
</html>


