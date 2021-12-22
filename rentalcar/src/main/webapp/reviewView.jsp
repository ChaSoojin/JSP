<%@page import="review.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.CommentDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
#header {
	font-weight: bold;
	text-align: center;
}

#updatebtn {
	margin-top: 20px;
	padding: 10px 30px 10px 30px;
	cursor: pointer;
}

#likeimg {
	margin-left: 10px;
	margin-top: 5px;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

#comment {
	width: 800px;
	height: 100px;
	position:relative; 
	left:40px;
}

#commentbtn {
	position: relative;
	top: -5px;
	left: -45px;
	width: 80px;
	cursor: pointer;
	background: green;
	border: none;
	color: white;
}

.line {
	border-bottom: 2px solid blue;
}

#del {
	margin-left:5px;
	cursor: pointer;
}

#writeday{
	position: relative; 
	left: 50px;
}

#writeper{
	margin-bottom:10px;	
}

#commentimg{
	display:flex;
}

#goodbtn{
	width:40px;
	height:20px;
	margin-right:10px;
	position: relative;
	left:-5px;
	cursor: pointer;
	font-size:10px;
}

#badbtn{
	width:40px;
	height:20px;
	position: relative;
	left:-10px;
	cursor: pointer;
	font-size:10px;
}

#goodimg{
	width:15px;
	height:15px;
	position: relative;
	left:-8px;
}

#badimg{
	width:15px;
	height:15px;
	position: relative;
	left:-8px;
}

#cnt{
	position: relative;
	top:-33px;
	left:10px;
	font-size:12px;
}

#con{
	float:left;	
	border:none;
}
</style>
<title>Review View Page</title>
</head>
<br>
<body style="text-align:center;">
	<!-- no id pw title content likes regdate -->
	<div class="wrap">
		<table border="solid 1px"
			style="border-collapse: collapse; width: 800px; height: 400px; margin:auto; text-align:center;">
			<tr>
		<%
			ReviewDAO dao = ReviewDAO.getInstance();
			int no = Integer.parseInt(request.getParameter("no"));
			ReviewDTO board = dao.getreviewView(no);
        	
        	System.out.println(board);
			String title = board.getTitle();
			String id = board.getId();
			String content = board.getContent();
			int likes = board.getLikes();
			Timestamp enrolldate = board.getEnrolldate();
			
			String log = (String)session.getAttribute("id");
			
         %>
				<td id="header">no</td>
				<td><%=no %></td>
				<td id="header">좋아요</td>
				<td><%=likes %></td>
				<td id="header">등록일자</td>
				<td><%=enrolldate %></td>
				<td>
				<%          			
                	if(dao.getLike(no, log)){
                %> <img src="./img/like.png" id="likeimg" name="like"
					onclick="location.href='reviewLikePro.jsp?no=<%=no%>'"> <%
                	}else{
            	%> <img src="./img/default_like.png" id="likeimg"
					name="likenot"
					onclick="location.href='reviewLikePro.jsp?no=<%=no%>'"> <%
                	}
            	%>
				</td>
			</tr>
			<tr>
				<td id="header">제목</td>
				<td colspan="7" id="con"><%=title %></td>
			</tr>
			<tr>
				<td id="header">작성자</td>
				<td colspan="7" id="con"><%=id %></td>
			</tr>
			<tr>
				<td colspan="9" style="height: 90%;"><%=content %></td>
			</tr>
		</table>

		<br><br>
		<h3 style="position:relative; left:-330px;">댓글작성</h3>
		<form method="post" action="commentPro.jsp">
			<textarea id="comment" name="comment"
				placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제됩니다."></textarea>
			<input type="hidden" id="no" name="no"
				value="<%=request.getParameter("no")%>"> <input
				type="submit" value="등록" id="commentbtn">
		</form>
		
			<table style="border-collapse: collapse; width: 800px; position:relative; left:550px;">
			<%
       			CommentDAO commentdao = CommentDAO.getInstance();
       			ArrayList<CommentDTO> comments = commentdao.getComments(no);
       			for(CommentDTO comment : comments){
       				int num = comment.getNo();
       				String commentid = comment.getId();
       				String commentContent = comment.getComment();
       				int like = comment.getLikes();
       				int notlike = comment.getNotlikes();
       				Timestamp regDate = comment.getRegdate();
       		%>
			<%-- <form method="post" action="commentDeletePro.jsp?no=<%=no %>"> --%>
				<tr>
					<td><%=num %></td>
					<td id="writeper">작성자: <%=commentid %></td>
					<td id="writeday">작성일: <%=regDate %> 
			<%
       			if(commentid.equals(log)){
       		%> 
       		<input type="hidden" id="num" name="num" value="<%=num%>"> 
       		<button type="button" id="del" value="삭제" onclick="location.href='commentDeletePro.jsp?no=<%=no %>&&num=<%=num%>'">삭제</button>
						
			<%
       			}
       		%>
				</tr>
		<%-- </form> --%>
		
		<%-- <form method="post" action="commentLikePro.jsp?no=<%=no%>&&num=<%=num %>" id="commentform"> --%>
				<tr class="line">
					<td colspan="3"><%=commentContent %></td>
					<td id="commentimg">
						<button id="goodbtn" name="good" onclick="location.href='commentLikePro.jsp?no=<%=no%>&&num=<%=num %>&&chk=1'">
						<img src="./img/good.png" id="goodimg"><p id="cnt"><%=like %></p>
						</button>
						
						<button id="badbtn" name="bad" onclick="location.href='commentLikePro.jsp?no=<%=no%>&&num=<%=num %>&&chk=0'">
						<img src="./img/bad.png" id="badimg"><p id="cnt"><%=notlike %></p>
						</button>
						<input type="hidden" id="num" name="num" value="<%=num%>"> 
					</td>
				</tr>
		<%--</from>--%>
			<%
       			}
       		%>
			</table>
		<%
        	if(log.equals(id)){
        %>
			<button type="button" id="updatebtn" onclick="location.href='reviewUpdate.jsp?no=<%=no%>'">수정하기</button>
			<button type="button" id="updatebtn" onclick="location.href='reviewDeletePro.jsp?no=<%=no%>'">삭제하기</button>
			<button type="button" id="updatebtn" onclick="history.back(-1);">돌아가기</button>		
		<%
        	}else{
        %>
			<button type="button" id="updatebtn" onclick="location.href='reviewlist.jsp'">돌아가기</button>

		<%
        	}
        %>
	</div>
</body>
<br>
</html>
<%@ include file="footer.jsp" %>