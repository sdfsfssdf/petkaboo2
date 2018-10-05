<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.pkb.member.model.vo.*, com.pkb.payment.model.vo.*,com.pkb.board.model.vo.*"%>
    
<%
	HashMap<String,Object> totalInfo = (HashMap<String,Object>)request.getAttribute("totalInfo");
	String ip = (String)request.getAttribute("ip");
	ArrayList<HashMap<String,String>> ilist = (ArrayList<HashMap<String,String>>)totalInfo.get("incomList");
	User loginUser = (User)session.getAttribute("loginUser");
	ArrayList<HashMap<String,Object>> ndlist = (ArrayList<HashMap<String,Object>>)totalInfo.get("needMemberList");
	ArrayList<Board> rList = (ArrayList<Board>) totalInfo.get("recentlyList");
	ArrayList<Board> sList = (ArrayList<Board>) totalInfo.get("sanctinsExpirationList");
	ArrayList<Payment> todayList = (ArrayList<Payment>)totalInfo.get("plist");
%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<script type="text/javascript">
	function realtimeClock() {
		document.rtcForm.rtcInput.value = getTimeStamp();
		setTimeout("realtimeClock()", 1000);
	}
	function getTimeStamp() { // 24시간제
		var d = new Date();

		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);
		
		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script type="text/javascript" src="https://api.ipify.org?format=json"></script>
<script type="application/javascript">
$(function(){
	ip = "";

  function getIP(json) {
   	ip = json.ip;	
  }
  
  $('ipArea').text(ip);
  console.log(ip)
})
</script>

