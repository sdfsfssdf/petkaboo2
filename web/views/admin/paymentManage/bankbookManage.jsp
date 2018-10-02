<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.pkb.payment.model.vo.*,com.pkb.common.Paging"%>
<%
	ArrayList<Payment> todayList = (ArrayList<Payment>)((HashMap<String,Object>)request.getAttribute("totalInfo")).get("todayInfo");
	ArrayList<Payment> plist = (ArrayList<Payment>)((HashMap<String,Object>)request.getAttribute("totalInfo")).get("plist");
	Paging pg = (Paging) request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.outer {
	float: left;
	width: 1000px;
	height: 600px;
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

.vertical_line {
	width: 1px;
	border: 0.5px solid lightgray;
	height: 300px;
	display: inline-block;
	margin-left: 20px;
	margin-right: 20px;
}
.leftWrapArea{
      height:1250px !important;      
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="leftMenu.jsp"%>
	<div class="outer">
		<div class="first-row">
			<div class="table1">
				<h2>무통장 입금 관리</h2>
				<p>무통장 입금 신청 내역 확인과 입금완료 처리가 가능합니다.</p>
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
				<hr>
				<h4 style="display:inline-block">전체 입금신청 내역</h4>
				<div style="float:right"><button class="btn btn-default" id="totalTotalBtn">일괄처리</button> <button id="selectTotalBtn" class="btn btn-default">선택처리</button></div>
				<table  class="table table-hover">
						<tr class="head">
							<th width="2%"><input type="checkbox" class="masterCheck"></th>
							<th width="8%">번호</th>
							<th width="15%">ID</th>
							<th width="15%">금액</th>
							<th width="15%">결제일</th>
							<th width="10%">결제수단</th>
							<th width="25%">입금 계좌번호</th>
							<th width="10%">구분</th>
						</tr>
						<%for ( int i = 0; i <plist.size(); i ++){ %>
							<tr align="center">
								<input type="hidden" value="<%=plist.get(i).getPay_no()%>">
								<%if(plist.get(i).getPayment_cash_status()==0) {%>
								<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectTotal" class="childCheck" value="<%=plist.get(i).getPay_no()%>/<%=plist.get(i).getUser_no()%>/<%=plist.get(i).getPay_amount()%>"></td>
								<%} else {%>
								<td>-</td>
								<%} %>
								<td><%=plist.get(i).getPay_no() %></td>
								<td><%=plist.get(i).getEmail() %></td>
								<td><%=plist.get(i).getPay_amount() %></td>
								<td><%=plist.get(i).getPay_date() %></td>
								<td><%if(plist.get(i).getPayment_type() == 0) {%>
							<img src="images/adminImgs/creditCard.png">
						<%} else { %>
							<img src="images/adminImgs/passbook.png">
						<%} %>
					</td>
						<td>
					
			
							<%=plist.get(i).getAccount_no() %>
						
					</td>
						<%if(plist.get(i).getPayment_cash_status() ==0 ){ %>
							<td>
							<div style="background:gray; color:white ; border-radius:20px; width:80%">승인대기</div></td>
						<%} else if (plist.get(i).getPayment_cash_status() ==1){ %>
							<td> <div style="background:green; color:white ; border-radius:20px; width:80%">승인</div></td>	
						<%}%>
							</tr>
						<%} %>
					</table>
					
					<script>
		$(function(){
			$('.masterCheck').click(function(){
				$('.childCheck').prop('checked',this.checked);
			});
			
			$('.masterCheckToday').click(function(){
				$('.childCheckToday').prop('checked',this.checked);
			});
			
			$("#selectTotalBtn").click(function(){
				var checkBoxs = document.getElementsByName("selectTotal"); // 체크박스 객체
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
		
			$('#totalTotalBtn').click(function(){
				var checkBoxs = document.getElementsByName("selectTotal"); // 체크박스 객체
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
					<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/bankBook.pa?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/bankBook.pa?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/bankBook.pa?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/bankBook.pa?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/bankBook.pa?currentPage=<%=maxPage%>'">>></button>
			</div>
	</div>
			</div>
		</div>
	</div>
</body>
</html>
