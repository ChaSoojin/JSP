<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- pro : process --%>
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
			
			UserDAO dao = UserDAO.getInstance();
			if(dao.checkLogin(id,pw)){
		session.setAttribute("id", id);
		
		String log = (String)session.getAttribute("id");
		System.out.println("LOG: " + log);
	%>
			<script>
				const log = "<%= log %>";
				alert(log+"님 환영합니다!"); 
				location.href="boardlist.jsp";
			</script>
			<% 
			//response.sendRedirect("boardlist.jsp");
		}
		else{
			%>
			<script>
				alert('아이디, 패스워드가 일치하지 않습니다. 다시 확인해주세요!');
				history.back();	
			</script>
			<%
		}
	%>
</body>
</html>