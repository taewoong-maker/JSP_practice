<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply.jsp] </title>
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
	  var dat=reply_form.rsave.value
	  
	  function re_edit(num, writer, content){
		 gr_num=num;
		 reply_form.writer.value=writer;
		 reply_form.content.value=content;
		 reply_form.rsave.value="댓글수정";
	  }//end
	  
	  function re_save(sabun){//3페이지 26번라인
		  var bt = reply_form.bt_save.value;
		  var writer = reply_form.writer.value;
		  var content = reply_form.content.value;
		 if(bt=="댓글저장"){
		  document.reply_form.action="GuestReply_insert.jsp?writer="+writer+"&content="+content+"&sabun="+sabun;
		  document.reply_form.method="post";
		  document.reply_form.submit();
	   	 }else if(bt=="댓글수정"){
		  document.reply_form.action="GuestReply_edit.jsp?writer="+writer+"&content="+content+"&sabun="+sabun+"&num="+gr_num;
		  document.reply_form.method="post";
		  document.reply_form.submit();
	  	} 
	  }//end
	</script>
</head>
<body>   
 <%
//GuestReply.jsp단독실행하면 에러발생
  String Rdata = request.getParameter("Ridx") ;
 %> 	
 	<form name="reply_form" action="GuestReply_insert.jsp">
	 	 <table width=900 border=1 cellspacing=0>
		 	 <tr>
		 	  	<td> <img src="images/z1.gif"> Sabun: <img src="images/z1.gif">  </td>
		 	  	<td> <input type="text" name="sabun"  size=30  value="<%=Rdata%>"> </td>
		 	  	<td rowspan="3"  align="center">
		 	  		<input type="button" id="rsave" name="bt_save" onClick="re_save('<%=Rdata%>');" value="댓글저장">
		 	  	</td>
		 	  </tr>
		 	  
		 	  <tr>
		 	  	<td> <img src="images/z1.gif"> 저자: <img src="images/z1.gif">  </td>
		 	  	<td> <input type="text" name="writer" size=30 > </td>
		 	  </tr>
		 	  
		 	  <tr>
		 	  	<td> <img src="images/z1.gif"> 내용: <img src="images/z1.gif">  </td>
		 	  	<td> <textarea rows="3" cols="27" name="content" ></textarea> </td>
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
	 String a=" select rownum rn,  r.num, r.writer, r.content , g.sabun from guest g " ; 
	 String b=" inner join guestreply r " ;
	 String c=" on g.sabun = r.sabun  " ; 
	 String d=" and  r.sabun =  " + Rdata ; 
	 msg = a+b+c+d;
	 ST=CN.createStatement();
	 RS=ST.executeQuery(msg); //msg대신 sb.toString()변환	 
	 while(RS.next()) {
%>

  <tr align="center" onmouseover="style.backgroundColor='yellow'" onmouseout="style.backgroundColor='' ">
  	 <td width=70>  <%= RS.getInt("num") %> </td>
  	 <td width=150> <%= RS.getString("writer") %> </td>
  	 <td width=200> <%= RS.getString("content") %> </td>
  	 <td>
  		<a href="GuestReply_delete.jsp?idx=<%=RS.getInt("num")%>">[댓글삭제]</a>
  		<input type="button" onclick="re_edit('<%= RS.getInt("num") %>',
  		 '<%= RS.getString("writer") %>', '<%= RS.getString("content") %>');" value="댓글수정">
  	 </td>
  </tr>
<%
	 }
  }catch(Exception e){ System.out.println(e);}
%>  
 </table>	
 
 <p style="margin-bottom:150px">
 <p><br>
 	<br>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="index.jsp"> [index] </a>
		<a href="login.jsp"> [login] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>


