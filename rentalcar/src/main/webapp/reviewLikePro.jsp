<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewLikePro</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String log = (String)session.getAttribute("id");

	ReviewDAO dao = ReviewDAO.getInstance();
	int chk = dao.likeSwap(no, log);
	
	//좋아요취소
	if(chk == 0){
		System.out.println("좋아요취소완료");
		dao.updateLikes(no,chk);
	}
	
	//좋아요추가
	else if(chk == 1){
		System.out.println("좋아요완료");		
		dao.updateLikes(no,chk);
	}
	
	String url = "reviewView.jsp?no=" + no;
	response.sendRedirect(url);
	
%>

</body>
</html>