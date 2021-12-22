function checkVal(form) {
	let checkflag = 0;

	for (let i = 1; i <= 8; i++) {
		const p = document.querySelector(`#p${i}`);

		if (i == 1) {
			if (!chkNullData(form.id.value)) {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			if(!checkId(form.id.value)){
				p.innerText = "5~20자의 영문 소문자, 숫자만 사용 가능합니다.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}

		if (i == 2) {
			if (!chkNullData(form.pw.value)) {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			if(!checkPw(form.pw.value)){
				p.innerText = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}

		if (i == 3) {
			if (!chkNullData(form.pw2.value)) {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}

		if (i == 4) {
			if (!chkNullData(form.name.value)) {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}

		if (i == 5) {
			const mon = document.getElementById('mon');
			
			if (!chkNullData(form.year.value) || !checkNumber(form.year.value) || form.year.value.length !== 4) {
				p.innerText = "태어난 년도 4자리를 정확하게 입력하세요.";
				checkflag = 0;
			}
			else if (mon.value.valueOf() === "o1") {
				p.innerText = "태어난 월을 선택하세요.";
				checkflag = 0;
			}
			else if (!chkNullData(form.day.value) || !checkNumber(form.day.value)) {
				p.innerText = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}

		if (i == 6) {
			const select = document.getElementById('gen');

			if (select.value.valueOf() === "s1") {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}

		if (i == 7) {
			if (!chkNullData(form.phone.value)) {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			if(!checkNumber(form.phone.value) || form.phone.value.length !== 11){
				p.innerText = "11자리 숫자로 입력해주세요.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}
		
		if(i == 8){
			if (!chkNullData(form.email.value)) {
				p.innerText = "필수 정보입니다.";
				checkflag = 0;
			}
			else if(!checkEmail(form.email.value)){
				p.innerText = "올바른 이메일 형식을 입력하세요.";
				checkflag = 0;
			}
			else {
				p.innerText = "";
				checkflag++;
			}
		}
	}

	if (checkflag === 8) {
		form.submit();
	}
}

function chkNullData(value) {
	if (value == "") {
		return false;
	}
	return true;
}

function checkId(id) {
    var idReg = /^[a-zA-z0-9]{5,20}$/;
    if (!idReg.test(id)) {
        return false;
    }
    return true;
}

function checkPw(pw) {
    var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    if (!pwReg.test(pw)) {
        return false;
    }
    return true;
}

function checkNumber(value){
	var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

  	if (!reg.test(value)) {
    	return false;
  	}
	return true;
}

function checkEmail(email){
	var emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!emailreg.test(email)) {
        return false;
    }
    return true;
}