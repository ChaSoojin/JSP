<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = MemberDAO.getInstance();
		if(dao.checkLogin(id,pw)){
			session.setAttribute("id", id);
			
			String log = (String)session.getAttribute("id");
			System.out.println("LOG: " + log);
			%>
			<script>
				const log = "<%= log %>";
				alert(log+"님 환영합니다!"); 
				location.href="main.jsp";
			</script>
			<% 
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