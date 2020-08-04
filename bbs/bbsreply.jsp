<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsreply.jsp]</title>
  <style type="text/css">
    *{font-size:20pt; font-weight:bold;  font-family:  comic Sans MS ;  }
    a{font-size:20pt; font-weight:bold;  text-decoration:none; }
    a:hover{font-size:24pt; font-weight:bold; background-color:#C0DEF9; color:#21517B; text-decoration:underline; }
    a.bt{color:#3D88CA;}
    a.bt:hover{font-size:16pt; color:#21517B;}
    #rsave{
      font-size:26pt; font-weight:bold; 
      background: #00FF00; height:150px;
    }                
  </style>
  <script type="text/javascript">
  	  var br_num;
	  function br_edit(writer,content, num){
	      //alert(num);
	      br_num=num;
		  re_form.bt_save.value = "댓글수정";
		  re_form.writer.value=writer;
		  re_form.content.value=content;
	   }
	  
	  function sub(sabun){
		  var bt = re_form.bt_save.value;
		  var writer = re_form.writer.value;
		  var content = re_form.content.value;
		   if(bt=="댓글저장"){
			  document.re_form.action="bbsreply_insert.jsp?writer="+writer+"&content="+content+"&sabun="+sabun;
			  document.re_form.method="post";
			  document.re_form.submit();
			  return false;
		  }else if(bt=="댓글수정"){
			  re_form.bt_save.value = "댓글저장";
			  document.re_form.action="bbsreply_edit.jsp?writer="+writer+"&content="+content+"&sabun="+sabun+"&num="+br_num;
			  document.re_form.method="post";
			  document.re_form.submit();
			  return false;
		  } 
	  }
   </script>
 </head>
<body>
<%! int brnum; %>
<%
  Rdata=request.getParameter("idx"); 
%>

 <table width=900 border=1 rules="rows" cellspacing=0 style="margin-left: auto; margin-right: auto;">
   <tr bgcolor="#21517B" style="color:white" align="center">
     <td colspan="4" style="font-size:16pt">댓글 데이터 출력 </td>
   </tr>  
   <%
    brnum=0;
    StringBuffer sb=new StringBuffer();
     	sb.append(" select rownum rn, b.b_sabun,r.br_num,r.br_writer,r.br_content,r.br_date from bbs b  ") ;
     	sb.append(" inner join bbsreply r") ;
     	sb.append(" on  b.b_sabun=r.br_sabun ") ;
     	sb.append("and r.br_sabun="+Rdata + "order by br_date") ;
    ST=CN.createStatement();
    RS=ST.executeQuery(sb.toString());

    while(RS.next()==true){
    	brnum++;
    	Rrn = RS.getInt("rn");
    	Rnum=RS.getInt("br_num");
    	String Rwriter=RS.getString("br_writer");
    	String Rcontent=RS.getString("br_content");
    	int Rsabun=RS.getInt("b_sabun"); 
   %>
   
   <tr bgcolor="#C0DEF9" >
    <td> [<%= brnum %>]</td>
    <td> <%= Rwriter %></td>
    <td> <%= Rcontent  %></td>
    <td align="right">
      <div style="font-size:16pt"><%= RS.getDate("br_date")  %></div>
      <a class='bt' href="bbsreply_delete.jsp?idx=<%=Rdata%>&num=<%=Rnum%>">[댓글삭제]</a>
      <a class='bt' href="#" onclick="br_edit('<%=Rwriter %>','<%=Rcontent %>', '<%=Rnum%>')" >[댓글수정]</a>
    </td>
   </tr>
   
   <%}%>
 </table>
	<p>
	<form name="re_form" action="">
	 <table  width=900 border=1 cellspacing=0 style="margin-left: auto; margin-right: auto;">
	   <tr>
		 <td bgcolor="#21517B" style="color:white"><input type="hidden" name="sabun" value="<%=Rdata%>">저자 </td>
		 <td> <input type="text" name="writer" size=32></td>
				
		  <td rowspan=2 align="center">
		  <input type='button' onclick="sub('<%=Rdata %>');" name="bt_save" value="댓글저장" id="rsave" style="background-color:#21517B; color:white">
		   </td>
		</tr>
			
		<tr>
			<td bgcolor="#21517B" style="color:white">내용 </td>
			<td>
			  <textarea cols=34 rows=2 name="content"></textarea>       
			</td>
		</tr>
	 </table>
	</form>
 	
</body>
</html>












