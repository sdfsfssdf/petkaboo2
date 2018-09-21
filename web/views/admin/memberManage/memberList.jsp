<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.pkb.common.Paging, com.pkb.member.model.vo.*"%>
<%
	ArrayList<User> mlist = (ArrayList<User>) request.getAttribute("mlist");
	Paging pg = (Paging) request.getAttribute("pg");
	// 아래에서 사용하기 편하기 위해 선언 따로 선언하지 않고 pi의 getter메소드를 사용해도 상관없다...
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
.outer {
	float: left;
	width: 1000px;
	height: 800px;
	color: black;
	margin-left: 20px;
	margin-right: auto;
	margin-top: 20px;
}

.first-row {
	float: left;
	width: 100%;
}

.table1 {
	float: left;
	width: 1000px;
	height: 600px;
	margin-top: 20px;
	marign-left: auto;
	margin-right: auto;
	padding-left: 50px;
}

.head>th {
	background: #ddd;
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="leftMenu.jsp"%>
	<div class="outer">
		<div class="first-row">
			<div class="table1">
				<h2>회원 목록</h2>
				<p>회원의 정보를 확인 할 수 있고, 관리를 할 수 있습니다.</p>
				<h4 style="color:lightgray">인증상태는 이메일인증, 휴대폰인증, 펫시터인증 순서 입니다.</h4>
				<table id="memberListTable" class="table table-hover" align="center" name="memberListTable">
					<tr class="head">
						<th width="10%">회원번호</th>
						<th width="25%">ID</th>
						<th width="20%">이름</th>
						<th width="10%">등급</th>
						<th width="25%">인증</th>
						<th width="10%">상태</th>
					</tr>
					<%
						for (int i = 0; i < mlist.size(); i++) {
					%>
					<tr align="center">
						<input type="hidden" value="<%=mlist.get(i).getUser_no()%>">
						<td><%=mlist.get(i).getUser_no()%></td>
						<td><%=mlist.get(i).getEmail()%></td>
						<td><%=mlist.get(i).getUser_name()%></td>
						<td><%=mlist.get(i).getUser_grade()%></td>
					
						<%if(mlist.get(i).getUser_grade()==0){ %>
							<td>
								<img src="/pkb/images/adminImgs/check2.png">
								<img src="/pkb/images/adminImgs/check2.png">
								<img src="/pkb/images/adminImgs/check2.png">
							</td>
						<%} else if(mlist.get(i).getUser_grade() == 1){ %>
							<td>
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check2.png">
								<img src="/pkb/images/adminImgs/check2.png">
							</td>
						<%} else if (mlist.get(i).getUser_grade() == 2) {%>
							<td>
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check2.png">
							</td>
						<%} else { %>
							<td>
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check1.png">
							</td>
						<%} %>
						<%
							if (mlist.get(i).getUser_status() == 0) {
						%>
						<td><div style="border-radius:10px; background:lightgray; color:white">휴먼</div></td>
						<%
							} else if (mlist.get(i).getUser_status() == 1) {
						%>
						<td ><div style="border-radius:10px; background:green; color:white">정상</div></td>
						<%
							} else if (mlist.get(i).getUser_status() == 2) {
						%>
						<td><div style="border-radius:10px; background:red; color:white">탈퇴</div></td>
						<%
							} else {
						%>
						<td ><div style="border-radius:10px; background:orange; color:white">불량</div></td>
						<%
							}
						%>

					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		
		<script>
			$(function(){
				$('#memberListTable td').click(function(){
					var num = $(this).parent().children("input[type=hidden]").val();
					location.href = "<%=request.getContextPath()%>/selectOneMember.me?num="+num;
				})
			})
		</script>
		
		<br both="clear"><br>
		<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage - 1%>'"><</button>
				<%
					}
				%>

				<%
					for (int p = startPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>

				<button class="btn btn-default" disabled><%=p%></button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (currentPage >= maxPage) {
				%>
				<button class="btn btn-default" disabled>></button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=maxPage%>'">>></button>
			</div>
			<br>
			<div class="searchArea" align="center">
				<select id="searchCondition" name="searchCondition">
					<option>----</option>
					<option value="userId">아이디</option>
					<option value="phone">전화번호</option>
					<option value="grade">등급</option>
				</select> <input type="search">
				<button type="submit">검색하기</button>
			</div>
		</div>
</body>
</html>













