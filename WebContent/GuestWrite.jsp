<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>[GuestWrite.jsp]</title>

</head>
<body >
<jsp:include page="Guest_header.jsp"/>

	<br>
	<!-- 단독실행가능 -->
	<form method="get" action="ginsert.do" name="myform">
		GuestWrite 문서입력화면  8/25 12:12
           <div class="inner" id="innerform">
               	 사번 : <input type="text" name="sabun" class="sabun" maxlength="4" id="sabun">
                <input type="button" value="idCheck"><br>
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
                <input type="submit" value="MVC2 등록하기">
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