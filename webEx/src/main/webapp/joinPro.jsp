<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- pro : process --%>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String year = request.getParameter("year");
		String phone = request.getParameter("phone");
		
	%>
	
	<%
		if(!pw.equals(pw2)){
	%>
	<script>
	alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요!');
	history.back();
	</script>
	
	<%
		}
		else if(id.equals(pw)){
	%>
	<script>
	alert('아이디와 비밀번호를 동일하게 설정할 수 없습니다.');
	history.back();
	</script>
	
	<%
		}
		else if(Integer.parseInt(year) > 2021){
	%>
	<script>
	alert('생년월일을 다시 확인해주세요.');
	history.back();
	</script>
	
	<%
		}
		else if(!phone.substring(0,3).equals("010")){
	%>
	<script>
	alert('올바른 형식의 핸드폰 번호를 입력해주세요.');
	history.back();
	</script>
	
	<%		
		}
		else{
	%>
	<script>
	alert('회원가입이 완료되었습니다.');
	location.href="login.jsp";
	</script>
	
	<%		
		} 
	%>
</body>
</html>