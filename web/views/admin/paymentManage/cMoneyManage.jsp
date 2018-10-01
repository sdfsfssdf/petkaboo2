<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pkb.common.Paging,java.util.* , com.pkb.payment.model.vo.*"%>

<%
	HashMap<String, Object> totalInfo = (HashMap<String,Object>)request.getAttribute("totalInfo");
	HashMap<String,Integer> todayInfo = (HashMap<String,Integer>)totalInfo.get("todayInfo");
	ArrayList<Payment> plist = (ArrayList<Payment>)totalInfo.get("plist");
	ArrayList<HashMap<String,String>> ilist = (ArrayList<HashMap<String.String>>)totalInfo.get("incomeList");
	Paging pg = (Paging) request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%>
<!DOCTYPE html>
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
<title>Insert title here</title>
<style>
	.outer{
		float:left;
		width:1000px;
		height:1000px;
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
	.head > th{
		background: #ddd;
		text-align:center;
	}
	
	.leftWrapArea{
      height:1100px !important;      
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2>사이버머니 관리</h2>
	<p>사이버머니 내역과 간단한 통계를 확인, 조회할 수 있습니다.</p>
	<hr>
		<div>
			<table class="table table-hover" >
				<tr class="head" align="center">
					<th>오늘의 충전 건 수</th>
					<th>총 충전 금액</th>
					<th>구분</th>
					<th>총 거래 건 수</th>
					<th>거래액</th>
					<th>수수료</th>
					<th>실수입</th>
				</tr>
				<%if(ilist == null) { %>
					<tr align="center">
						<td><%=todayInfo.get("count") %></td>
						<td><%=todayInfo.get("totalAmout") %></td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
				<%} else { %>
					<%if(ilist.size() == 1) {%>
						<tr align="center">
							<td ><%=todayInfo.get("count") %></td>
							<td ><%=todayInfo.get("totalAmout") %></td>
							<td><%=ilist.get(0).get("category")%></td>
							<td><%=ilist.get(0).get("count") %></td>
							<td><%=ilist.get(0).get("totalIncome") %></td>
							<td><%=ilist.get(0).get("rate") %>%</td>
							<td><%=(Integer.parseDouble(ilist.get(0).get("totalIncome"))*(Integer.parseInt(ilist.get(0).get("rate"))%></td>
						</tr>
					<%} else  {%>
					
					<%} %>
				<%} %>
				
				<tr align="center">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>합계 : </td>
					<td>10000원</td>
				</tr>
			</table>
		</div>
	<hr><form action="<%=request.getContextPath() %>/searchList.pa" method="get">
		<div style="widht:100%; height:100px;border:1px solid black;" align="center" >
			<label>결제일&nbsp;&nbsp;&nbsp;&nbsp;:</label>&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="radio" name="date" id="allDate" value="all" checked><label for="all">전체	</label>&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="radio" name="date" id="today" value="today"><label for="date">당일</label>&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="radio" name="date" id="week" value="week"><label for="week">1주일</label>&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="radio" name="date" id="month" value="month"><label for="month">한달</label>&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="radio" name="date" id="year" value="year"><label for="year">일년</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<hr style="margin:0px;">
			<label>결제 수단 &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </label> 
					<input type="radio" name="method" id="allMethod" value="all" checked><label for="bankBook">전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="method" id="creditCard" value="creditCard"><label for="creditCard">카드결제</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="method" id="bankBook" value="bankBook"><label for="bankBook">무통장 입금</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<hr style="margin:0px;">
			<label>구분 &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </label>
					<input type="radio" name="division" id="allDiv" value="all" checked><label for="allDiv">전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="division" id="use" value="use"><label for="use">사용 내역</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="division" id="cencel" value="cencel"><label for="cencel" >환불 내역</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="division" id="reCharge" value="reCharge"><label for="reCharge">충전 내역</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<button style="float:right; margin-right:20px;">검색하기</button>
		</div>
		</form>
		<br>
		<table class="table table-hover" id="cMoneyManage">
			<tr class="head" >
				<th width="10%">결제번호</th>
				<th width="15%">ID</th>
				<th width="15%">금액</th>
				<th width="15%">결제일</th>
				<th width="10%">결제수단</th>
				<th width="25%">승인번호/입금 계좌번호</th>
				<th width="10%">구분</th>
			</tr>
			<%for(int i = 0 ; i < plist.size(); i ++ ) { %>
				<tr align="center">
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
						<%if(plist.get(i).getPayment_type() == 0){ %>
							<%=plist.get(i).getImp_uid() %>
						<%}else { %>
							<%=plist.get(i).getAccount_no() %>
						<%} %>
					</td>
						<%if(plist.get(i).getPay_method().equals("C")){ %>
							<td>
							<div style="background:green; color:white ; border-radius:20px; width:80%">충전</div></td>
						<%} else if (plist.get(i).getPay_method().equals("U")){ %>
							<td> <div style="background:gray; color:white ; border-radius:20px; width:80%">사용</div></td>	
						<%} else { %>
							<td><div style="background:red; color:white ; border-radius:20px; width:80%">환불</div></td>
						<%} %>
					
				</tr>
			<%} %>
		</table>
	</div>
	<br>
	<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMain.pe?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMain.pe?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/selectMain.pe?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/selectMain.pe?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMain.pe?currentPage=<%=maxPage%>'">>></button>
			</div>
	</div>
</div>
</body>
</html>













