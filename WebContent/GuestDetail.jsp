<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestDetail.jsp]</title>
<style>
	tr:nth-child(1) {
	text-align:center;	
	}
	tr:nth-child(2) td:nth-child(1) {
	text-align:center;	
	}
	.sabun{
	background-color: lightgray;
	}
	td{
	padding:7px;
	}
</style>
<script type="text/javascript"></script>
</head>
<body>
	<p>
	<table width=700px cellspacing="0">
		
		<tr>
			<td colspan="2" class="sabun">
				사번 : ${dto.sabun}
			</td>			
		</tr>
		<tr>
			<td rowspan="5"><img alt="" src="images\bear.jpg"></td>
			<td>이름 : ${dto.name}</td>			
		</tr>
		<tr>
			<td>제목 : ${dto.title}</td>
		</tr>
		<tr>
			<td>급여 :  ${dto.pay}</td>
		</tr>
		<tr>
			<td>조회수 : ${dto.hit}</td>
		</tr>
		<tr>
			<td>이메일 : ${dto.email}</td>
		</tr>
		<tr align="center">
	    	<td colspan="2">
		        <a href="gupdatepre.do?idx=${dto.sabun}&idx2=1">[수정]</a>
		    	<a href="GuestWrite.jsp">[등록]</a>
		    	<a href="gdelete.do?idx=${dto.sabun}">[삭제]</a>
		 		<a href="index.jsp">[index]</a>
		 		<a href="glist.do">[전체출력]</a>
	    	</td>
   		</tr>
	</table>
	
	 <!-- 댓글문서포함 Guest_reply.jsp -->
		<jsp:include page="GuestReply.jsp">
      		 <jsp:param  name="Ridx" value="${dto.sabun}" />
    	</jsp:include>

		
		
		
</body>
</html>