<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
            border:none;
        }

        #conarea{
            width:440px;
            height:400px;
            border:none;
        }
    </style>
    <title>Board Update Page</title>
</head>
<body>
<%
	BoardDAO dao = BoardDAO.getInstance();
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDTO board = dao.getBoardView(no);
	
	String title = board.getTitle();
	String id = board.getId();
	String content = board.getContent();
	int likes = board.getLikes();
	Timestamp regdate = board.getRegDate();
%>
    <!-- no id pw title content likes regdate -->
    <form method="post" action="boardUpdatePro.jsp?no=<%=no%>">
        <table border="solid 1px" style="border-collapse: collapse; width:500px; height:400px">
            <tr>
                <td id="header">제목</td>
                <td><input type="text" id="title" name="title" value="<%=title %>"></td>
            </tr>
            <tr>
                <td id="header" style="height:90%">내용</td>
                <td><textarea id="conarea" name="content"><%=content %></textarea></td>
            </tr>
        </table>
        <input type="submit" id="subbtn" value="수정하기">
    </form>
</body>
</html>