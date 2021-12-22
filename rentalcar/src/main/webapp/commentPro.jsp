<%@page import="review.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommentPro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("comment");
	String id = (String)session.getAttribute("id");
	int no = Integer.parseInt(request.getParameter("no"));
	
	CommentDAO dao = CommentDAO.getInstance();
	
	if(content.equals("")){
%>
	<script>
		alert("댓글을 입력해주세요.");
		history.back();
	</script>
<%
	}
	
	else if(dao.addComment(id, no, content)){
%>
	
	<script>
		const no = '<%=no%>';
		alert("댓글을 등록했습니다.");
		location.href = "reviewView.jsp?no=" + no;
	</script>
	
<%
	}
	else{
		response.sendRedirect("boardView.jsp?no=" +no);
	}
%>
</body>
</html>