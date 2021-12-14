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
    		font-weight:bold;
    		text-align:center;
    	}
    	
    	#updatebtn{
    		margin-top: 20px;
            padding:10px 30px 10px 30px;
    	}
    </style>
    <title>Board View Page</title>
</head>
<body>
    <!-- no id pw title content likes regdate -->
    <div class="wrap">
        <table border="solid 1px" style="border-collapse: collapse; height:400px;">
            <tr>
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
                <td id="header">no</td>
                <td><%=no %></td>
                <td id="header">제목</td>
                <td><%=title %></td>                
                <td id="header">좋아요</td>
                <td><%=likes %></td>
                <td id="header">등록일자</td>
                <td><%=regdate %></td>
            </tr>
          	<tr>
          		<td id="header">작성자</td>
          		<td colspan="7"><%=id %></td>
          	</tr>
            <tr>
                <td colspan="9" style="height:90%"><%=content %></td>
            </tr>
        </table>
        
        <%
        	String log = (String)session.getAttribute("id");
        	if(log.equals(id)){
        %>
        
        <button id="updatebtn" onclick="location.href='boardUpdate.jsp?no=<%=no%>'">수정하기</button>
        <button id="updatebtn" onclick="location.href='boardDeletePro.jsp?no=<%=no%>'">삭제하기</button>
        
        <%
        	}
        %>
    </div>
</body>
</html>