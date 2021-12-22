<%@page import="rentalcar.RentalcarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
body {
	text-align: center;
}

#search {
	width: 300px;
}

#result {
	width: 800px;
	height: 400px;
	border: 1px solid black;
	text-align: center;
	margin: auto;
	margin-top: 30px;
}

#header {
	height: 10%;
	border: 1px solid black;
}

#carimg {
	width: 100px;
	height: 50px;
}
</style>

<section class="breadcrumbs-custom bg-image"
	style="background-image: url(./resources/car2.png);">
	<div class="breadcrumbs-custom-inner">
		<div class="breadcrumbs-custom-container container">
			<div class="breadcrumbs-custom-main">
				<h6 class="breadcrumbs-custom-subtitle title-decorated"
					style="color: white;">렌트카 검색</h6>
				<h1 class="breadcrumbs-custom-title" style="color: white;">렌트카검색</h1>
			</div>
		</div>
	</div>
</section>

<div style="text-align: center; margin: 50px 0px;">
	<div
		style="display: inline-block; border-bottom: 1px solid black; padding-bottom: 30px; margin-bottom: 20px;">
		<form method="post" action="rentalcarSearchPro.jsp">

			<input type="text" id="search" name="search" placeholder="렌터카 검색"
				style="width: 400px; display: inline"
				class="form-input form-control-has-validation form-control-last-child"
				onkeyup="enterkey();" />

			<button type="submit" class="button button-primary button-winona"
				style="margin: 0px 30px;">검색</button>
		</form>
	</div>

	<div class="container" style="margin-top: 30px;">
		<div class="row container-board-padding"
			style="justify-content: center;">
			<div class="col-md-12 table-responsive wow fadeIn row ">
				<%
			ArrayList<RentalcarDTO> cars = (ArrayList) session.getAttribute("car");

			if (cars == null || cars.size() == 0) {
			%>
				<div>
					<div>필요한 차를 검색해 주세요!</div>
				</div>

				<%
			} else {
			%>
				<div>
					<table id="result">
						<tr id="header">
							<th>no</th>
							<th>자동차</th>
							<th>가격</th>
							<th>사용인원</th>
							<th>회사</th>
							<th>이미지</th>
						</tr>
						<%
					//no name category price use_people company img info
					for (RentalcarDTO car : cars) {
						int no = car.getNo();
						String name = car.getName();
						int price = car.getPrice();
						int use_people = car.getUse_people();
						String company = car.getCompany();
						String img = "./resources/imgCar/rent_" + car.getImg();
						//System.out.println("이미지: " + img);
					%>

						<tr>
							<td><%=no%></td>
							<td style="cursor: pointer; color: blue"
								onclick="location.href='rentalcarView.jsp?no=<%=no%>'"><%=name%></td>
							<td><%=price%></td>
							<td><%=use_people%>/10</td>
							<td><%=company%></td>
							<td><img src="<%=img%>" id="carimg"></td>
						</tr>

						<%
					}
					}
					%>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function enterkey() {
	if (window.event.keyCode == 13) {
		location.href='rentalcarSearchPro.jsp';
	}
}
</script>

<%@ include file="footer.jsp"%>