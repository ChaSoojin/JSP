<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="review.ReviewDTO"%>
<%@page import="rentalcar.ReserveDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalcar.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
#cancelbtn{
	cursor:pointer;
}
</style>
<%
	String log = (String)session.getAttribute("id");
	if (log != null) {
%>
<section class="breadcrumbs-custom bg-image" style="background-image: url(./resources/car2.png);">
	<div class="breadcrumbs-custom-inner">
		<div class="breadcrumbs-custom-container container">
			<div class="breadcrumbs-custom-main">
				<h6 class="breadcrumbs-custom-subtitle title-decorated">마이페이지</h6>
				<h1 class="breadcrumbs-custom-title">마이페이지</h1>
			</div>
		</div>
	</div>
</section>

<section class="section section-lg">
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-9 col-lg-6 col-xl-5">
				<h6>MyPage</h6>
				
				<!-- Bootstrap tabs -->
				<div class="tabs-custom tabs-horizontal tabs-line" id="tabs-1">
					<!-- Nav tabs-->
					<ul class="nav nav-tabs">
						<li class="nav-item active" role="presentation">
						<a class="nav-link active" href="#tabs-1-1" data-toggle="tab"
							id="nav_first">회원정보 수정</a></li>
							
						<li class="nav-item" role="presentation"><a class="nav-link"
							href="#tabs-1-2" data-toggle="tab">회원 탈퇴하기</a></li>
							
						<li class="nav-item" role="presentation"><a class="nav-link"
							href="#tabs-1-3" data-toggle="tab">예약 확인</a></li>
							
						<li class="nav-item" role="presentation"><a class="nav-link" href="#tabs-1-4" data-toggle="tab"> 
						내가 쓴 리뷰 </a></li>
					</ul>
					<br> <br>
					<div class="tab-content">
						<div class="tab-pane fade show active in" id="tabs-1-1">
							<%
							//id, pw, name, email, tel, age
							String id = (String)session.getAttribute("id");
						
							MemberDAO dao = MemberDAO.getInstance();
							ArrayList<MemberDTO> members = dao.getMembers();
							int idx = -1;
							
							for(int i = 0; i < members.size(); i++){
								if(members.get(i).getId().equals(id)){
									idx = i;
								}
							}
							
							String name = members.get(idx).getName();
							String email = members.get(idx).getEmail();
							String tel = members.get(idx).getTel();
							int age = members.get(idx).getAge();
						%>
							<form method="post" action="userUpdatePro.jsp?num=1">
								<span>ID:&#9;</span><input type='text' name='id' value="<%=id %>" readonly required><br><br>
						        <span>&#9;PW:&#9;</span><input type='password' name='pw' required><br><br>
						        <span>&#9;이름:&#9;</span><input type='text' name='name' value="<%=name %>" required><br><br>
						        <span>&#9;e-mail:&#9;</span><input type='text' name='email' value="<%=email %>" required><br><br>
						        <span>&#9;Tel:&#9;</span><input type='text' name='tel' value="<%=tel %>" required><br><br>
						        
						        <span>생년월일:</span><br>
						        <input type="text" maxlength="4" placeholder="년(4자)" name="year" id="year" required><br>
						        <select name="mon" id="mon" required>
						            <option value="o1" id="o1">월</option>
						            <option value="o2">1</option>
						            <option value="o3">2</option>
						            <option value="o4">3</option>
						            <option value="o5">4</option>
						            <option value="o6">5</option>
						            <option value="o7">6</option>
						            <option value="o8">7</option>
						            <option value="o9">8</option>
						            <option value="o10">9</option>
						            <option value="o11">10</option>
						            <option value="o12">11</option>
						            <option value="o13">12</option>
						        </select>
						        <br>
						        <input type="text" maxlength="2" placeholder="일" id="day" name="day" required><br>
							
						        <input type="hidden" id="num" name="num" value="<%=request.getParameter("num")%>"><br>
						        <input type="submit" value="수정하기">
							</form>
							
							<br>
						</div>
						<div class="tab-pane fade" id="tabs-1-2">
							<form method="post" action="userUpdatePro.jsp?num=0">
								<span>ID:&#9;</span><input type='text' name='id' value="<%=id %>" readonly required><br><br>
						        <span>&#9;PW:&#9;</span><input type='password' name='pw' required><br><br>
						        <input type="hidden" id="num" name="num" value="<%=request.getParameter("num")%>"><br>
						        <input type="submit" value="탈퇴하기">
							</form>
						</div>

						<!-- 내 예약 -->
						<div class="tab-pane fade" id="tabs-1-3">
							<table class="table table-hover table-job-positions text-center">
								<tr>
									<th>렌트카번호</th>
									<th>예약자</th>
									<th>대수</th>
									<th>일수</th>
									<th>예약날짜</th>
									<th>네비사용여부</th>
									<th>사용좌석</th>
									<th>예약취소</th>
								</tr>
								<%
									ReserveDAO rdao = ReserveDAO.getInstance();
									ArrayList<ReserveDTO> reserveList = rdao.getReservelist(log);
									for (ReserveDTO reserve : reserveList) {
										//reserve_seq no id cnt days r_day use_navi use_seat
										int reserve_seq = reserve.getReserve_seq();
										int no = reserve.getNo();
										String myid = reserve.getId();
										int cnt = reserve.getCnt();
										int days = reserve.getDays();
										String r_day = reserve.getR_day();
										int use_navi = reserve.getUse_navi();
										int use_seat = reserve.getUse_seat();
								%>
									<tr>
										<td style="cursor: pointer; color: blue" onclick="location.href='rentalcarView.jsp?no=<%=no%>'"><%=no%></td>
										<td><%=myid%></td>
										<td><%=cnt%></td>
										<td><%=days%></td>
										<td><%=r_day%></td>
									<%
										if(use_navi == 1){
									%>
										<td>O</td>			
									<%		
										}else if(use_navi == 0){
									%>
									
										<td>X</td>
									<%
										}
									%>
										<td><%=use_seat %></td>
										<td><button id="cancelbtn" onclick="location.href='rentalcarReserveDelPro.jsp?reserve_seq=<%=reserve_seq%>'">예약취소</button></td>
									</tr>
									<%
									}
									%>
							</table>
						</div>

						<!-- 내가 쓴 리뷰 -->
						<div class="tab-pane fade" id="tabs-1-4">
							<table class="table table-hover table-job-positions text-center">
								<thead>
									<tr>
										<th>no</th>
										<th>제목</th>
										<th>작성자</th>
										<th>좋아요</th>
										<th>등록일자</th>
									</tr>
								</thead>
								<tbody>
									<%
									ReviewDAO reviewdao = ReviewDAO.getInstance();
									ArrayList<ReviewDTO> boardList = reviewdao.getreviewList();
									
									for (ReviewDTO board : boardList) {
										System.out.println(board.toString());
										
										int no = board.getNo();
										String title = board.getTitle();
										String bid = board.getId();
										int likes = board.getLikes();
										Timestamp enrolldate = board.getEnrolldate();
										
										if(bid.equals(log)){
									%>
										<tr>
											<td><%=no%></td>
											<td style="cursor: pointer; color: blue"
												onclick="move(<%=no%>, '<%=log%>')"><%=title%></td>
											<td><%=bid%></td>
											<td><%=likes%></td>
											<td><%=enrolldate%></td>
										</tr>
									<%
										}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%
	}else{
%>
	<script>
		alert("로그인 후 이용 가능합니다.");
		history.back();
	</script>

<%	
	}
%>
<script src="reviewlist.js" charset="utf-8"></script>
<%@ include file="footer.jsp"%>