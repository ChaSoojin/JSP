<%@page import="rentalcar.RentalcarDTO"%>
<%@page import="rentalcar.RentalcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#header {
	font-weight: bold;
	text-align: center;
}

#con{
	text-align: center;
}

#carimg{
	width:800px;
	height:400px;
}

.btndiv{
	display:flex;
}

#mainbtn{
	margin-left:10px;
	width:100px;
	height:40px;
	cursor:pointer;
}

#reservebtn{
	margin-left:1130px;
	width:100px;
	height:40px;
	cursor:pointer;
}

table{
	border-collapse: collapse; 
	width: 800px; 
	height: 400px;
	margin:auto;
	text-align:center;
}
</style>
<title>Insert title here</title>
</head>
<br>
<body>
	<table border="solid 1px">		
		<tr>
		<%
		//no name category price use_people company img info
		int no = Integer.parseInt(request.getParameter("no"));
		RentalcarDAO dao = RentalcarDAO.getInstance();
		RentalcarDTO car = dao.getRentalCarView(no);
		
		String log = (String)session.getAttribute("id");
		String name = car.getName();
		int category = car.getCategory();
		int price = car.getPrice();
		int use_people = car.getUse_people();		
		String company = car.getCompany();
		String img = "./resources/imgCar/rent_" + car.getImg();
		String info = car.getInfo();
		
        %>
			<td id="header">no</td>
			<td id="con"><%=no %></td>
			<td id="header">자동차</td>
			<td id="con"><%=name %></td>
			<td id="header">카테고리</td>
			<td id="con"><%=category %></td>
			<td id="header">사용인원</td>
			<td id="con"><%=use_people %>/10</td>				
			<td id="header">회사</td>
			<td id="con"><%=company %></td>				
		</tr>
		<tr>
			<td id="header">내용</td>
			<td colspan="9"><%=info %></td>
		</tr>
		<tr>
			<td id="header">가격</td>
			<td colspan="9"><%=price %></td>
		</tr>
		<tr>
			<td id="header">사진</td>
			<td colspan="9"><img src="<%=img %>" id="carimg"></td>
		</tr>
	</table>
	<br><br>
	
	<div class="btndiv">
		<button type="button" id="reservebtn" onclick="location.href='rentalcarReserve.jsp?no=<%=no%>'">예약하기</button>
		<button type="button" id="mainbtn" onclick="history.back(-1);">뒤로가기</button>
	</div>
</body>
<br>
</html>
<%@ include file="footer.jsp" %>