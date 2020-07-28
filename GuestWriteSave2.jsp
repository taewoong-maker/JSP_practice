<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>

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
	  System.out.println("1");
	  Gname  = request.getParameter("name");
	  System.out.println("2");
	  Gtitle = request.getParameter("title");
	  System.out.println("3");
	  Gpay   = Integer.parseInt(request.getParameter("pay"));
	  System.out.println("4");
	  Gemail = request.getParameter("email");
	  System.out.println("5");
	  
	  //웹페이지에 출력
	  System.out.println("사번=" + Gsabun + "<br>");
	  System.out.println("이름=" + Gname + "<br>");
	  System.out.println("제목=" + Gtitle + "<br>");
	  System.out.println("급여=" + Gpay + "<br>");
	  System.out.println("메일=" + Gemail + "<br>");
	  
	  try{
	    //Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이브로드
	    //String url="jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
	    //CN=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","system","1234");
	    Date now = new Date();
	    System.out.println("[GuestWriteSave2.jsp_PST used] Oracle Connected at "+ now);
	    
	    msg="insert into guest values(?, ?, ?, sysdate, ?, 0, ?)"; // 물음표 갯수가 순서임
	    PST=CN.prepareStatement(msg);
	       PST.setInt(1, Gsabun);
	       PST.setString(2, Gname);
	       PST.setString(3, Gtitle);
	       PST.setInt(4, Gpay);
	       PST.setString(5, Gemail);
	        PST.executeUpdate();
	    System.out.println("데이터 저장 성공 했습니다.\n" + msg);
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