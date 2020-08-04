<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [openSb.jsp]</title>
  <style type="text/css">
    *{font-size:12pt; font-weight:bold;}      
           
  </style>
 <script type="text/javascript">
 	function send(){
 		subform.userid.value=window.opener.iform.sabun.value;
 	}
 </script>
</head>
<body bgcolor="pink" onload="send()">
 <p>
 <div align="center">
  <form name="subform" action="openSbSave.jsp">
    <font>아이디:</font><input type="text" name="userid">
        <input type="submit" value="중복확인"> 
  </form>
  <img src="../images/bar.gif" width=400>
 </div>	
</body>
</html>





