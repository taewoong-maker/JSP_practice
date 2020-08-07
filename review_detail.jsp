<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply.jsp] </title>
</head>
<link rel="stylesheet" href="css/review_detail.css">
<body>
	<form name="detail_form" method="post" action="mov_board">
	    <div class="content">
	        <h2>영화리뷰</h2>
	
			<table>
				<%
				code = request.getParameter("idx");
				msg="update mov_review" +
					" set mrv_chnum=mrv_chnum+1"+
					" where mrv_code = "+code;
				ST = CN.createStatement();
				ST.executeUpdate(msg);
				
				msg="select * from mov_review where mrv_code = "+code;
				
				ST = CN.createStatement();
				RS = ST.executeQuery(msg);
				while(RS.next()){
					file =RS.getString("mrv_img");
					%>
						<tr>
							<td>제목</td>
							<td><%=RS.getString("mrv_title") %></td>
						</tr>
						 <tr>
			                <td>등록일 </td>
			                <td><%=RS.getString("MRV_WRITEDATE") %></td>
			            </tr>
			            <tr>
			                <td>조회수</td>
			                <td><%=RS.getString("MRV_CHNUM") %></td>
			            </tr>
						<tr>
							<td>이미지</td>
							<td><%if(file==null){ %> 파일없음 <% }
								else{ %> <img src="../storage/<%=file%>">
								 <% } %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><%=RS.getString("mrv_content") %></td>
						</tr>		
					<%	}	%>
			
			</table>
			<div class=buttons>
				<input type="button" value="리뷰등록"
				 	onclick="location.href='mov_review.jsp'">
				 <input type="button" value="리뷰게시판"
					 onclick="location.href='mov_board.jsp'">
			</div>
		</div>
	</form>
</body>
</html>






