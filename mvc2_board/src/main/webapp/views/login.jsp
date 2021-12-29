<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        span{
            white-space:pre;
        }
        
        body{
        	text-align:center;
        }
        
        h1{
    		font-size : 100px;
    		cursor:pointer;
    	}
    	
    	a{
    		text-decoration:none;
    		color : green;
    	}
    	
    	#loginbtn{
    		width:130px;
    		height:30px;
    	}
    </style>
    <title>login</title>
</head>
<body>
    <!-- url : login > loginPro.java(servlet) -->
	<form action="service" method="post">
	<input type="hidden" name="command" value="login">
    	<%-- input 태그의 name과 value가 파라미터로 전달됨 --%>
        <span>id:&#9;</span><input type='text' name='id' required><br>
        <span>pw:&#9;</span><input type='password' name='pw' required><br><br>
        <input type="submit" value="로그인" id="loginbtn">
    </form>
</body>
</html>