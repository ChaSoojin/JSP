<%@page import="rentalcar.RentalcarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalcar.RentalcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
td {
	text-align: center;
}

#reservebtn{
	cursor:pointer;
}
</style>

<section class="breadcrumbs-custom bg-image"
	style="background-image: url(./resources/car2.png);">
	<div class="breadcrumbs-custom-inner">
		<div class="breadcrumbs-custom-container container">
			<div class="breadcrumbs-custom-main">
				<h6 class="breadcrumbs-custom-subtitle title-decorated"
					style="color: white;">렌트카</h6>
				<h1 class="breadcrumbs-custom-title" style="color: white;">렌트카</h1>
			</div>
		</div>
	</div>
</section>

<div class="container" style="margin-top: 30px;">
	<div class="row container-board-padding"
		style="justify-content: center;">
		<div class="col-md-12 table-responsive wow fadeIn row ">
			<table class="table table-hover table-job-positions text-center">
				<thead class="thead_top">
					<tr>
						<th>no</th>
						<th>자동차</th>
						<th>가격</th>
						<th>사용인원</th>
						<th>회사</th>
						<th>예약</th>
						<th>사진</th>
					</tr>
				</thead>
				<%
				RentalcarDAO dao = RentalcarDAO.getInstance();
				ArrayList<RentalcarDTO> carlist = dao.getCarlist();

				for (RentalcarDTO car : carlist) {
					int no = car.getNo();
					String name = car.getName();
					int price = car.getPrice();
					int use_people = car.getUse_people();
					String company = car.getCompany();
					String img = "./resources/imgCar/rent_" + car.getImg();
					
				%>

				<tr>
					<td><%=no%></td>
					<td style="cursor: pointer; color: blue" onclick="location.href='rentalcarView.jsp?no=<%=no%>'"><%=name%></td>
					<td><%=price%></td>
					<td><%=use_people%>/10</td>
					<td><%=company%></td>
					<td><button id="reservebtn" onclick="location.href='rentalcarReserve.jsp?no=<%=no%>'">예약하기</button></td>
					<td><img src="<%=img %>" id="carimg"></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>