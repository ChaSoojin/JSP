<%@page import="rentalcar.RentalcarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalcar.RentalcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rentalcar search pro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String keyword = request.getParameter("search");

	System.out.println("keyword: " + keyword);
	
	RentalcarDAO dao = RentalcarDAO.getInstance();
	
	ArrayList<RentalcarDTO> cars = dao.searchRentalCar(keyword);
	
	response.sendRedirect("rentalcarSearch.jsp");
	
	session.setAttribute("car", cars);
	session.setMaxInactiveInterval(1);
%>
</body>
</html>