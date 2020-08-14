<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>[GuestWrite.jsp]</title>
	<!-- 
	<style type="text/css">
		body{
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		    line-height: 1.5em;
		    margin: 0;
		    text-align: center;
		}
		a{
		    display: inline-block;
		    text-decoration: none;
		    color: rgb(143, 144, 146);	
		    font-size: 10pt;    
		    margin: 5px;    
		}
		a:hover{
		    color: rgb(0, 0, 0);
		}
		.content{        
		    height:300px;
		}
		form{
		    width: 300px;
		    padding: 10px;
		    position: relative;
		}
		.inner:nth-child(6){
		    height: 20px;
		}
		form input[type=text]{
		    margin: 5px;
		    border-radius: 5px;
		    border-width: 1px;
		}
		form input[type=button],
		form input[type=reset]{
		    background-color: white;
		    color: skyblue;
		    border-radius: 5px;
		    border: 1px solid;
		    height: 22px;
		    box-sizing: border-box;   
		}
		form input[type=button]:hover,
		form input[type=reset]:hover{
		    background-color: skyblue;
		    color: white;
		}
		form input[type=hidden]{
		    border: 1px solid;
		}
		.sabun{
		    width: 85px;
		}
		span{
		    font-size: 10pt;
		    color: red;
		}
	</style>
	 -->
	
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
			var a_reg = /^[0-9]{4,4}$/;
			var d_reg = /^[0-9]{2,2}$/;
			var e_reg = /^([0-9a-zA-Z]{1,2})@([0-9a-zA-Z]{1,2})$/;
			var f = document.myform.id_ch.value
			if(a==null || a==""){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:10pt; color:red'>*사번을 입력해주세요*</font>";
				myform.sabun.focus();
				return;
			}else if(a.length!=4){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:10pt; color:red'>*사번을 4자리로 입력해주세요*</font>";
				myform.sabun.focus();
				myform.sabun.value="";
				return;
			}else{
				myform.name.focus();
			}
			
			if(b==null || b==""){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:10pt; color:red'>*이름을 입력해주세요*</font>";
				myform.name.focus();
				return;
			}else{
				myform.title.focus;
			}
			
			if(c==null || c==""){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:10pt; color:red'>*급여를 입력해주세요*</font>";
				myform.title.focus();
				return;
			}else{
				myform.pay.focus;
			}
			
			if(d==null || d==""){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:12pt; color:red'>*급여를 입력해주세요*</font>";
				myform.pay.focus();
				return;
			}else if(d.length!=2){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:12pt; color:red'>*급여를 2자리로 입력해주세요*</font>";
				myform.pay.focus();
				myform.pay.value="";
				return;
			}else{
				if(d_reg.test(d)==false){
					document.getElementById("email_ch").innerHTML=
						"<font style='font-size:12pt; color:red'>*급여는 2자리 숫자로만 입력해주세요*</font>";
						return;
				}else{
					myform.email.focus();
				}
			}
			
			if(e==null || e==""){
				document.getElementById("email_ch").innerHTML=
				"<font style='font-size:12pt; color:red'>*이메일 주소를 입력해주세요*</font>";
				return;
			}else{
				if(e_reg.test(e)==false){
					document.getElementById("email_ch").innerHTML=
						"<font style='font-size:12pt; color:red'>*aa@aa형식으로만 입력해주세요*</font>";
						return;
				}
			}
			
			if(f!="bbb"){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:12pt; color:red'>*중복체크를 실행해주세요*</font>";
				return;
			}
			
			document.myform.submit();
		}//end
		
		function info(){
			//window 생략가능 .open(1,2,3);
			window.open("popup.jsp","aa",
					"width=500, height=500, left=700, top=300");
		}//end
		
		function idCheck(){
			a= myform.sabun.value;
			len_sabun=myform.sabun.length;
			var a_reg = /^[0-9]{4,4}$/;
			if(a==null || a==""){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:12pt; color:red'>*사번을 입력해주세요*</font>";
				myform.sabun.focus();
				return;
			}else if(a_reg.test(a)==false){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:12pt; color:red'>*사번은 4자리 숫자로만 입력해주세요*</font>";
					return;
			}
			open("openID.jsp?idx="+myform.sabun.value,
					"title","width=500, height=200, left=700, top=300");
		}//end
		
		function emailCheck(){
			m=myform.email.value;
			m_reg=/^([0-9a-zA-Z]{2,3})@([a-zA-Z]{2,3})$/;
			if(m=""||m==null){
				document.getElementById("email_ch").innerHTML=
					"<font style='font-size:12pt; color:red'>*이메일 주소를 입력해주세요*</font>";
					return;
			}else{
				if(m_reg.test(m)==false){
					document.getElementById("email_ch").innerHTML=
						"<font style='font-size:12pt; color:red'>*aa@aa형식으로만 입력해주세요*</font>";
				}
			}
		}
	</script>
</head>
<body ><!-- onload="info()" -->
<jsp:include page="Guest_header.jsp"/>

	<br>
	<!-- 단독실행가능 -->
	<form method="get" action="GuestWriteSave2.jsp" name="myform">
		GuestWrite 문서입력화면 
           <div class="inner" id="innerform">
               	 사번 : <input type="text" name="sabun" class="sabun" maxlength="4" id="sabun">
                <input type="button" onclick="idCheck()" value="idCheck"><br>
            </div>
            <div class="inner" id="innerform">
                	이름 : <input type="text" name="name" id=""><br>
            </div>
            <div class="inner" id="innerform">
               	 제목 : <input type="text" name="title" id=""><br>
            </div>
            <div class="inner" id="innerform">
               	 급여 : <input type="text" name="pay" ><br>
            </div>
            <div class="inner" id="innerform">
               	 메일 : <input type="text" name="email" ><br>	
            </div>   
            <div class="inner" id="innerform">
                <span id="email_ch"></span>	<br>
            </div>     
            <div class="inner" id="innerform">
                <input type="submit" value="등록하기">
                <input type="reset" value="입력취소" >
            </div>         
                <input type="hidden" name="id_ch" value="aaa">
                <!--submit의 단점은 value값이 없어도 넘어가버린다는 것 
                    button의 단점은 따로 기능을 정의하기 전까지 값이 넘어가지 않는다는 것 -->
               
            <a href="GuestWrite.jsp"> 등록 </a>		
            <a href="login.jsp"> [login] </a>
            <a href="index.jsp"> index </a>
            <a href="GuestList.jsp"> 전체출력 </a>
        </form>
<jsp:include page="Guest_footer.jsp"/>          

</body>
</html>