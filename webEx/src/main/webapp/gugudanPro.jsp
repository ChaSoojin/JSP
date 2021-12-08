<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanPro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String q1 = request.getParameter("q1");
		String q2 = request.getParameter("q2");
		String q3 = request.getParameter("q3");
		String q4 = request.getParameter("q4");
		String q5 = request.getParameter("q5");
	%>

	<h1>성적표</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>정답</td>
			<td>사용자값</td>
			<td>정오표</td>
		</tr>
		<tr>
			<td>1</td>
			<td></td>
			<td><%=q1 %></td>
			<td></td>
		</tr>
		<tr>
			<td>2</td>
			<td></td>
			<td><%=q2 %></td>
			<td></td>
		</tr>
		<tr>
			<td>3</td>
			<td></td>
			<td><%=q3 %></td>
			<td></td>
		</tr>
		<tr>
			<td>4</td>
			<td></td>
			<td><%=q4 %></td>
			<td></td>
		</tr>
		<tr>
			<td>5</td>
			<td></td>
			<td><%=q5 %></td>
			<td></td>
		</tr>
	</table>
</body>
</html>