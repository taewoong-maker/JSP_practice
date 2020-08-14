<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestWriteSave2.jsp]</title>
<style type="text/css">
   *{font-size:16pt;}
   a{ font-size: 16pt; color:black; text-decoration:none;}
   a:hover{ font-size: 16pt; color:blue; text-decoration:underline;}
</style>
</head>
<body>
<!-- 자바코드기술한 페이지 -->

 <p>
  <%  //단독실행하면 에러
	  Gsabun = Integer.parseInt(request.getParameter("sabun"));
	  //중복체크
	  msg="select count(*) cnt from guest where sabun = " + Gsabun;
	  ST=CN.createStatement();
	  RS=ST.executeQuery(msg);
	  RS.next();
		  if (RS.getInt("cnt")>0) {
		     %>
		     <script type="text/javascript">
		     alert("이미 있는 사번 입니다. 다른 사번을 이용하세요.");
		     location.href="GuestWrite.jsp";
		     //history.back();
		     </script>
		     <%
		    } 
	  Gname  = request.getParameter("name");	  
	  Gtitle = request.getParameter("title");	  
	  Gpay   = Integer.parseInt(request.getParameter("pay"));	  
	  Gemail = request.getParameter("email");	  
	  
	  dto.setName(Gname);
	  dto.setTitle(Gtitle);
	  dto.setSabun(Gsabun);
	  dto.setPay(Gpay);
	  dto.setEmail(Gemail);
	  
	  try{
	    Date now = new Date();
	    System.out.println("[GuestWriteSave2.jsp_PST used] Oracle Connected at "+ now);	   
	    sql.dbInsert(dto);
	    out.println(msg);	    
	    } catch (Exception e){
	       System.out.println("[GuestWriteSave.jsp] 에러 사유 : " + e);
	       e.printStackTrace();}
	   response.sendRedirect("GuestList.jsp");
  %>

 <br>
 <a href="GuestWrite.jsp">[회원등록]</a>
 <a href="index.jsp">[메인화면]</a>
 <a href="GuestList.jsp">[전체출력]</a>   
</body>
</html>