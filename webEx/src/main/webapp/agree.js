window.onload = function() {
	for (let i = 1; i <= 5; i++) {
		const checkImg = document.querySelector(`.chk_img${i}`);
		console.log("checkImg:", checkImg);
		checkImg.addEventListener('click', e => {
			if (i == 1) {
				for (let j = 2; j <= 5; j++) {
					const checkImg = document.querySelector(`.chk_img${j}`);
					if (checkImg.getAttribute("src").valueOf() === "img/check.png") {
						checkImg.src = "img/check2.png";
					}
					else {
						checkImg.src = "img/check.png";
					}
				}
			}
			if (checkImg.getAttribute("src").valueOf() === "img/check.png") {
				checkImg.src = "img/check2.png";
			}
			else {
				checkImg.src = "img/check.png";
			}
		});
	}
}

function checkVal(form) {
	let cnt = 0;
	for (let i = 0; i < form.naver.length; i++) {
		if (form.naver[i].checked === true) {
			cnt++;
		}
	}

	if ((form.naver[0].checked) || (form.naver[1].checked && form.naver[2].checked)) {
		form.submit(); //<-홀드하고 있었던 서밋동작을 여기서 호출
	}
	else {
		const p = document.querySelector('p');
		p.innerText = "네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요";
	}
}