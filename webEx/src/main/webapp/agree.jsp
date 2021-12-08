<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    	body{
    		text-align : center;
    	}
    	
    	h1{
    		color : green;
    		font-size : 100px;
    	}
    	
    	span{
    		font-size : 30px;
    	}
    	
    	p{
    		color : red;
    		font-size : 20px;
    	}
    	
    	#confirmBox{
    		width:250px;
    		height:50px;
    		background-color : green;
    		cursor:pointer;
    	}
    	
    	#cancelBox{
    		width:250px;
    		height:50px;
    		background-color : gray;
    		cursor:pointer;
    	}
    </style>
    <title>NAVER Validate</title>
</head>
<body>
    <h1>NAVER</h1>
    <form action="http://localhost:8081/join.jsp">
        <input type="checkbox" name="naver"><span>네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),<br> 프로모션 정보 수신(선택)에 모두 동의합니다.</span><br>
        <input type="checkbox" name="naver"><span>네이버 이용약관 동의(필수)</span><br>
        <input type="checkbox" name="naver"><span>개인정보 수집 및 이용 동의</span><br>
        <input type="checkbox" name="naver"><span>위치정보 이용약관 동의(선택)</span><br>
        <input type="checkbox" name="naver"><span>프로모션 정보 수신 동의(선택)</span><br><br>
       
        <p></p>
        <input type="button" value="취소" id="cancelBox" onclick="location.href='http://naver.com'">
        <input type="button" value="확인" id="confirmBox" onclick="checkVal(form)">
        
        <!-- <input type="submit">
        <button type="submit">submit</button>  -->
    </form>

    <script>
        // document.querySelector('form').addEventListener('submit', e=>{
        //     e.preventDefault(); //submit 기본동작을 무시(submit페이지로 넘어가지 않게)
        //     checkVal();
        // });

        function checkVal(form){
            // alert(form); //[object HTMLFormElement] 객체자체
            // alert(form.subject); //[object RadioNodeList]
            // alert(form.subject[0].checked); //true

            // for(let i = 0; i < form.subject.length; i++){
            //     console.log(form.subject[i]);
            // }

            let cnt = 0;
            for(let i = 0; i < form.naver.length; i++){
                if(form.naver[i].checked === true){
                    cnt++;
                }
            }

            if(cnt > 0){
                form.submit(); //<-홀드하고 있었던 서밋동작을 여기서 호출
            }
            else{
                const p = document.querySelector('p');
                p.innerText = "네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요";
            }
        }
    </script>
</body>
</html>