<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,com.pkb.common.Paging, com.pkb.member.model.vo.*"%>
<%
	HashMap<String,Object> dmMap = (HashMap<String,Object>)request.getAttribute("dmMap");
	ArrayList<User> dlist = (ArrayList<User>)dmMap.get("mlist");
	ArrayList<HashMap<String,Object>> ndlist = (ArrayList<HashMap<String,Object>>)dmMap.get("nmlist");
	Paging pg = (Paging) request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%>    
    
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.outer{
		float:left;
		width:1000px;
		height:1200px;
		color:black;
		margin-left:20px;
		margin-right:auto;
		margin-top:20px;
	}
	.first-row{
		float:left;
		width:100%;
	}
	.table1{
		float:left;
		width:1000px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	
	.btnArea{
		float:left;
		width:1000px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.head > th{
		background: #ddd;
		text-align:center;
	}
	
	.leftWrapArea{
		height:1200px !important;
	}
</style>
</head>
<body>
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2>휴면계정 관리</h2>
	<p>휴면계정 처리와 휴면계정의 목록을 확인할 수 있습니다.</p>
	<hr>
		<h4 style="display:inline-block">휴면처리가 필요한 계정</h4>
		<%-- <img src="<%=request.getContextPath() %>/images/adminImgs/newIcon.png" width="30px" height="30px"> --%>
		<div style="display:inline-block; float:right;">
			<button class="btn 	btn-default" id="totalDiapauseBtn" name="totalDiapauseBtn">일괄처리</button> 
			<button class="btn btn-default" id="diapauseBtn" name="diapauseBtn">선택처리</button>
		</div>
		<hr style="clear:both;">
		
		<div class="" style="width:100%; height:300px; overflow:auto;">
	<%if (ndlist.size() != 0 ){%>
			<table id="needDiapauseMemberTable" class="table table-hover" align="center" name="memberListTable">
				<tr class="head">
					<th width="2%"><input type="checkbox" class="masterCheck"></th>
					<th width="10%">회원번호</th>
					<th width="25%">ID</th>
					<th width="20%">이름</th>
					<th width="12%">상태</th>
					<th width="30%">마지막 로그인</th>
				</tr>
				<%for(int i = 0 ; i < ndlist.size(); i ++){ %>
					<tr align="center">
						<input type="hidden" value="<%=((User)ndlist.get(i).get("user")).getUser_no()%>">
						<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectUserNo" class="childCheck" value="<%=((User)ndlist.get(i).get("user")).getUser_no()%>"></td>
						<td><%=((User)ndlist.get(i).get("user")).getUser_no() %></td>
						<td><%=((User)ndlist.get(i).get("user")).getEmail() %></td>
						<td><%=((User)ndlist.get(i).get("user")).getUser_name() %></td>
						<%
							if (((User)ndlist.get(i).get("user")).getUser_status() == 0) {
						%>
						<td><div align="center" style="border-radius:10px; background:lightgray; color:white">휴먼</div></td>
						<%
							} else if (((User)ndlist.get(i).get("user")).getUser_status() == 1) {
						%>
						<td ><div align="center" style="border-radius:10px; background:green; color:white">정상</div></td>
						<%
							} else if (((User)ndlist.get(i).get("user")).getUser_status() == 2) {
						%>
						<td><div align="center" style="border-radius:10px; background:red; color:white">탈퇴</div></td>
						<%
							} else {
						%>
						<td ><div align="center" style="border-radius:10px; background:orange; color:white">불량</div></td>
						<%
							}
						%>
						<td><%=((String)ndlist.get(i).get("loginDate")) %></td>
					</tr>
				<%} %>
			</table>
	<%} %>
		</div>
		<hr>
	<script>
		$(function(){
			$('.masterCheck').click(function(){
				$('.childCheck').prop('checked',this.checked);
			});
		});
	</script>
		<table id="DiapauseMemberTable" class="table table-hover" align="center" name="memberListTable">
			<tr class="head">
				<th width="20%">회원번호</th>
				<th width="30%">ID</th>
				<th width="20%">이름</th>
				<th width="20%">상태</th>
			</tr>
			<% for(int i = 0 ; i < dlist.size(); i++) { %>
				<tr align="center">
					<input type="hidden" value="<%=dlist.get(i).getUser_no()%>">
					<td><%=dlist.get(i).getUser_no() %></td>
					<td><%=dlist.get(i).getEmail() %></td>
					<td><%=dlist.get(i).getUser_name()%></td>
					<%
						if (dlist.get(i).getUser_status() == 0) {
					%>
						<td><div align="center" style="border-radius:10px; background:lightgray; color:white">휴면</div></td>
					<%
						} else if (dlist.get(i).getUser_status() == 1) {
					%>
						<td ><div align="center" style="border-radius:10px; background:green; color:white">정상</div></td>
					<%
						} else if (dlist.get(i).getUser_status() == 2) {
					%>
						<td><div align="center" style="border-radius:10px; background:red; color:white">탈퇴</div></td>
					<%
						} else {
					%>
						<td ><div align="center" style="border-radius:10px; background:orange; color:white">불량</div></td>
					<%
							}
					%>
				</tr>
			<%} %>
		</table>
		
	</div>
	
	<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/diapauseList.me?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/diapauseList.me?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/diapauseList.me?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/diapauseList.me?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/diapauseList.me?currentPage=<%=maxPage%>'">>></button>
			</div>
	
	<br>
	<div class="searchArea" align="center">
			<input type="search" class="form-control" style="width:40%; display:inline-block" placeholder="회원 아이디로 검색이 가능합니다.">
			<button class="form-control" type="submit" style="width:20%; display:inline-block">검색하기</button>
	</div>
	</div>
	
	<script>
			$(function(){
				$('#DiapauseMemberTable td').click(function(){
					var num = $(this).parent().children("input[type=hidden]").val();
					location.href = "<%=request.getContextPath()%>/selectOneMember.me?num="+num;
				})
	
				$('#needDiapauseMemberTable td').click(function(){
					var num = $(this).parent().children("input[type=hidden]").val();
					location.href = "<%=request.getContextPath()%>/selectOneMember.me?num="+num;
				})
				
				
				
				$("#diapauseBtn").click(function(){
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
							alert('휴면처리할 계정을 선택해 주세요.')
							return;
						}
						location.href="<%=request.getContextPath()%>/updateDiapause.me?selecUserNo="+rowid;
					})
				
					$('#totalDiapauseBtn').click(function(){
						var checkBoxs = document.getElementsByName("selectUserNo"); // 체크박스 객체
						var len = checkBoxs.length;
						var checkRow = "";
						var rowid = '';

						for(var i = 0; i < len ; i ++){
							checkRow = checkBoxs[i].value;
								if(i == 0){
									if(len == 0) {
										rowid += checkRow;
									} else {
										rowid += checkRow+",";
									}
								} else {
									if(i == len - 1){
										rowid += checkRow ;
									} else {
										rowid += checkRow + ",";
									}
								}
							checkRow = '';
						}	
						location.href="<%=request.getContextPath()%>/updateDiapause.me?selecUserNo="+rowid;
					})
			})
		</script>
	</div>
	<%@include file="../../common/footer.jsp" %>
</body>
</html>













