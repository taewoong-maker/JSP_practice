<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsDetail.jsp]</title>
  <style type="text/css">
    *{font-size:20pt; font-weight:bold;  font-family:  Segoe UI Symbol , comic Sans MS ;  }
    a{font-size:20pt; font-weight:bold;  text-decoration:none; }
    a:hover{font-size:26pt; font-weight:bold; text-decoration:underline; }  
                 
  </style>
 </head>
<body>
<%
  String data=request.getParameter("idx");
  msg="update bbs set b_cnt=b_cnt+1 where b_sabun = " + data;	// 조회수 갱신
  ST=CN.createStatement( );
  ST.executeUpdate(msg);

  msg="select * from bbs where b_sabun = " + data; // 상세 출력 위한 테이블 참조
  ST=CN.createStatement( );
  RS=ST.executeQuery(msg);
  RS.next(); 
  sabun=RS.getInt("b_sabun");
  file=RS.getString("b_file1");
%>

 <table width=900 border=1 cellspacing=0 cellpadding=5 style="margin-left: auto; margin-right: auto;">
  <tr align="center" bgcolor="#21517B" style="color:white">
    <th colspan="3"> [<%= RS.getString("b_name") %>님] 상세정보출력 </th>
  <tr>
  
  <tr align="center">
  	<td bgcolor=white rowspan="4" align="center" width=350 height=250 style="padding:0px;"> 
  		<img src="../storage/<%if(file==null || file == ""){out.println("noi.png");}else{out.println(file);} %>" width=350 height=250> 
  	</td>
  	<td> 사 번:<%= RS.getInt("b_sabun") %> </td>
  	<td> 이 름: <%= RS.getString("b_name") %> </td>
  </tr>
  
  <tr align="center">
  	<td colspan="2"> 이 메 일: <%= RS.getString("b_email") %> </td>
  </tr>
  
  <tr align="center">
  	<td colspan="2"> 주 소: <%= RS.getString("b_juso1") %> </td>
  </tr>
  
  <tr align="center">
  	<td colspan="2"> 날 짜:  <%= RS.getDate("b_wdate") %> </td>
  </tr>
  
   <tr align="center">
  	<td colspan="2"  style="color:white"> 제 목: <%= RS.getString("b_title") %> </td>
  	<td> 조 회 수: <%= RS.getInt("b_cnt") %> </td>
  </tr>
  
  <tr height=200>
  	<td colspan="3"><%= RS.getString("b_content") %> </td>
  </tr>
  
  <tr align="center">
   <td colspan="3" >
       [파일]:<%if(file==null || file == ""){out.println("파일이 없습니다.");}else{out.println("<a href='filedownload.jsp?fileName="+file+"'>"+file+"</a>");} %>
   </td>
  </tr>
  
  <tr align="center">
   <td colspan="3" >
       <a href="index.jsp">[index]</a>
       <a href="Input.html">[신규등록]</a>
       <a href="bbsEdit.jsp?idx=<%=sabun%>">[수정]</a>
  	   <a href="bbsList.jsp">[전체출력]</a>
  	   <a href="bbsDeleteSave.jsp?idx=<%=sabun%>">[삭제]</a>
   </td>
  </tr>
 </table>
 	
<P> 	
<jsp:include page="bbsreply.jsp">
 	<jsp:param  name="idx" value="<%=sabun%>" />
 </jsp:include>
 
</body>
</html>




