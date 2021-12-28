<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MAIN</h1>
	<%
	String log = (String)session.getAttribute("log");
	System.out.println("log : " + log);
	
	if(log != null){
	%>
	<h1>
		hello,
		<%=log%>!
	</h1>
	
	<form action="service" method="post">
		<input type="submit" value="logout"> 
		<input type="hidden" name="command" value="logout"> 
	</form>
	
	<form action="service" method="post">
		<input type="submit" name="command" value="boardlist">
	</form>
	
	<%
	}else{
	%>
	
	<form action="service" method="post">
	<input type="hidden" name="command" value="main">
		<input type="submit" name="link" value="login">
		<input type="submit" name="link" value="join">
	</form>
	
	<%
	}
	%>
</body>
</html>