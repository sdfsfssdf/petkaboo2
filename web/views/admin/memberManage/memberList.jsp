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

.form-control {
	display:inline-block !important;
	width:30% !important;
}

.btn {
	display:inline-block !important;
}

.search{
	display:inline-block;
	width:50%;
}

.search input{
	width:65% !important;
	margin-left:15px;
}
.search button {
	width:30% !important;
}

.searchTotal{
	display:inline-block;
	width:100%;
}

.searchTotal select{
	width:15% !important;
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
				<h5 style="color:lightgray">*인증상태는 이메일인증, 휴대폰인증, 펫시터인증 순서 입니다.</h5>
				<table id="memberListTable" class="table table-hover" align="center" name="memberListTable">
					<tr class="head">
						<th width="2%"><input type="checkbox" class="masterCheck"></th>
						<th width="8%">회원번호</th>
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
						<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectUserNo" class="childCheck" value="<%=mlist.get(i).getUser_no()%>"></td>
						<td><%=mlist.get(i).getUser_no()%></td>
						<td><%=mlist.get(i).getEmail()%></td>
						<td><%=mlist.get(i).getUser_name()%></td>
						<%if(mlist.get(i).getUser_grade()==0){ %>
							<td>미인증 회원</td>
						<%} else if(mlist.get(i).getUser_grade() == 1){ %>
							<td>기본 회원</td>
						<%} else if (mlist.get(i).getUser_grade() == 2) {%>
							<td>의뢰 가능 회원</td>
						<%} else { %>
							<td>펫시터</td>
						<%} %>
					
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
			<div class="searchArea searchTotal" align="center" width="100%">
				<select class="form-control" id="searchCondition" name="searchCondition">
					<option value="userNo">회원번호</option>
					<option value="userId">아이디</option>
					<option value="status">상태</option>
					<option value="grade">등급</option>
				</select>
				<div class="userNoSearch search"> 
				 	<input class="form-control" type="search">
				 	<button name="noSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				 <div class="userNameSearch" style="display:none;">
				 	<input class="form-control" type="search">
				 	<button name="nameSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				 
				 <div class="userStausSearch search" style="display:none;">
				 	<select class="form-control" name="userStatus">
				 		<option value="dia">휴면</option>
				 		<option value="nomal">정상</option>
				 		<option value="leave">탈퇴</option>
				 		<option value="faulty">불량</option>
				 	</select>
				 	<button name="statusSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				 
				 <div class="userGradeSearch search" style="display:none;">
				 	<select class="form-control" name="userGrade">
				 		<option value="nonCer">미인증 회원</option>
				 		<option value="nomal">기본 회원</option>
				 		<option value="cer">의뢰 가능 회원</option>
				 		<option value="pet">펫시터</option>
				 	</select>
				 	<button name="userSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				
			
				<button type="button" id="delete" class="btn btn-danger" name="delete" style="display:inline-block">회원 탈퇴</button>
				<button type="button" id="lock" class="btn btn-warning" name="delete" style="display:inline-block">회원 제재</button>
			</div>
			
			<script>
				$(function(){
					$('.masterCheck').click(function(){
						$('.childCheck').prop('checked',this.checked);
					});
				});
			</script>
			<script type="text/javascript">
				$(function(){
					$('#searchCondition').change(function(){
						if($('#searchCondition').val() == 'userNo'){
							$('.userNoSearch').show();
							$('.userNameSearch').hide();
							$('.userStausSearch').hide();
							$('.userGradeSearch').hide();
							
						} else if($('#searchCondition').val() == 'userId'){
							$('.userNoSearch').hide();
							$('.userNameSearch').show();
							$('.userStausSearch').hide();
							$('.userGradeSearch').hide();
						} else if($('#searchCondition').val() == 'status'){
							$('.userNoSearch').hide();
							$('.userNameSearch').hide();
							$('.userStausSearch').show();
							$('.userGradeSearch').hide();
						} else {
							$('.userNoSearch').hide();
							$('.userNameSearch').hide();
							$('.userStausSearch').hide();
							$('.userGradeSearch').show();
						}
					})
					
					$("#delete").click(function(){
						var checkBoxs = document.getElementsByName("selectUserNo"); // 체크박스 객체
						var len = checkBoxs.length;
						var checkRow = "";
						var checkCnt = 0;
						var checkLast = "";
						var rowid = '';
						var values = "";
						var cnt = 0;
						
						for(var i = 0; i < len ; i ++){
							if(checkBoxs[i].checked == true){
								checkCnt++;
								checkLast = i;
							}
						}
						
						for(var i = 0; i < len ; i ++){
							if(checkBoxs[i].checked == true){
								checkRow = checkBoxs[i].value;
								
								if(checkCnt == 1){
									rowid += checkRow;
								} else {
									if(i == checkLast){
										rowid += checkRow ;
									} else {
										rowid += checkRow + ",";
									}
								}
								
								cnt ++;
								checkRow = '';
							}	
						}
						
						if(rowid === ''){
							alert('탈퇴 처리할 회원을 선택해 주세요.')
							return;
						}
						location.href="<%=request.getContextPath()%>/deleteMember.me?selecUserNo="+rowid;
					})
					
					
					$("#lock").click(function(){
						var checkBoxs = document.getElementsByName("selectUserNo"); // 체크박스 객체
						var len = checkBoxs.length;
						var checkRow = "";
						var checkCnt = 0;
						var checkLast = "";
						var rowid = '';
						var values = "";
						var cnt = 0;
						
						for(var i = 0; i < len ; i ++){
							if(checkBoxs[i].checked == true){
								checkCnt++;
								checkLast = i;
							}
						}
						
						for(var i = 0; i < len ; i ++){
							if(checkBoxs[i].checked == true){
								checkRow = checkBoxs[i].value;
								
								if(checkCnt == 1){
									rowid += checkRow;
								} else {
									if(i == checkLast){
										rowid += checkRow ;
									} else {
										rowid += checkRow + ",";
									}
								}
								
								cnt ++;
								checkRow = '';
							}	
						}
						
						if(rowid === ''){
							alert('제재 처리할 회원을 선택해 주세요.')
							return;
						}
						location.href="<%=request.getContextPath()%>/lockMember.me?selecUserNo="+rowid;
					})
					
				})
			</script>
		</div>
</body>
</html>













