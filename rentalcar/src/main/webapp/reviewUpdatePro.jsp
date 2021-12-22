<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Update Page</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	String id = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ReviewDAO dao = ReviewDAO.getInstance();
	
	if(dao.updatereview(no, title, content)){
		System.out.println("게시글 업데이트 성공");

%>

	<script>
		alert("게시글을 수정했습니다.");
		location.href = "reviewlist.jsp";
	</script>
	
<%
	}
	else{
		System.out.println("게시글 업데이트 실패");
%>
	<script>
		alert("게시글 수정 실패");
		history.back();
	</script>	

<%
	}
%>
</body>
</html>