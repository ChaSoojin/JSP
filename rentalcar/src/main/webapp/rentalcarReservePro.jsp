<%@page import="rentalcar.ReserveDTO"%>
<%@page import="rentalcar.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rentalcar reserve Pro</title>
</head>
<body>
<!-- reserve_seq no id cnt days r_day use_navi use_seat -->
<%
	String id = (String)session.getAttribute("id");
	int no = Integer.parseInt(request.getParameter("no"));
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int days = Integer.parseInt(request.getParameter("days"));
	int use_seat = Integer.parseInt(request.getParameter("seat"));
	int use_navi = Integer.parseInt(request.getParameter("use"));
	String r_day = request.getParameter("date");
	
	//System.out.printf("%d %s %d %d %d %d %s\n", no, id, cnt, days, use_seat, use_navi, r_day);

	ReserveDAO dao = ReserveDAO.getInstance();
	ReserveDTO reserve = new ReserveDTO(no,id,cnt,days,r_day,use_navi, use_seat);
	
	if(dao.addReserve(reserve)){
			
%>
	<script>
		alert("예약 완료했습니다.");
		location.href='mypage.jsp';
	</script>
	
<%
	}
	else{
		System.out.println("예약실패");
%>
	<script>
		alert("로그인 후 이용 바랍니다.");
		location.href='login.jsp';
	</script>
<%
	}
%>
</body>
</html>