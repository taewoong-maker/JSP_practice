<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" type="text/css" href="../css/style.css">

<script>
	var xhr = null;
	var ID = "";
	var PW = "";
	
	function first(){
		xhr = new XMLHttpRequest();		
		ID = myform.userid.value;
		PW = myform.pwd.value;
		if(ID=="" || PW=="" || ID==null || PW==null){
			alert("userID, PWD가 공백입니다");
		}else{
			var url = "loginList.jsp?loginID=" + ID + "&loginPWD=" + PW;
// 			alert(url);
			xhr.onreadystatechange = two;
			xhr.open('GET', url, true);
			xhr.send(null);
		}
	} //first end
	
	function two(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var str = xhr.responseText;
// 				alert(str);
				document.getElementById("result").innerHTML=str;				
// 				alert("성공");
			}//200 end
		}//4 end
	}// two end
	
	function myload() {
		location.reload();
		form.userid.focus();
	}
</script>
<div>
  <img src='../images/carousel6.png' width='100%' height='200px'  id='topIMG'>
  
  <nav id="topMenu">
    <ul>
      <li><a class='menuLink' href=''>index</a></li>
      <li><a class='menuLink' href='bbsList.jsp'>목록으로</a></li>
      <li><a class='menuLink' href='Input.html'>글쓰기</a></li>
      <li><a class='menuLink' href='bbsImgList.jsp'>앨범으로</a></li>
      
      <li>
      	<span class='menulogin'>
      		<div id='result'>
      			<form name="myform">
      				userID : <input type="text" name="userid" size=6 value="sky">
      				PWD : <input type="password" name="pwd" size=6 value="1234">
      						<input type="button" onclick="first()" value="로그인">
      			</form>
      		</div>
      	</span>
      </li>
    </ul>
  </nav>
  
</div>


