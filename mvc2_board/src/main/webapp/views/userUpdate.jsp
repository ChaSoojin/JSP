<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("log");
	%>
	<h1>Update & delete 권한확인</h1>
	<form method="post" action="service">
		<span>id:&#9;</span><input type='text' name='id' value="<%=id %>" readonly required><br>
        <span>&#9;pw:&#9;</span><input type='password' name='pw' required>
	
        <input type="hidden" id="num" name="num" value="<%=request.getParameter("num")%>">
        <input type="submit" name="command" value="userUpdate">
	</form>
</body>
</html>