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
            background-color:blue;
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
    <form action="service" method="post">
		<input type="hidden" name="command" value="join">	
        <h4>아이디<br></h4>
        <input type='text' name='id' required><br>
        <p id="p1"></p>
        
        <h4>비밀번호<br></h4>
        <input type='password' name='pw' required><br>
        <p id="p2"></p>

        <h4>비밀번호 재확인<br></h4>
        <input type='password' name='pw2' required><br>
        <p id="p3"></p>

        <h4>이름<br></h4>
        <input type="text" name="name" required><br>
        <p id="p4"></p>

        <h4>생년월일<br></h4>
        <input type="text" maxlength="4" placeholder="년(4자)" name="year" id="year" required><br>
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
        <input type="text" maxlength="2" placeholder="일" id="day" name="day" required><br>
        <p id="p5"></p>
        
        <h4>성별<br></h4>
        <select id="gen" name="gen" required>
            <option id="s1" value="s1">성별</option>
            <option id="s2" value="s2">남자</option>
            <option id="s3" value="s3">여자</option>
            <option id="s4" value="s4">선택안함</option>
        </select>
        <p id="p6"></p>

        <h4>이메일 입력<br></h4>
        <input type="email" name="email" id="email" placeholder="@포함입력"><br>
		<p id="p8"></p>

        <h4>휴대전화<br></h4>
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
        <input type="tel" placeholder="전화번호 입력" name="phone" id="phone" required><br>
        <p id="p7"></p>
        <input type="submit" value="가입하기" id="joinBox" onclick="checkVal(form)">
    </form>
</body>
<script src="./resources/js/join.js"></script>
</html>
