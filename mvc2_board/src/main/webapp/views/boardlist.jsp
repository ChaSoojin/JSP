<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.dto.BoardDTO"%>
<%@page import="model.dao.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
form{
	display:inline;
}

#btn{
	cursor:pointer;
}
</style>
<title>Board List</title>
</head>
<body>
	<%
		String log = (String)session.getAttribute("log");
		
		if(log != null){
	%>

	<button onclick="location.href='service?command=logout'" id="btn">로그아웃</button>

	<form action="service" method="post">
		<input type="submit" id="btn" name="link" value="쓰기"> 
		<input type="hidden" name="command" value="main">
	</form>
	
	<form action="service" method="post">
		<input type="submit" id="btn" name="link" value="회원정보수정">  
		<input type="hidden" name="command" value="main">
		<input type="hidden" name="num" value="1">
	</form>
	
	<button onclick="location.href='service?command=userUpdate&num=0'" id="btn">회원탈퇴</button>

	<%
		}
		else{
    %>

	<form action="service" method="post">
		<input type="submit" id="btn" name="link" value="login"> <input
			type="hidden" name="command" value="main">
	</form>

	<%
	}
	%>

	<h1>Board List</h1>
	<div class="wrap">
		<table border="solid 1px" style="border-collapse: collapse;">
			<tr>
				<td>no</td>
				<td>title</td>
				<td>id</td>
				<td>like</td>
				<td>regdate</td>
			</tr>

			<c:forEach var="item" items="${boardlist}">
				<tr>
					<td>${ item.no }</td>
					<td>
					<a href="service?command=boardView&no=${item.no}"> ${ item.title }</a>
					</td>
					<td>${ item.id }</td>
					<td>${ item.likes }</td>
					<td>${ item.regDate }</td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>