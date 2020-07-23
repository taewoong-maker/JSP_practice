<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[index.jsp]</title>
<script type="text/javascript">
	setTimeout("location.href='GuestList.jsp'",1000);</script>
<style>
	*{
		font-size: 24pt;
		position: relative;
		align-items: center;
		text-align: center;
	}
</style>
</head>
<body>
 	<div align="center">
        <br>
        <video width="600" autoplay muted loop controls="controls">
            <source src="images/scuba.mp4" type="video/mp4">
        </video>
    </div>
	<img src="images/a1.png">
	
	<br>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>
