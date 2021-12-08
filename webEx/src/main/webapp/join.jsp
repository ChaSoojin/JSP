<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>NAVER</h1>
    <form action="http://localhost:8081/joinPro.jsp">
        <input type="checkbox" name="subject"><span>네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</span><br>
        <input type="checkbox" name="subject"><span>네이버 이용약관 동의(필수)</span><br>
        <input type="checkbox" name="subject"><span>개인정보 수집 및 이용 동의</span><br>
        <input type="checkbox" name="subject"><span>위치정보 이용약관 동의(선택)</span><br>
        <input type="checkbox" name="subject"><span>프로모션 정보 수신 동의(선택)</span><br><br>
        
        <!-- 1개 이상 선택이 되어야 -> 서밋 할 수 있도록 -->
        <!-- 유효성 검사 후에 -> submit될 수 있도록 돌려줄 수 있음-->
        
        <input type="button" value="submit" onclick="checkVal(form)">
        
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
            for(let i = 0; i < form.subject.length; i++){
                if(form.subject[i].checked === true){
                    cnt++;
                }
            }

            if(cnt > 0){
                form.submit(); //<-홀드하고 있었던 서밋동작을 여기서 호출
            }
            else{
                alert("최소 1과목 이상 신청해야 합니다!");
            }
        }
    </script>
</body>
</html>