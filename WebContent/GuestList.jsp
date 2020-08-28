<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestList.jsp]</title>

<script type="text/javascript">
	function pagegood(){
	    page.keyword.value="";
	    page.keyfield.focus();
	 }
	$(function() {
		var aval = ${pageNUM};
		console.log(aval);		
		$('a[value="'+aval+'"]').css("color","red");
	
		$('select option[value="${skey}"]').attr("selected",true);
		$('#keyword').val("${sval}");

		$('select').change(function() {
			$('#keyword').val(" ");
		})
	});
</script>
</head>
<body>
	<p>	 전체 레코드 갯수 [${Gtotal}]			 
	<div class=id>
		<table width=900 cellspacing="0">		
			<tr bgcolor="yellow" >
				 <td>행번호</td>
				 <td>사번</td>
				 <td>이름</td>
				 <td>제목</td>
				 <td>이메일</td>
				 <td>급여</td>
				 <td>조회수</td>
				 <td>삭제</td>
			</tr>			
			<c:forEach var="dto" items="${LG}">
			<tr>
				 <td>${dto.rn}</td>
				 <td>${dto.sabun}</td>
				 <td>${dto.name}</td>
				 <td>
					 <a href="gdetail.do?idx=${dto.sabun}">
					 ${dto.title}
					  <span style='color : crimson'>[${dto.rcnt}]</span>
				 </a>
				 </td>
				 <td>${dto.email}</td>
				 <td>${dto.pay}</td>
				 <td>${dto.hit}</td>
				 <td><input type="button" value = "삭제"
				  onclick="location.href='gdelete.do?idx=${dto.sabun}'"></td>
			</tr>
			</c:forEach>			
			<tr onmouseover="style.backgroundColor='lightgray'"
				onmouseout="style.backgroundColor='' ">	
				<td colspan="8" align="center">						
					<c:if test="${startpage>10 }"><a href="glist.do?pageNum=${startpage-10}${returnpage}">[이전]</a></c:if>							
						<c:forEach var="i" begin="${startpage}" end="${endpage}">
							<a href="glist.do?pageNum=${i}${returnpage}" value='${i}'>[${i}]</a>
						</c:forEach>
					<c:if test="${endpage<pagecount }"><a href="glist.do?pageNum=${endpage+1}${returnpage}">[다음]</a></c:if>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center">					
					<form action="glist.do" name ="page">
						검색 : 
						<select name='keyfield' >
							<option value="">검색키워드</option>
							<option value="sabun">사번검색</option>
							<option value="name">이름검색</option>
							<option value="title">제목검색</option>
						</select>
						<input type="text" name="keyword" size="10" placeholder="검색어입력" id="keyword" >
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>
		</table>
	</div>
	<br>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="index.jsp"> [index] </a>
		<a href="login.jsp"> [login] </a>
		<a href="glist.do"> [전체출력] </a>
</body>
</html>