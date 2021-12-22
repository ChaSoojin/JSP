<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        span{
            white-space: pre;
        }
    </style>
    <title>GREEN</title>
</head>
<body>
	<h1>Index Page</h1>
	<%
	UserDAO dao = UserDAO.getInstance();
		ArrayList<UserDTO> datas = dao.getUsers();
		
		for(int i = 0; i < datas.size(); i++){
			UserDTO user = datas.get(i);
			System.out.println(user.toString());
		}
	%>
   
   <input type="button" value="login" onclick="location.href='login.jsp'">
   <input type="button" value="join" onclick="location.href='validate.jsp'">
</body>
</html>