<script type="application/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
<html>
<head>
<style>
.outer{
		float:left;
		width:75%;
		height:835px;
		color:black;
		margin-left:50px;
		margin-right:50px;
		margin-top:50px;
	}
	.first-row{
		float:left;
		width:100%;
	}
	.second-row{
		float:left;
		width:100%;
	}
	.third-row{
		float:left;
		width:100%;
	}
	.table1{
		float:left;
		width:460px;
		height:250px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.table2{
		float:left;
		width:510px;
		height:250px;
		margin-top:20px;
		margin-left:25px;
		padding-left:50px;
		margin-right:auto;
	}
	.table3{
		height:250px;
		padding-left:50px;
		margin-right:auto;
	}
	.table4{
		height:333px;
		padding-left:50px;
		margin-right:auto;
	}
	.head > th{
		background: #ddd;
		text-align:center;
	}
.vertical_line{
		width:1px;
		border:0.5px solid lightgray;
		height:300px;
		display:inline-block;
		margin-left:20px;
		margin-right:20px;
	}
.headerDiv{
		background-color:#ffffff;
		margin-left:0px;
		margin-top:0px;
		margin-right:0px;
		margin-bottom:0px;
	}
	.admin_header{
		position:relative;
		overflow:hidden;
		width:100%;
		min-width:800px;
		background-color:#353944;
		border-top: 3px solid #228cde;
	}
	.admin_header.top_01{
		position:relative;
		overflow:hidden;
		height:54px;
		width:100%;
		border-bottom:1px solid #535760;
	}
	.top_01 h1 a:link, .top_01 h1 a:visited{
		color: #54a6f2;
		font-family: PT Sans;
		font_size:25px;
		line-height:2;
		text-decoration:none;
	}
	.top_01 h1{
		text-decoration:none;
		position :relative;
		overflow: hidden;
		float:left;
		padding: 15px 0 0 15px;
	}
	.top_01 ul{
		position: relative;
		overflow: hidden;
		float : right;
		padding : 16px 15px 0 0;
		text-decoration:none;
	}
	.top_01 li{
		float: left;
		padding : 8px 0 0 10px;
		text-decoration:none;
	}
	.zzim_area{
		position:relative;
		width:100%;
		z-index:320;
	}
	.topmenu{
		position:relative;
		background-color: #353944;
	}
	.top_02{
		position:relative;
		overflow:hidden;
		width:100%;
		min-width:600px;
		height:42px;
	}
	.top_02 li{
		float:left;
		text-decoration:none;
	}
	.top_02 li:hover{
		float:left;
		text-decoration:none;
		font-weight:bold;
		color:white;
		background:#47434C;
	}
	.top_02 li a:link, .top_02 li a:visited{
		display:block;
		padding: 0 18px;
		line-height:40px;
		height:42px;
		color: #d6d7d9;
		font-size:14px;
		letter-spacing:-0.7pt;
		text-decoration:none;
	}

	.search input{
		height:25px;
		width:200px;
	}
	a:link{
		text-decoration: none;
	}
	
	ol,ul,li,dt,dl,dd{
		list-style: none;
		margin:0;
		padding:0;
	}
	h1,h2,h3,h4,h5{
		margin:0;
	}
	.row.content {
		height: 1500px;
   	    min-width:600px;
    }
	.sidenav {
	    background-color: #f1f1f1;
	    width: 100%;
	    min-width:600px;
	}
	.pull-right{
		float:right;
	}
@media screen and (max-width: 767px) {
   .sidenav {
	    height: auto;
	    padding: 15px;
	    min-width:600px;
    }
   .row.content {
  		height: auto;
 	    min-width:600px;
 	} 
}

.wrapper {
	display: grid;
	grid-auto-rows: minmax(70px, auto);
	width: 250px;
	text-align: center;
	float: left;
}

.wrapper {
	border: 2px soild #ddd;
}

.wrapper>div {
	border-bottom: 1px solid #bbb;
	border-right: 2px solid #353944;
	background-color: #fff;
	padding: 1em;
}

.wrapper2 {
	display: grid;
	grid-template-colums: repeat(3, 1fr);
	grid-auto-rows: minmax(70px, auto);
	width: 250px;
}

.wrapper2>div {
	text-align: center;
	border-right: 2px solid #353944;
}

.one {
	background: #ddd !important;
	color: cornflowerblue;
}

.six {
	background: #ddd !important;
	color: cornflowerblue;
}

#rtcInput {
	border: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="headerDiv">
<div class="admin_header">
	<div class="top_01">
		<h1><a href="">펫카부<span>관리자</span></a></h1>
		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/index.jsp">내 홈페이지</a>
			</li>
			<li>
				<a href="">관리자메인</a>
			</li>
			<li class="logout"><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
		</ul>
	</div>
</div>
<div class="zzim_area" id="zzim_area">
	<div class="topmenu">
		<div class="top_02">
			<ul class="leftMenu">
				<li><a class="menu" href="<%=request.getContextPath()%>/caaList.caa">기본설정</a></li>
				<li><a class="menu" href="<%=request.getContextPath()%>/selectList.me">회원관리</a></li>
				<li><a class="menu" href="<%=request.getContextPath()%>/selectMain.pe">결제관리</a></li>
				<li><a class="menu" href="<%=request.getContextPath()%>/selectMainInfo.re">거래관리</a></li>
				<li><a class="menu" href="<%=request.getContextPath()%>/statistics.me">통계/현황</a></li>
				<li id="search-bar" class="pull-right" >
					<form class="navbar-form navbar-left" role="search" action="<%=request.getContextPath()%>/searchMember.me" mehtod="get">
						<div class="form-group">
							<input type="hidden" value="userNo" name="status">
							<input type="text" class="form-control" placeholder="회원번호로 빠른 회원 검색" name="value">
						</div>
						<button type="submit" class ="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
					</form>
				</li>
			</ul>
		</div>
	</div>
	<% if( loginUser == null || loginUser.getUser_type() == 1){ %>
		<script>
			$(function(){
				location.href="<%=request.getContextPath() %>/views/common/errorPage.jsp";
			})
		</script>
		
	<%} %>
</div>
</div>
	
		<div class="wrapper">
		<div class="one">
			<h3>관리자메인</h3>
		</div>
		<div class="two">
			현재시간<br>
			<body onload="realtimeClock()">
				<form name="rtcForm">
					<input type="text" name="rtcInput" size="15" readonly="readonly" />
				</form>
		</div>
		<div class="three">최종로그인<p><%=(String)totalInfo.get("loginDate") %></p></div>
		<div class="four">접속IP <p name="ipArea" id="ipArea"><%=ip %></p></div>
		<div class="six">
			<h3>오늘의 펫카부</h3>
		</div>
		<div class="seven">사이버 머니 충전 
		<%if (((HashMap<String,Integer>)totalInfo.get("todayInfo")) != null) {%>
		<p><%=((HashMap<String,Integer>)totalInfo.get("todayInfo")).get("count") %> 건</p></div>
		<%} else { %>
		<p> - / - </p>
		<%} %>
		<div class="seven">사이버머니  총 금액
			<p><%=((HashMap<String,Integer>)totalInfo.get("todayInfo")).get("totalAmout") %> 원</p>
		</div>
		<div class="eight">거래건
		
		<% if ( ilist == null || ilist.size() == 0){ %>
		<p>0 건</p>
		
		<%} else { 
				int cnt = 0;
				for(int i = 0 ; i < ilist.size() ; i++ ) {
					cnt += Integer.parseInt(ilist.get(i).get("count"));
				%>
					
		<% } %>	
		<p><%=cnt %> 건</p>		
		<%} %>
		</div>
		<div class="seven">거래 총 금액
		<%
		if ( ilist == null || ilist.size() == 0){ %>
		<p>0 원</p>
		
		<%} else { 
				int cnt2 = 0;
				for(int i = 0 ; i < ilist.size() ; i++ ) {
					cnt2 += Integer.parseInt(ilist.get(i).get("totalIncome"));
				%>
					
		<% } %>	
		<p><%=cnt2 %> 원</p>		
		<%} %>
		</div>
		
		<div class="nine">총매출액
		<%
		if ( ilist == null || ilist.size() == 0){ %>
		<p>0 원</p>
		
		<%} else { 
				double cnt3 = 0;
				for(int i = 0 ; i < ilist.size() ; i++ ) {
					cnt3 += ((Double.parseDouble(ilist.get(i).get("totalIncome")))*(Double.parseDouble(ilist.get(i).get("rate")) * 0.01));
				%>
					
		<% } %>	
		<p><%=cnt3 %> 원</p>		
		<%} %>
		
		</div>
		<div class="ten">신규회원
		<p><%=totalInfo.get("newMemberCount") %> 명</p>
		</div>
		<div class="eleven">펫시터수
		<p><%=totalInfo.get("petsitterCount") %> 명</p>
		</div>
		<div class="twelve">총회원수
		<p><%=totalInfo.get("memberCount") %> 명</p>
		</div>
	</div>
	<div class="outer">
	<div class="first-row">
	<div >
	
	
	<h3 style="display:inline-block">휴면처리가 필요한 계정</h3>
		<%-- <img src="<%=request.getContextPath() %>/images/adminImgs/newIcon.png" width="30px" height="30px"> --%>
		<div style="display:inline-block; float:right;">
			<button class="btn 	btn-default" id="totalDiapauseBtn" name="totalDiapauseBtn">일괄처리</button> 
			<button class="btn btn-default" id="diapauseBtn" name="diapauseBtn">선택처리</button>
		</div>
		<hr style="clear:both;">
		
		<div class="" style="width:100%; height:200px; overflow:auto;">
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
	
	
	
	
	
		<div style="display:inline-block; width:47%; height:300px; overflow:auto" >
		<h3 style="display:inline-block">최근 탈퇴/제재 : <%if(rList != null ){%> <%=rList.size()%> <%} %> 명</h3>
		<table class="table table-hover" align="center" id="recentlyMemberListTable" >
			<tr class="head">
				<th>회원번호</th>
				<th>아이디</th>
				<th>일자</th>
				<th>구분</th>
			</tr>
			<%if(rList != null){
			for(int i = 0; i < rList.size();i ++) {%>
				<tr align="center">
					<input type="hidden" value="<%=rList.get(i).getArticle_no() %>">
					<td><%=rList.get(i).getArticle_title().substring(1,rList.get(i).getArticle_title().indexOf("/")) %></td>
					<td><%=rList.get(i).getArticle_title().substring(rList.get(i).getArticle_title().indexOf("/")+1,rList.get(i).getArticle_title().lastIndexOf(")")) %></td>
					<td><%=rList.get(i).getArticle_date() %></td>
					<td>
						<%if(rList.get(i).getArticle_type().equals("D")){ %>
							<div style="border-radius:10px; background:red; color:white" align="center">탈퇴</div>
						<%} else {%>
							<div style="border-radius:10px; background:orange; color:white" align="center">제재</div>
						<%} %>
					</td>
				</tr>
			<%} 
			} else { %>
				<tr>
					<td colspan="4">이력이 존재하지 않습니다.</td>
				</tr>
			<%} %>
		</table>
	</div>
	<div class="vertical_line"></div>
	<div style="display:inline-block; width:47%;height:300px; overflow:auto">
		<h3 style="display:inline-block">제재 만료 처리</h3>
		<div style="float:right">
			<button class="btn btn-default" id="totalProcessBtn" name="totalProcessBtn">일괄처리</button>
			<button class="btn btn-default" id="selectProcessBtn" name="selectProcessBtn">선택처리</button>
		</div>
		<table class="table table-hover" align="center" >
			<tr class="head">
				<th><input type="checkbox" class="masterCheck2"></th>
				<th>회원번호</th>
				<th>아이디</th>
				<th>정지일</th>
				<th>만료일</th>
			</tr>
			<%if(sList != null) { %>
				<%for(int i = 0; i < sList.size();i ++) {%>
					<tr align="center">
						<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectUserNo1" class="childCheck2" value="<%=sList.get(i).getArticle_title().substring(1,sList.get(i).getArticle_title().indexOf("/")) %>/<%=sList.get(i).getArticle_no()%>"></td>
						<td><%=sList.get(i).getArticle_title().substring(1,sList.get(i).getArticle_title().indexOf("/")) %></td>
						<td><%=sList.get(i).getArticle_title().substring(sList.get(i).getArticle_title().indexOf("/")+1,sList.get(i).getArticle_title().lastIndexOf(")")) %></td>
						<td><%=sList.get(i).getArticle_date()%></td>
						<td><%=sList.get(i).getArticle_modify_date() %></td>
					</tr>
				<%} %>
			<%} else {%>
				<tr>
					<td colspan="5">이력이 존재하지 않습니다.</td>
				</tr>
			<%} %>
		</table>
	</div>
	<script>
		$(function(){
			$('.masterCheck2').click(function(){
				$('.childCheck2').prop('checked',this.checked);
			});
			
			$("#selectProcessBtn").click(function(){
				var checkBoxs = document.getElementsByName("selectUserNo1"); // 체크박스 객체
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
					alert('제재를 만료시킬 회원을 선택해 주세요')
					return;
				}
				location.href="<%=request.getContextPath()%>/updateSantions.me?selecUserNo="+rowid;
			})
		
			$('#totalProcessBtn').click(function(){
				var checkBoxs = document.getElementsByName("selectUserNo1"); // 체크박스 객체
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
							if(i == len -1){
								rowid += checkRow ;
							} else {
								rowid += checkRow + ",";
							}
						}
					checkRow = '';
				}	
				location.href="<%=request.getContextPath()%>/updateSantions.me?selecUserNo="+rowid;
			})
		});
	</script>
	
	<hr>
	
	
	
	
	<div style="display: inline-block; width: 100%; height: 300px; overflow: auto">
					<h4 style="display:inline-block">오늘의 입금 신청 내역  : <%=todayList.size() %> 건</h4>
					<div style="float:right"><button class="btn btn-default" id="totalTodayBtn">일괄처리</button> <button id="selectTodayBtn" class="btn btn-default">선택처리</button></div>
					<table  class="table table-hover">
						<tr class="head">
						<th width="2%"><input type="checkbox" class="masterCheckToday"></th>
							<th width="8%">번호</th>
							<th width="15%">ID</th>
							<th width="15%">금액</th>
							<th width="15%">결제일</th>
							<th width="10%">결제수단</th>
							<th width="25%">입금 계좌번호</th>
							<th width="10%">구분</th>
						</tr>
						<%for ( int i = 0; i <todayList.size(); i ++){ %>
							<tr align="center">
								<input type="hidden" value="<%=todayList.get(i).getPay_no()%>">
								<%if(todayList.get(i).getPayment_cash_status()==0) {%>
									<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectToday" class="childCheck" value="<%=todayList.get(i).getPay_no()%>/<%=todayList.get(i).getUser_no()%>/<%=todayList.get(i).getPay_amount()%>"></td>
								<%} else {%>
									<td>-</td>
								<%} %>
								<td><%=todayList.get(i).getPay_no() %></td>
								<td><%=todayList.get(i).getEmail() %></td>
								<td><%=todayList.get(i).getPay_amount() %></td>
								<td><%=todayList.get(i).getPay_date() %></td>
								<td><%if(todayList.get(i).getPayment_type() == 0) {%>
							<img src="images/adminImgs/creditCard.png">
						<%} else { %>
							<img src="images/adminImgs/passbook.png">
						<%} %>
					</td>
						<td>
					
			
							<%=todayList.get(i).getAccount_no() %>
						
					</td>
						<%if(todayList.get(i).getPayment_cash_status() ==0 ){ %>
							<td>
							<div style="background:gray; color:white ; border-radius:20px; width:80%">승인대기</div></td>
						<%} else if (todayList.get(i).getPayment_cash_status() ==1){ %>
							<td> <div style="background:green; color:white ; border-radius:20px; width:80%">승인</div></td>	
						<%}%>
							</tr>
						<%} %>
					</table>
				</div>
	
			<script>
		$(function(){
	
			$('.masterCheckToday').click(function(){
				$('.childCheckToday').prop('checked',this.checked);
			});
			
		
			
			$("#selectTodayBtn").click(function(){
				var checkBoxs = document.getElementsByName("selectToday"); // 체크박스 객체
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
					alert('입금처리할 계정을 선택해 주세요.')
					return;
				}
				location.href="<%=request.getContextPath()%>/bankBookApproval.pa?selecUserNo="+rowid;
			})
		
			$('#totalTodayBtn').click(function(){
				var checkBoxs = document.getElementsByName("selectToday"); // 체크박스 객체
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
				location.href="<%=request.getContextPath()%>/bankBookApproval.pa?selecUserNo="+rowid;
			})
	
		});
	</script>
	
	
		</div>
	</div>
</div>
	
	<%-- <script>
		$(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/getClientIp.ad", //요청을 보냄
				type : "post",
				success : function(data) {
					console.log(data); 

				},
				error : function(status, msg) {
					console.log(status);
					console.log(msg);

				}
			});
		})
	</script> --%>
	<%@include file="../../common/footer.jsp" %>
</body>
</html>
