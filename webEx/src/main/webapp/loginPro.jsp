<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- pro : process --%>
	loginpro 페이지입니다.
	<%
		// URI 쿼리 구간에 파라미터명1=값1&파라미터명2=값2... (요청과 함께 전달된 값이 받아짐)
		
		// get방식
		// http://localhost:8080/webEx/loginPro.jsp?id=qwer&pw=1111	
		// http://localhost:8080/webEx/loginPro.jsp?id=a&pw=b
		
		// post방식 : 전달되는 파라미터값을 숨겨서 전달(보안)
		//http://localhost:8080/webEx/loginPro.jsp
		request.setCharacterEncoding("UTF-8");
	
		// jsp의 내장객체 중, request
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	<h1>id: <%=id %></h1>
	<h1>pw: <%=pw %></h1>
</body>
</html>