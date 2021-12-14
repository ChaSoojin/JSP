<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//권한이 필요한 수정/탈퇴 처리 담당
	
		int dir = Integer.parseInt(request.getParameter("num")); 
		String id = request.getParameter("id");
	
		System.out.println("dir: " +  dir);
		System.out.println("ID: " + id);
		
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		
		if(dir == UserDAO.REMOVE){
			if(dao.deleteUser(id,pw) == -1){
				response.sendRedirect("checkPass.jsp");
			}
			else{
				//탈퇴성공
				System.out.println("log: " +  session.getAttribute("id"));
				session.removeAttribute("id");
				response.sendRedirect("index.jsp");
			}			
		}
		else if(dir == UserDAO.UPDATE){
			if(dao.updateUser(id,pw)){
				System.out.println("업데이트 성공");	
			%>
			<script>
				alert("회원정보를 수정했습니다.");
				location.href = 'boardlist.jsp';
			</script>
			<%
			}
			else{
				System.out.println("업데이트 실패");
				String url = "checkPass.jsp?num=" + dir;
				response.sendRedirect(url);
			}
		}
	%>
</body>
</html>