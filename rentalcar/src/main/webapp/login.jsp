<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<style>
span {
	white-space: pre;
}

body {
	text-align: center;
}

h1 {
	font-size: 30px;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: green;
}
</style>
<title>JOIN PAGE</title>
</head>
<section class="breadcrumbs-custom bg-image"
	style="background-image: url(./resources/car2.png);">
	<div class="breadcrumbs-custom-inner">
		<div class="breadcrumbs-custom-container container">
			<div class="breadcrumbs-custom-main">
				<h6 class="breadcrumbs-custom-subtitle title-decorated"
					style="color: white;">로그인</h6>
				<h1 class="breadcrumbs-custom-title" style="color: white;">로그인</h1>
			</div>
		</div>
	</div>
</section>

<div style="text-align: center; margin: 50px 0px;">
	<div
		style="display: inline-block; border-bottom: 1px solid black; padding-bottom: 30px; margin-bottom: 20px;">
		<form method='post' action="loginPro.jsp">
			<%-- input 태그의 name과 value가 파라미터로 전달됨 --%>
			<span>id:&#9;</span><input type='text' name='id'
				style="width: 300px;" required><br>
			<br> <span>pw:&#9;</span><input type='password' name='pw'
				style="width: 300px;" required><br>
			<br> <input type="submit" value="로그인"
				style="text-align: center; width: 100px;">
		</form>
		<br>
		<br>

	</div>
</div>
</html>

<%@ include file="footer.jsp"%>