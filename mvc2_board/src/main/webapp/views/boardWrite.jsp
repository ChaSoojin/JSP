<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #header{
            font-weight: bold;
            width:10%;
            text-align:center;
        }
        
        #subbtn{
            margin-top: 20px;
            margin-left: 380px;
            padding:10px 30px 10px 30px;
        }
        
        #title{
            width:440px;
            height:40px;
            border:none;
        }

        #conarea{
            width:440px;
            height:400px;
            border:none;
        }
    </style>
    <title>Board Write Page</title>
</head>
<body>
    <!-- no id pw title content likes regdate -->
    <form method="post" action="service">
    <input type="hidden" name="command" value="boardWrite">
        <table border="solid 1px" style="border-collapse: collapse; width:500px; height:400px">
            <tr>
                <td id="header">제목</td>
                <td><input type="text" id="title" name="title"></td>
            </tr>
            <tr>
                <td id="header" style="height:90%">내용</td>
                <td><textarea id="conarea" name="content"></textarea></td>
            </tr>
            <tr>
            	<td id="header">패스워드</td>
            	<td><input type="text" id="title" name="pw"></td>
            </tr>
        </table>
        <input type="submit" id="subbtn" value="등록하기">
    </form>
</body>
</html>