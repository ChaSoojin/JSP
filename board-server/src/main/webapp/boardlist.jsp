<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board List</title>
</head>
<body>
	<%
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardList = dao.getBoardList();
		String log = (String)session.getAttribute("id");
		
		if(log != null){
	%>
	
    <button onclick="location.href='logoutPro.jsp'">로그아웃</button>
    <button onclick="location.href='boardWrite.jsp'">글쓰기</button>
    <button onclick="location.href='checkPass.jsp?num=1'" id="update">회원정보수정</button>
    <button onclick="location.href='checkPass.jsp?num=0'" id="remove">회원탈퇴</button>
    
    <%
		}
		else{
    %>
			
    <button onclick="location.href='login.jsp'">로그인</button>
	
	<%
	}
	%>
	
    <h1>Board List</h1>
    <div class="wrap">
        <table border="solid 1px" style="border-collapse: collapse;">
            <tr>
                <td>no</td>
                <td>title</td>
                <td>id</td>
                <td>like</td>
                <td>regdate</td>
            </tr>
         <%
     	for(BoardDTO board : boardList){
			System.out.println(board.toString());
			
			int no = board.getNo();
			String title = board.getTitle();
			String id = board.getId();
			int likes = board.getLikes();
			Timestamp regdate = board.getRegDate();
         %>
            <tr>
                <td><%=no %></td>
                <td style="cursor:pointer; color:blue" onclick="move(<%=no%>, '<%=log%>')"><%=title %></td>
                <td><%=id %></td>
                <td><%=likes %></td>
                <td><%=regdate %></td>
            </tr>
        <%
     	}
        %>
        </table>
    </div>
    
    <script src="boardlist.js"></script>
</body>
</html>