<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	  function re_edit(num, writer, content, index,sabun){
		 $('#writer'+index).html(
			"<input type='text' id='writeredit' value="+writer+" size=10>"	 
		 )
		 $('#content'+index).html(
			"<input type='text' id='contentedit' value="+content+" size=10>"
		 )
		 $('#edit'+index).html("<input type='button' value='뒤로가기' id='back'>")
		 				 .append("<input type='button' value='수정완료' id='replyedit'>");
		 $('.replyedit'+index).attr("id","replyedit")	
		 $(function() {
				$('#replyedit').click(function() {
					alert('aa');
					var writer = $('#writeredit').val();
					var content = $('#contentedit').val();
					location.href='greplyUpdate.do?num='+num
							+"&writer="+writer+"&content="+content
							+"&sabun="+sabun;
				})
				$('#back').click(function() {
					location.reload();
				})
			})
	  }//end
	  
// 		$(function() {
// 			$('#rsave').click(function() {
// 				$('#reply_form').submit();
// // 				alert("wow");
// 			})
// 		})
	</script>
</head>
<body>   
 	<form name="reply_form" action="greplyInsert.do" id="reply_form">
	 	 <table width=900 border=1 cellspacing=0>
		 	 <tr>
		 	  	<td> <img src="images/z1.gif"> Sabun: <img src="images/z1.gif">  </td>
		 	  	<td> <input type="text" name="sabun"  size=30  value="${param.Ridx}"> </td>
		 	  	<td rowspan="3"  align="center">
		 	  		<input type="submit" id="rsave" name="bt_save" value="댓글저장">
		 	  	</td>
		 	  </tr>		 	  
		 	  <tr>
		 	  	<td> <img src="images/z1.gif"> 저자: <img src="images/z1.gif">  </td>
		 	  	<td> <input type="text" name="writer" id="writer" size=30 > </td>
		 	  </tr>
		 	  <tr>
		 	  	<td> <img src="images/z1.gif"> 내용: <img src="images/z1.gif">  </td>
		 	  	<td> <textarea rows="3" cols="27" name="content" id="content" ></textarea> </td>
		 	  </tr>
	 	 </table>
 	</form>
 <p>
 <table width=900 border=0 cellspacing=0>
  <tr bgcolor="pink" align="center">
  	<td colspan="5"> 댓글 데이터 출력 </td> 
  </tr>
 
	<c:forEach var="al" varStatus="alStatus" items="${al}">

  <tr align="center" onmouseover="style.backgroundColor='yellow'" onmouseout="style.backgroundColor='' ">
  	 <td width=70 id="num${alStatus.index}">${al.rn}</td>
  	 <td width=150 id="writer${alStatus.index}">${al.writer}</td>
  	 <td width=200 id="content${alStatus.index}">${al.content}</td>
  	 <td id="edit${alStatus.index}">
  		<a href="greplyDelete.do?idx1=${al.num}&idx2=${al.sabun}">[댓글삭제]</a>
  		<input type="button" value="댓글수정" onclick="re_edit('${al.num}',
  		'${al.writer } ', '${al.content }','${alStatus.index}','${al.sabun}');"class="replyedit${alStatus.index}">
  	 </td>
  </tr>
	</c:forEach>
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


