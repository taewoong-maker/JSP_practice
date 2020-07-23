<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [openIDSave.jsp] </title>
  <style type="text/css">
	*{ font-size: 26pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	</script>
</head>
<body>
  <p>
   <%  //openIDSave.jsp 단독실행하면에러발생 
   try{
  	 	Gdata = request.getParameter("idx");
  		Gsabun = Integer.parseInt(request.getParameter("userid"));
  		//중복체크
 		msg="select count(*) cnt from guest where sabun = " + Gsabun;
  		//System.out.println("넘어온 값 : " + Gsabun);
 		ST=CN.createStatement();
  		RS=ST.executeQuery(msg);
  		RS.next();
  		 if (RS.getInt("cnt")>0) {
  			 %>
		     <script type="text/javascript">
			     alert("이미 있는 사번 입니다. 다른 사번을 이용하세요.");
			     location.href="openID.jsp?idx="+"";
			     
			     //history.back();
		     </script>
		     <%
		}else{
			%>
			<script type="text/javascript">
			     alert("사용가능한 sabun 입니다.");
			     opener.myform.sabun.value=<%=Gsabun%>
			     self.close();
		     </script>
	     <%
		}
   }catch(Exception ex){ System.out.println("에러 "+ex); }
   
	%> 

</body>
</html>
