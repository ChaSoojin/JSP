<%@page import="review.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>commentLikePro</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println("NO-> " + no);
	
	int num = Integer.parseInt(request.getParameter("num")); 
	System.out.println("NUM-> " + num);
	
	int check = Integer.parseInt(request.getParameter("chk"));
	System.out.println("check-> " + check);
	
	CommentDAO dao = CommentDAO.getInstance();
	ArrayList<CommentDTO> commentlist = dao.getComments(no);
	
	int originalno = 0;
	
	for(CommentDTO comment : commentlist){
		if(comment.getNo() == num){
			originalno = comment.getOriginalno();
		}
	}
		
	if(check != -1){
		if(dao.updateCommentLikes(check, no, originalno)){
			if(check == 1){
				System.out.println("댓글추천완료");	
			}
			else if(check == 0){
				System.out.println("댓글비추천완료");	
			}
		}
	}
	
	response.sendRedirect("reviewView.jsp?no=" + no);
%>
</body>
</html>