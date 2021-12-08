<%--일반 html이 아니라 자바언어로 구성 되어있는 jsp파일임을 알려줌 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	hello world
	<%
		//JSP : Java Server Page
		//ㄴ> 서버와 통신할 수 있게끔 만들어주는 페이지(벡앤드 로직처리)
		//ㄴ> html 문서 안에 java 문장(코드)을 작성하는 것
		
		//1)지시자 태그 <%@ % > : 브라우저에게 문서의 정보를 전달
		//2)주석 태그 <%-- --% >
		//3)스크립틀릿 <% % > : 태그 안에 자바 문장 작성 가능
		//4)표현식 <%= % >
		
		//스크립틀릿(scriptlet) 태그 안에 자바 문장 작성 가능
		int num = 10;
		System.out.println(num);
		
		num = 1;
		while(num <= 10){
		%>
		
		<h1><%= num %></h1>
		
		<%
			num++;
		}
		
		//구구단 2~9단까지 웹페이지에 출력
		for(int i = 2; i < 10; i++){ %>
			<h1>[<%=i %>단]</h1>
			<% 
			for(int j = 1; j < 10; j++){
			%>
			<h1><%=i %> X <%=j %> = <%=i*j %></h1>
		<%
			}
		}
		%>
</body>
</html>