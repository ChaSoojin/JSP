<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewWritePro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("id");
		
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewDTO review = new ReviewDTO(id,title,content);
		
		if(dao.addreview(review)){
	%>
	
		<script>
			alert("게시글이 등록되었습니다.");
			location.href = "reviewlist.jsp";
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