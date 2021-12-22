<%@page import="rentalcar.ReserveDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalcar.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rentalcar reserve del pro</title>
</head>
<body>
<%
	ReserveDAO dao = ReserveDAO.getInstance();
	String log = (String)session.getAttribute("id");
	int reserve_seq = Integer.parseInt(request.getParameter("reserve_seq"));
	
	System.out.println(reserve_seq);
	
	if(dao.deleteReserve(reserve_seq, log)){
%>
	<script>
		alert("예약 취소했습니다.");
		location.href='mypage.jsp';
	</script>
<%
	}
	else{
		System.out.println("예약취소실패.......");
	}
%>
</body>
</html>