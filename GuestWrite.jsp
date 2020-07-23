<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestWrite.jsp]</title>
	<script type="text/javascript">
		var Gflag = false;
	      //document는 생략가능
	      //돔=dom모델객체 document, window, location, history

		function nullCheck(){
			var a = document.myform.sabun.value;
			var b = document.myform.name.value;
			var c = document.myform.title.value;
			var d = document.myform.pay.value;
			var e = document.myform.email.value;
			if(a==null || a==""){
				alert("사번데이터를 입력하세요");
				myform.sabun.focus();
				return;
			}else if(a.length!=4){
				alert("숫자 네자리로 입력하세요");
				myform.sabun.focus();
				myform.sabun.value="";
				return;
			}else{
				myform.name.focus;
			}
			if(b==null || b==""){
				alert("이름을 입력하세요");
				myform.name.focus();
				return;
			}else{
				myform.title.focus;
			}
			if(c==null || c==""){
				alert("제목을 입력하세요");
				myform.title.focus();
				return;
			}else{
				myform.pay.focus;
			}
			if(d==null || d==""){
				alert("급여를 입력하세요");
				myform.pay.focus();
				return;
			}else if(d.length!=2){
				alert("급여를 2자리로 입력하세요");
				myform.pay.focus();
				myform.pay.value="";
				return;
			}else{
				myform.email.focus;
			}
			document.myform.submit();
			
		}//end
		
		function info(){
			//window 생략가능 .open(1,2,3);
			window.open("popup.jsp","aa","width=500, height=500, left=700, top=300");
		}//end
		
		function idCheck(){
			a= document.myform.sabun.value;
			len_sabun=document.myform.sabun.length;
			if(a==null || a==""){
				alert("사번데이터를 입력하세요");
				myform.sabun.focus();
				return;
			}
			window.open("openID.jsp?idx="+document.myform.sabun.value,"title","width=500, height=200, left=700, top=300");
		}//end
		
	</script>
</head>
<body ><!-- onload="info()" -->
	<br>
	GuestWrite 문서입력화면 <!-- 단독실행가능 -->
	<form method="get" action="GuestWriteSave2.jsp" name="myform">
		사번 : <input type="text" name="sabun" maxlength="4" id="sabun" size="8">
		<input type="button" onclick="idCheck();" value="idCheck"><br>
		이름 : <input type="text" name="name" id=""><br>
		제목 : <input type="text" name="title" id=""><br>
		급여 : <input type="text" name="pay" ><br>
		메일 : <input type="email" name="email" id=""><br>		
			 <input type="button" onclick="nullCheck();" value="등록하기">
			 <!--submit의 단점은 value값이 없어도 넘어가버린다는 것 
			     button의 단점은 따로 기능을 정의하기 전까지 값이 넘어가지 않는다는 것 -->
			 <input type="reset" value="입력취소">
	</form>
	<br>
		<a href="GuestWrite.jsp"> [등록] </a>		
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>