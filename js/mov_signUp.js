//====전역변수:각각 체크여부
var flag = false;//null체크여부
var flagP = false;//비번확인체크여부
var flagN = false;//번호 체크여부
var flagB = false;//생일 체크여부

function check(){
    var name = signform.name.value;
    var iden = signform.identity.value;
    var pass = signform.pass.value;
    var chpass = signform.chpass.value;
    var juso1 = signform.juso1.value;
    var juso2 = signform.juso2.value;
    var code = signform.code.value;
    var birth = signform.birth.value;
    var tel = signform.tel.value;
    
    if (name==null||name==""){
        alert('이름을 입력하세요');
        signform.name.focus();
        return;
    }
    if (iden==null||iden==""){
        alert('id를 입력하세요');
        signform.iden.focus();
        return;
    }
    if (pass==null||pass==""){
        alert('비밀번호를 입력하세요.');
        signform.pass.focus();
        return;
    }
    if (chpass==null||chpass==""){
        alert('비밀번호를 재입력하세요.');
        signform.chpass.focus();
        return;
    }
    if (code==null||code==""||juso1==null||juso1==""||juso2==null||juso2==""){
        alert('주소를 입력하세요.');
        signform.code.focus();
        return;
    }
    if (birth==null||birth==""){
        alert('생일을 입력하세요.');
        signform.birth.focus();
        return;
    }
    if (tel==null||tel==""){
        alert('전화번호를 입력하세요.');
        signform.tel.focus();
        return;
    }    
    flag=true;
    
    //위에 다 통과&체크 완료 후 submit
    if(flag==true&&flagP==true&&flagT==true&&flagB==true){
    	alert("등록하시겠습니까?");
    	signform.submit();
    } else { 
    	alert(flagN);
    	return; }
}
function idcheck(){
    var iden = signform.identity.value;
    var iden_reg= /^[a-zA-Z0-9]{6,16}$/;  
    if(iden==null||iden==""){
        spid.innerHTML="id를 입력해주세요";
        signform.identity.focus();
        return;
    }else if(iden_reg.test(iden)==false){
        spid.innerHTML="6자리 이상, 15자리 이하의 영어,숫자로만 입력해주세요";
        signform.identity.focus();
        return;
    }
    spid.innerHTML="";
}

function pwcheck(){
    var pass = signform.pass.value;
    var chpass = signform.chpass.value;
    if(pass!=chpass){
        sppw.innerHTML="비밀번호가 다릅니다";
        return;
    }
    sppw.innerHTML="";
    flagP=true;
}

//====각각 데이터 입력 자리수제한(db오류 안나게 바이트로 처리)
function checklen(obj, maxByte)	{	//db데이터 사이즈에 맞는 길이 체크
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar ="";
    var str2 ="";
    
    for (var i = 0; i < strLen; i++) {	//한글자씩 가져와서
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4)	{	//길이가 4초과=유니코드/한글이면
            totalByte += 2;	//2바이트로 넣어주고
        } else {
            totalByte++;	//아니면 1바이트로 처리
        }
        if(totalByte <= maxByte) {
            len = i+1;	//입력된 데이터의 자리수 기억해주기
        }
    }
    if (totalByte > maxByte) {
        alert(maxByte+'Byte를 초과 입력 불가');
        str2 = strValue.substr(0, len);	//아까 기억한 자리수까지만큼 잘라서 넣어주기
        obj.value = str2;
    }
}//end

function bircheck(){
    var birth = signform.birth.value;
    var birth_reg= /^[0-9]{6}$/;  
    if(birth_reg.test(birth)!=true){
        spbir.innerHTML="980512 형식으로 입력해주세요";
        return;
    }
    spbir.innerHTML="";
    flagB = true;
}

function telcheck(){
    var tel = signform.tel.value;
    var tel_reg= /^[0-9]{8,12}$/;  
    if(tel_reg.test(tel)!=true){
        sptel.innerHTML="'-'를 제외한 숫자만 올바르게 입력해주세요";
        return;
    }
    sptel.innerHTML="";
    flagT = true;
}

function DaumPostcode() {
    new daum.Postcode({
  oncomplete: function(data) {
    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    var fullAddr = ''; // 최종 주소 변수
    var extraAddr = ''; // 조합형 주소 변수

    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        fullAddr = data.roadAddress;

    } else { // 사용자가 지번 주소를 선택했을 경우(J)
        fullAddr = data.jibunAddress;
    }

    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
    if(data.userSelectedType === 'R'){
        //법정동명이 있을 경우 추가한다.
        if(data.bname !== ''){
            extraAddr += data.bname;
        }
        // 건물명이 있을 경우 추가한다.
        if(data.buildingName !== ''){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
    }

    // 우편번호와 주소 정보를 해당 필드에 넣는다.
    document.getElementById('code').value = data.zonecode; //5자리 새우편번호 사용
    document.getElementById('juso1').value = fullAddr;

    // 커서를 상세주소 필드로 이동한다.
    document.getElementById('juso2').focus();
  }
    }).open();
}//end