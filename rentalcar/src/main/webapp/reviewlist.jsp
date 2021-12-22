<%@page import="java.sql.Timestamp"%>
<%@page import="review.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
td {
	text-align: center;
}
</style>

<section class="breadcrumbs-custom bg-image"
	style="background-image: url(./resources/review.png);">
	<div class="breadcrumbs-custom-inner">
		<div class="breadcrumbs-custom-container container">
			<div class="breadcrumbs-custom-main">
				<h6 class="breadcrumbs-custom-subtitle title-decorated"
					style="color: white;">렌터카 리뷰</h6>
				<h1 class="breadcrumbs-custom-title" style="color: white;">렌터카
					리뷰</h1>
			</div>
		</div>
	</div>
</section>

<div class="container" style="margin-top: 30px;">
	<div class="row container-board-padding"
		style="justify-content: center;">
		<div class="col-md-12 table-responsive wow fadeIn row ">
			<table class="table table-hover table-job-positions text-center">
				<thead class="thead_top">
					<tr>
						<th>no</th>
						<th>제목</th>
						<th>작성자</th>
						<th>좋아요</th>
						<th>등록일자</th>
					</tr>
				</thead>
				<%
				ReviewDAO dao = ReviewDAO.getInstance();
				ArrayList<ReviewDTO> boardList = dao.getreviewList();
				String log = (String) session.getAttribute("id");

				for (ReviewDTO board : boardList) {
					System.out.println(board.toString());

					int no = board.getNo();
					String title = board.getTitle();
					String id = board.getId();
					int likes = board.getLikes();
					Timestamp enrolldate = board.getEnrolldate();
				%>

				<tr>
					<td><%=no%></td>
					<td style="cursor: pointer; color: blue"
						onclick="move(<%=no%>, '<%=log%>')"><%=title%></td>
					<td><%=id%></td>
					<td><%=likes%></td>
					<td><%=enrolldate%></td>
				</tr>

				<%
				}
				%>

				<a class="button button-lg button-primary button-winona" onclick="interceptor('<%=log %>')" href="reviewWrite.jsp">리뷰작성하기</a>
				
				<%
					if(boardList.isEmpty()){
				%>
					<tr>
						<th colspan="7">작성된 리뷰가 없습니다.</th>
					<tr>
					
				<% 
					}
				%>
			</table>
		</div>
	</div>
</div>

<script>
function interceptor(log){
	console.log("???");
	if (log.valueOf() !== "null") {
		location.href = `reviewWrite.jsp`;
	}
	else {
		alert("로그인 후 이용 가능합니다.");
		history.back();
	}
}
</script>

<script src="reviewlist.js" charset="utf-8"></script>
<%@ include file="footer.jsp"%>