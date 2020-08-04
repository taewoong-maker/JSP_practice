<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [guestEdit.jsp]</title> 
<link rel="stylesheet" type="text/css" href="../css/InputCSS.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/InputJS.js"></script>
<body>
<%
 int data=Integer.parseInt(request.getParameter("idx"));
 msg="select * from bbs where b_sabun="+ data ;
 ST=CN.createStatement( );
 RS=ST.executeQuery(msg);
 if(RS.next()==true){
	sabun=RS.getInt("b_sabun");
	name=RS.getString("b_name");
	pwd=RS.getString("b_pwd");
	addr1=RS.getString("b_juso1");
	addr2=RS.getString("b_juso2");
	email=RS.getString("b_email");
	phone=RS.getString("b_phone");
	url=RS.getString("b_url");
	title=RS.getString("b_title");
	content=RS.getString("b_content");
 }
 
 String[] ph = phone.split("-");
%>
	<div class="all" align="center">
		<div class="title"><br>수정화면</div>
		<div class="cf"><br> <font color=red>* 표는 필수 입력 </font></div>
		<form name="iform" method="get" enctype="multipart/form-data" action="./bbsEditSave.jsp">
			<table class="table1">
				<tr>
					<th >* 사번</th>
					<td colspan= "2">
						<input type="text" size="10" name="sabun"  onkeyup="checklen(this,4); flagS_t()" placeholder="숫자4자리" value="<%=sabun%>" readonly> 
						<label id="sabunlabel"></label>
					</td>
					<td rowspan="11">
						<div id="preview"></div>
					</td>
				</tr>
				<tr>
					<th>* 이름</th>
					<td colspan= "2"><input type="text" name="name" onkeyup="checklen(this,15)" value="<%=name%>" ></td>
				</tr>
				<tr>
					<th>* 비밀번호</th>
					<td colspan= "2"><input type="password" name="pwd" onkeyup="checklen(this,10)" value="<%=pwd%>" ></td>
				</tr>
				<tr>
					<th>* 비밀번호 확인</th>
					<td colspan= "2">
						<input type="password" name="pwd2" onkeyup="checkPwd();" value="<%=pwd%>" >
						<label id="pwdlabel">&nbsp;&nbsp;비밀번호를 한번 더 입력해주세요.</label>
					</td>
				</tr>
				
				<tr>
				 <th>* 파일선택</th>
				 <td colspan= "2"><input type="file" id="file" name="file" onchange="handleFileSelect()"></td>
			    </tr>
				
				<tr>
					<th>* 주소</th>
					<td colspan= "2">
						<input type="text" size="10" id="code" name="code" readonly> <input type="button" onclick="DaumPostcode()" value="우편번호"><p>
						<input type="text" size="40" id="juso1" name="juso1" readonly value="<%=addr1%>"><p>
						<input type="text" size="40" id="juso2" name="juso2" onkeyup="checklen(this,30)" value="<%=addr2%>" readonly>&nbsp;&nbsp;상세주소를 입력하세요 <br>
					</td>
				</tr>
				<tr>
					<th>* 전화번호</th>
					<td colspan= "2">
						<input type="text" size="4" name="num1" onchange="num()" maxlength="4" value="<%=ph[0]%>" >-
						<input type="text" size="4" name="num2" onchange="num()" maxlength="4" value="<%=ph[1]%>" >-
						<input type="text" size="4" name="num3" onchange="num()" maxlength="4" value="<%=ph[2]%>" >&nbsp;
						<label id="numlabel">&nbsp;&nbsp;숫자3~4자리 입력하세요</label>
					</td>
				</tr>
				<tr>
					<th>* email</th>
					<td colspan= "2">
						<input type="text" size="40" name="email" onblur="emailcheck()" onkeyup="checklen(this,30)" placeholder="aaa@aaa.aa형식으로 입력" value="<%=email%>" >
						<span id="email_ch"></span>
					</td>
				</tr>
				<tr>
					<th>URL</th>
					<td colspan= "2">
						<input type="text" size="40" name="url" onkeyup="checklen(this,20)" value="<%=url%>" >
					</td>
				</tr>
				<tr>
					<th>* 제목</th>
					<td colspan= "2" >
						<input type="text" size="40" name="title" onkeyup="checklen(this,30)" maxlength="30" value="<%=title%>">
					</td>
				</tr>
				<tr>
					<th>* 내용</th>
					<td colspan= "2">
						<textarea name="content" id="content" onkeyup="checklen(this,30)" rows="5" cols="40"><%=content%></textarea>
					</td>
				</tr>
			</table>
			<p>
			<input type="submit" value="수정">&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='bbsDetail.jsp?idx=<%=sabun%>'">
		</form>
	</div>

</body>
</html>













