<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LogoutPro</title>
</head>
<body>
<%
	session.invalidate(); 
	%>
	<script>
		alert("�α׾ƿ� �Ǿ����ϴ�.");
		location.href='index.jsp';
	</script>
	
	<%
	//response.sendRedirect("index.jsp");
%>
</body>
</html>