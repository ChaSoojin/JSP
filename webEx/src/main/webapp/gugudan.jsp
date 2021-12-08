<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
table {
	border: 1px solid;
	width: 300px;
	text-align: center;
}

td {
	border: 1px solid;
}
</style>
<title>Gugudan</title>
</head>
<body>
	<%
	//폼예제
	//gugudan.jsp
	//2~9단 안에서 랜덤으로 5개문제를 출제(table)
	//사용자가 문제에 대한 답을 입력할 수 있게끔(input -> request)
	
	//gugudanPro.jsp
	//넘어온 사용자입력값 파라미터를 바탕으로
	//성적표 출력(정오표)
	%>

	<%!
		public int ranNum(){
			Random ran = new Random();
			int num = ran.nextInt(8) + 2; //2~9
			
			return num;
		}
	
	%>

	<h1>구구단 문제</h1>

	<form method='post' action="gugudanPro.jsp">
		<table>
			<tr>
				<td>번호</td>
				<td>문제</td>
				<td>정답</td>
			</tr>
			<tr>
				<td>1</td>
				<td><%=ranNum()%>X<%=ranNum()%>=</td>
				<td><input type="text" name="q1" style="width: 200px;"></td>
			</tr>
			<tr>
				<td>2</td>
				<td><%=ranNum()%>X<%=ranNum()%>=</td>
				<td><input type="text" name="q2" style="width: 200px;"></td>
			</tr>
			<tr>
				<td>3</td>
				<td><%=ranNum()%>X<%=ranNum()%>=</td>
				<td><input type="text" name="q3" style="width: 200px;"></td>
			</tr>
			<tr>
				<td>4</td>
				<td><%=ranNum()%>X<%=ranNum()%>=</td>
				<td><input type="text" name="q4" style="width: 200px;"></td>
			</tr>
			<tr>
				<td>5</td>
				<td><%=ranNum()%>X<%=ranNum()%>=</td>
				<td><input type="text" name="q5" style="width: 200px;"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="제출하기">
	</form>
</body>
</html>