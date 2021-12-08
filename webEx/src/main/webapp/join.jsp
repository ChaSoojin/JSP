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

        #joinBox{
            width:400px;
            height:50px;
            background-color:green;
            margin-top:30px;
            font-size: 30px;
            color:white;
            cursor: pointer;
        }

        p{
            color:red;
        }
    </style>
    <title>JOIN PAGE</title>
</head>

<body>
    <form method='post' action="joinPro.jsp">
        <a href="#main">본문으로 바로가기<br></a>
        <a href="http://naver.com">
            <h1>NAVER</h1><br>
        </a>

        <span id="main"></span><br>

        <h3>아이디<br></h3>
        <input type='text' name='id' required>@naver.com<br>
        <p id="p1"></p>
        
        <h3>비밀번호<br></h3>
        <input type='password' name='pw' required><br>
        <p id="p2"></p>

        <h3>비밀번호 재확인<br></h3>
        <input type='password' name='pw2' required><br>
        <p id="p3"></p>

        <h3>이름<br></h3>
        <input type="text" name="name" required><br>
        <p id="p4"></p>

        <h3>생년월일<br></h3>
        <input type="text" maxlength="4" value="년(4자)" name="year" id="year" onclick="deleteCon(value)" required><br>
        <select name="mon" id="mon" required>
            <option value="o1" id="o1">월</option>
            <option value="o2">1</option>
            <option value="o3">2</option>
            <option value="o4">3</option>
            <option value="o5">4</option>
            <option value="o6">5</option>
            <option value="o7">6</option>
            <option value="o8">7</option>
            <option value="o9">8</option>
            <option value="o10">9</option>
            <option value="o11">10</option>
            <option value="o12">11</option>
            <option value="o13">12</option>
        </select>
        <br>
        <input type="text" maxlength="2" value="일" id="day" name="day" onclick="deleteCon(value)" required><br>
        <p id="p5"></p>
        
        <h3>성별<br></h3>
        <select id="gen" name="gen" required>
            <option id="s1" value="s1">성별</option>
            <option id="s2" value="s2">남자</option>
            <option id="s3" value="s3">여자</option>
            <option id="s4" value="s4">선택안함</option>
        </select>
        <p id="p6"></p>

        <h3>본인 확인 이메일(선택)<br></h3>
        <input type="email" name="email" id="email" onclick="deleteCon(value)" value="선택입력"><br>

        <h3>휴대전화<br></h3>
        <select name="contry" required>
            <option value="c1">대한민국 +82</option>
            <option value="c2">덴마크 +45</option>
            <option value="c3">네팔 +977</option>
            <option value="c4">네덜란드 +31</option>
            <option value="c4">나우루 + 674</option>
            <option value="c4">나이지리아 +234</option>
            <option value="c4">그리스 +30</option>
            <option value="c4">기니 +224</option>
            <option value="c4">독일 +49</option>
            <option value="c4">호주 +61</option>
        </select>
        <br>
        <input type="tel" value="전화번호 입력" name="phone" id="phone" onclick="deleteCon(value)" required> 인증번호 받기<br>
        <p id="p7"></p>
        <input type="submit" value="가입하기" id="joinBox" onclick="checkVal(form)">
    </form>
    
        <ul>
            <li><a href="https://policy.naver.com/rules/service.html">이용약관</a></li>
            <li><a href="https://policy.naver.com/policy/privacy.html">개인정보처리방침</a></li>
            <li><a href="https://policy.naver.com/rules/disclaimer.html">책임의 한계와 법적고지</a></li>
            <li><a
                    href="https://help.naver.com/support/service/main.help?serviceNo=532&_membership_p.membership_p.membership_26">회원정보
                    고객센터</a></li>
        </ul>

        <h4><a href="http://naver.com">naver</a> Copyright C <a href="https://www.navercorp.com/">Naver Corp.</a> All
            Rights Reserved.</h4>
</body>

<script src="join.js"></script>
</html>