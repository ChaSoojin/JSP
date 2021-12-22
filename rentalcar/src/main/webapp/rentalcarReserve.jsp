<%@page import="rentalcar.RentalcarDTO"%>
<%@page import="rentalcar.RentalcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
    	#header, #con{
    		text-align:center;
    	}
    	    
    	#btn1{
    		margin-left:1250px;
			cursor:pointer;
			width:120px;
			height:40px;
		}
			
    	#btn2{
    		margin-left:20px;
			cursor:pointer;
			width:120px;
			height:40px;
		}	
		
		#name{
			border:none;
			width:1100px;
			height:50px;
		}
		
		#days, #cnt, #seat{
			width:100px;
			height:30px;
			margin-left:10px;
		}
	
		#date{
			height:30px;
			margin-left:10px;
		}
		
		#use{
			margin-left:10px;
		}
    </style>
    <title>Rentalcar reserve</title>
</head>
<br>

<body>
<form method="post" action="rentalcarReservePro.jsp">
    <!-- reserve_seq no id cnt days r_day use_navi use_seat -->
    <table border="solid 1px" style="border-collapse: collapse; width: 800px; height: 400px; margin:auto; text-align:center;">		
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
			<td id="header">사진</td>
			<td colspan="9"><img src="<%=img %>" id="carimg"></td>
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
            <td id="header">이름</td>
            <td colspan="9"><input type="text" id="name" name="name"></td>
        </tr>
        <tr>
            <td id="header">일수</td>
            <td colspan="9">
                <select name="days" id="days" required>
                    <option value="o1" id="o1">일</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                </select>
            </td>
        </tr>
        <tr>
            <td id="header">대수</td>
            <td colspan="9">
                <select name="cnt" id="cnt" required>
                    <option value="o1" id="o1">대</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </td>
        </tr>
        <tr>
            <td id="header">예약날짜선택</td>
            <td colspan="9"><input type="date" name="date" id="date"></td>
        </tr>
        <tr>
            <td id="header">네비사용</td>
            <td colspan="4">
                <input type="radio" name="use" value="1" id="use"><span>yes&nbsp;&nbsp;</span>
                <input type="radio" name="use" value="0"><span>no</span>
            </td> 
            <td id="header">사용할 좌석 수</td>
            <td colspan="4">
            	<select name="seat" id="seat" required>
                    <option value="o1" id="o1">석</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
            </td>      
        </tr>
	</table>
	<input type="hidden" name="no" value="<%=no %>">
	
	<br>
	<input type="submit" id="btn1" value="예약완료">
	<button type="button" id="btn2" onclick="history.back(-1);">뒤로가기</button>
</form>

</body>
<br>
</html>
<%@ include file="footer.jsp" %>