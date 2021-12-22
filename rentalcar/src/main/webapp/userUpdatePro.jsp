<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user update pro</title>
</head>
<body>
	<%		
	request.setCharacterEncoding("UTF-8");
	int dir = Integer.parseInt(request.getParameter("num")); 
	String id = request.getParameter("id");

	System.out.println("dir: " +  dir);
	System.out.println("ID: " + id);
	
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	
	if(dir == MemberDAO.REMOVE){
		if(dao.deleteMember(id,pw) == -1){
	%>
	
	<script>
		alert("패스워드를 확인해주세요.");
		location.href='mypage.jsp';
	</script>
				
	<% 
		}
		else{
			//탈퇴성공
			System.out.println("log: " +  session.getAttribute("id"));
			session.removeAttribute("id");
			
	%>
	<script>
		alert("탈퇴가 정상적으로 처리 되었습니다.");
		location.href='main.jsp';
	</script>
	
	<%
		}			
	}
	else if(dir == MemberDAO.UPDATE){
		String year = request.getParameter("year");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp enrollDate = new Timestamp(time);	
		
		int curyear = enrollDate.getYear() + 1900;
		int age = curyear - Integer.parseInt(year) + 1;
		
		//id, pw, name, email,tel, age
		if(dao.updateMember(id,pw,name,email,tel,age)){
			System.out.println("업데이트 성공");
	%>
			<script>
				alert("회원정보를 수정했습니다.");
				location.href = 'mypage.jsp';
			</script>
	<%
			}
			else{
				System.out.println("업데이트 실패");
				String url = "userUpdate.jsp?num=" + dir;
				response.sendRedirect(url);
			}
		}
	%>
</body>
</html>