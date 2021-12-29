<%@page import="model.dao.BoardDAO"%>
<%@page import="model.dto.CommentDTO"%>
<%@page import="model.dao.CommentDAO"%>
<%@page import="model.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 500px;
	height: 100px;
}

#commentbtn {
	position: relative;
	top: -5px;
	left: -85px;
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
	top:-28px;
	left:10px;
	font-size:12px;
}

#updateform{
	display:inline;
}
</style>
<title>Board View Page</title>
</head>
<body>
	<!-- no id pw title content likes regdate -->
	<div class="wrap">
		<table border="solid 1px"
			style="border-collapse: collapse; width: 500px; height: 400px;">
			<tr>
				<td id="header">no</td>
				<td>${boardview.no }</td>
				<td id="header">좋아요</td>
				<td>${boardview.likes}</td>
				<td id="header">등록일자</td>
				<td>${boardview.regDate}</td>
				<td>
				
				<form method="post" action="service">
					<input type="hidden" name="no" value="${boardview.no }">
				</form>
				<%      
					BoardDAO dao = BoardDAO.getInstance();
					int no = Integer.parseInt(request.getParameter("no"));
					String log = (String)session.getAttribute("log");
					
                	if(dao.getLike(no, log)){
                		
                %> <img src="./img/like.png" id="likeimg" name="like"
					onclick="location.href='service?command=BoardLike&no=<%=no%>'"> <%
                	}else{
            	%> <img src="./img/default_like.png" id="likeimg"
					name="likenot"
					onclick="location.href='service?command=BoardLike&no=<%=no%>'"> <%
                	}
            	%> 
				</td>
			</tr>
			<tr>
				<td id="header">제목</td>
				<td colspan="7">${boardview.title}</td>
			</tr>
			<tr>
				<td id="header">작성자</td>
				<td colspan="7">${boardview.id}</td>
			</tr>
			<tr>
				<td colspan="9" style="height: 90%">${boardview.content}</td>
			</tr>
		</table>

		<h3>댓글작성</h3>
		<form method="post" action="service">
			<textarea id="comment" name="comment"
				placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제됩니다."></textarea>
			<input type="hidden" id="no" name="no"
				value="<%=request.getParameter("no")%>"> <input
				type="submit" name="command" value="등록" id="commentbtn">
		</form>
		
			<table style="border-collapse: collapse; width: 530px;">
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
				<tr>
					<td><%=num %></td>
					<td id="writeper">작성자: <%=commentid %></td>
					<td id="writeday">작성일: <%=regDate %> 
			<%
       			if(commentid.equals(log)){
       		%> 
       		<input type="button" id="del" value="삭제" onclick="location.href='service?command=삭제&num=<%=num%>&no=<%=request.getParameter("no")%>'"> 
						
			<%
       			}
       		%> 
				</tr>
		 
		 
				<tr class="line">
					<td colspan="3"><%=commentContent %></td>
					<td id="commentimg">
       					<button type="button" id="goodbtn" onclick="location.href='service?command=CommentLike&no=<%=no%>&num=<%=num%>'"> 
						<img src="./img/good.png" id="goodimg"><p id="cnt"><%=like %></p>
						</button>
						
       					<button type="button" id="badbtn" onclick="location.href='service?command=CommentNotLike&no=<%=no%>&num=<%=num%>'"> 
						<img src="./img/bad.png" id="badimg"><p id="cnt"><%=notlike %></p>
						</button>
					</td>
				</tr>
			<%
       			}
       		%>
			</table>
		<%
			String id = ((BoardDTO)request.getAttribute("boardview")).getId();
			
        	if(log.equals(id)){
        %>
        <form action="service" method="post" id="updateform">
			<input type="hidden" name="command" value="main">
			<input type="hidden" name="no" value="${boardview.no }">
			<input type="submit" name="link" id="updatebtn" value="수정하기">
		</form>
		
		<button type="button" id="updatebtn" onclick="location.href='service?command=boardDelete&no=${boardview.no }'">삭제하기</button>
		<button type="button" id="updatebtn" onclick="location.href='service?command=boardlist'">돌아가기</button>	
		<%
        	}else{
        %>
		<button type="button" id="updatebtn" onclick="location.href='service?command=boardlist'">돌아가기</button>
		
		<%
        	}
        %> 
	</div>
</body>
</html>