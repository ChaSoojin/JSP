<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWritePro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO(id,pw,title,content);
		
		if(dao.addBoard(board)){
	%>
	
		<script>
			alert("게시글이 등록되었습니다.");
			location.href = "boardlist.jsp";
		</script>
	<%	
		}
		else{
	%>
		<script>
			alert("게시글 등록 실패");
			history.back();
		</script>
	<%
		}
	%>
</body>
</html>