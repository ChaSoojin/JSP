<%@page import="java.sql.Timestamp"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
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
            width:10%;
            text-align:center;
        }
        
        #subbtn{
            margin-top: 20px;
            margin-left: 1220px;
            padding:10px 30px 10px 30px;
        }
        
        #title{
            width:440px;
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
    <title>Review Update Page</title>
</head>
<br>
<body>
<%
	ReviewDAO dao = ReviewDAO.getInstance();
	int no = Integer.parseInt(request.getParameter("no"));
	ReviewDTO board = dao.getreviewView(no);
	
	String title = board.getTitle();
	String id = board.getId();
	String content = board.getContent();
	int likes = board.getLikes();
	Timestamp regdate = board.getEnrolldate();
%>
    <!-- no id pw title content likes regdate -->
    <form method="post" action="reviewUpdatePro.jsp?no=<%=no%>">
        <table border="solid 1px" style="border-collapse: collapse; width:800px; height:400px; margin:auto; text-align:center;">
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
<br>
</html>
<%@ include file="footer.jsp" %>