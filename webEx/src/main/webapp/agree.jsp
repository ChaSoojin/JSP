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
    		font-size : 100px;
    		cursor:pointer;
    	}
    	
    	a{
    		text-decoration:none;
    		color : green;
    	}
    	
    	span{
    		font-size : 30px;
            margin-left:10px;
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

        .check #c1,
        .check #c2,
        .check #c3,
        .check #c4,
        .check #c5 {
	        display:none;
        }

        .chk_img1,
        .chk_img2,
        .chk_img3,
        .chk_img4,
        .chk_img5 {
            cursor:pointer;
            vertical-align:top;
        }

        .con{
            width:650px;
            border:2px solid;
            display: block;
            margin-left: auto;
            margin-right:auto;
            
        }
    </style>
    <title>NAVER Validate</title>
</head>
<body>
    <h1><a href="http://naver.com">NAVER</a></h1>
    <form action="http://localhost:8081/webEx/join.jsp">
        <div class="check">
            <input type="checkbox" id="c1" name="naver">
            <input type="checkbox" id="c2" name="naver">
            <input type="checkbox" id="c3" name="naver">
            <input type="checkbox" id="c4" name="naver">
            <input type="checkbox" id="c5" name="naver">

            <label for="c1" id="l1">
                <img src="img/check.png" class="chk_img1"><span>네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),<br> 프로모션 정보 수신(선택)에 모두 동의합니다.</span><br></div>
            </label>
            <br><br>

            <label for="c2" id="l2">
                <img src="img/check.png" class="chk_img2"><span>네이버 이용약관 동의(필수)</span><br></div>
            </label>
            <div class="con">
                여러분을 환영합니다.
                네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
            </div>
            <br><br>

            <label for="c3">
                <img src="img/check.png" class="chk_img3"><span>개인정보 수집 및 이용 동의(필수)</span><br></div>
            </label>
            <div class="con">
                - 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
            </div>
            <br><br>

            <label for="c4">
                <img src="img/check.png" class="chk_img4"><span>위치정보 이용약관 동의(선택)</span><br></div>
            </label>
            <div class="con">
                위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.
            </div>
            <br><br>

            <label for="c5">
                <img src="img/check.png" class="chk_img5"><span>프로모션 정보 수신 동의(선택)</span><br><br></div>
            </label>
            <div class="con">
                네이버에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
            </div>
            <br><br>
        </div>

        <p></p>
        <input type="button" value="취소" id="cancelBox" onclick="location.href='http://naver.com'">
        <input type="button" value="확인" id="confirmBox" onclick="checkVal(form)">
    </form>

    <script src="agree.js"></script>
</body>
</html>