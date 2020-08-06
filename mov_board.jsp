<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> mov_board.jsp </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  #rsave{
	    font-size: 26pt; font-weight: bold;
	    background:yellow;   height:130px;
	  }
	</style>

	<script type="text/javascript">
	
	</script>
</head>
<body>
<h1>영화리뷰게시판</h1>
<form name="board_form" method="post" action="mov_board">
<table>
<tr align="center">
	<td>번호</td>		<td>제목</td>		<td>글쓴이</td>	<td>조회</td>		<td>날짜</td>
</tr>
<%
	int a = Integer.parseInt(request.getParameter("idx"));
	if(a==1){	
		msg="select rownum rn, g.* from mov_review g";
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		while(RS.next()){
			Date Rdate = new Date();
			Rnum = Integer.parseInt(RS.getString("rn"));
			String Rtitle = RS.getString("mrv_title");
			int Rhit = Integer.parseInt(RS.getString("mrv_chnum"));
			Rwriter = RS.getString("mrv_id");
			Rdate = RS.getDate("mrv_writedate");
			msg="select count(*) cnt from (select r.mrp_code from mov_repl r inner join mov_review v on v.mrv_code = r.mrp_code)";
			ST1=CN.createStatement();
			RS1=ST1.executeQuery(msg);
			int Rtotal=0;
			while(RS1.next()){	
				Rtotal = Integer.parseInt(RS1.getString("cnt"));
			}
			%>
			<tr>
				<td><%= Rnum%></td> 
				<td><a href="review_detail.jsp"><%= Rtitle%></a><font style='font-size:12pt; color:red'> <%if(Rtotal>0){%> [ <%=Rtotal %> ] <%}%></font></td> 
				<td><%= Rwriter%></td>
				<td><%= Rhit%></td>
				<td><%= Rdate%></td>
			</tr>
			<%
		}
	}else{
		response.sendRedirect("mov_login.jsp");
	}
%>
</table>
</form>

</body>
</html>






