<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #header{
            font-weight: bold;
            width:15%;
            text-align:center;
        }
        
        #subbtn{
            margin-top: 20px;
            margin-left: 1210px;
            padding:10px 30px 10px 30px;
        }
        
        #title{
            width:440px;
            height:40px;
            border:none;
            float:left;
        }

        #conarea{
            width:440px;
            height:400px;
            border:none;
             float:left;
        }
    </style>
    <title>Review Write Page</title>
</head>
<br>
<body>
    <!-- no id title content likes enrollDate -->
    <form method="post" action="reviewWritePro.jsp">
        <table border="solid 1px" style="border-collapse: collapse; width:780px; height:400px; margin:auto; text-align:center;">
            <tr>
                <td id="header">제목</td>
                <td><input type="text" id="title" name="title"></td>
            </tr>
            <tr>
            	<td id="header">작성자</td>
            	<td><%=session.getAttribute("id") %></td>
            </tr>
            <tr>
                <td id="header" style="height:90%">내용</td>
                <td><textarea id="conarea" name="content"></textarea></td>
            </tr>
        </table>
        <input type="submit" id="subbtn" value="등록하기">
    </form>
</body>
<br>
</html>
<%@ include file="footer.jsp" %>