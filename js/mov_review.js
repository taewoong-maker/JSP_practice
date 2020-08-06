

function rev_sav() {
	var id = revform.id.value;
	var pass = revform.pass.value;
	var title = revform.title.value;
	var contetn = revform.content.value;
	if(id==null||id==""){
		alert("아이디를 입력해주세요");
		return;
	}else if(pass==null||pass==""){
		alert("비밀번호를 입력해주세요");
		return;
	}else if(title==null||title==""){
		alert("제목을 입력해주세요");
		return;
	}else if(title==null||title==""){
		alert("제목을 입력해주세요");
		return;
	}
	revform.submit();
}