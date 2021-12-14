function move(no, log) {
	console.log(log, no);
	
	if (log.valueOf() !== "null") {
		location.href = `boardView.jsp?no=${no}`;
	}
	else {
		alert("로그인 후 이용해주세요!");
		history.back();
	}
}