<%@page import="review.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommentDeletePro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println(no);
	
	int num = Integer.parseInt(request.getParameter("num")); 
	System.out.println("num: " + num);

	CommentDAO dao = CommentDAO.getInstance();
	ArrayList<CommentDTO> commentlist = dao.getComments(no);
	
	int originalno = 0;
	
	for(CommentDTO comment : commentlist){
		if(comment.getNo() == num){
			originalno = comment.getOriginalno();
		}
	}
	
	if(dao.deleteComment(no, originalno)){
%>

	<script>
		const no = <%=no%>
		alert("댓글을 삭제했습니다.");
		location.href = 'reviewView.jsp?no=' +  no;
	</script>
<%
	}
	else{
		System.out.println("댓글삭제실패!!");
		response.sendRedirect("boardView.jsp?no=" +no);
	}
	
%>
</body>
</html>