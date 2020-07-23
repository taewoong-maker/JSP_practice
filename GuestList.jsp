<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestList.jsp]</title>
<style>
	
</style>
<script type="text/javascript"></script>
</head>
<body>

	<%	
		msg="select count(*) cnt from guest a";
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		Gtotal=RS.getInt("cnt");
	%>
	<p>
		 전체 레코드 갯수 [<%=Gtotal%>]
	<%	
		msg="select rownum rn, a.* from guest a";
		RS=ST.executeQuery(msg);
	%>
	<div class=id>
		<table width=900 cellspacing="0">
			<tr bgcolor="yellow" >
				 <td>행번호</td>
				 <td>사번</td>
				 <td>이름</td>
				 <td>제목</td>
				 <td>이메일</td>
				 <td>날짜</td>
				 <td>조회수</td>
				 <td>삭제</td>
			</tr>
			<%
			while(RS.next()==true){
			%>
			<tr>
				 <td>				 
				 	 <%=RS.getInt("rn") %>
				 </td>
				 <td>					 
					 <%=RS.getInt("sabun") %>				
				 </td>
				 <td><%=RS.getString("name") %></td>
				 <td>
					 <a href="GuestDetail.jsp?idx=<%=RS.getInt("sabun")%>">
					 <%=RS.getString("title") %>
				 </a>
				 </td>
				 <td><%=RS.getString("email") %></td>
				 <td><%=RS.getDate("wdate") %></td>
				 <td><%=RS.getInt("hit") %></td>
				 <td><input type="button" value = "삭제"
				  onclick="location.href='GuestDetail.jsp?idx=<%=RS.getInt("sabun")%>'"></td>
			</tr>
			<%	} %>			

		</table>
	</div>
	
	<br>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>