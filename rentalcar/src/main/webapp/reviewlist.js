function move(no, log) {
	console.log(log, no);
	
	if (log.valueOf() !== "null") {
		location.href = `reviewView.jsp?no=${no}`;
	}
	else {
		alert("로그인 후 이용 가능합니다.");
		location.href = 'login.jsp';
	}
}