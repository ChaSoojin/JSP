<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Delete Pro</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ReviewDAO dao = ReviewDAO.getInstance();
	
	if(dao.deletereview(no)){
		System.out.println("게시글삭제성공");
%>

	<script>
		alert("게시글을 삭제했습니다.");
		location.href = "reviewlist.jsp";
	</script>

<%
	}
	else{
		System.out.println("게시글삭제실패");
%>

	<script>
		alert("게시글 삭제 실패");
		history.back();
	</script>	
		
<%	
	}
%>
</body>
</html>