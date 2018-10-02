<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pkb.payment.model.vo.*,java.util.*,com.pkb.common.Paging"%>
<%
	HashMap<String, Object> totalInfo = (HashMap<String,Object>)request.getAttribute("totalInfo");
	ArrayList<HashMap<String,String>> todayList = (ArrayList<HashMap<String,String>>)totalInfo.get("todayList");
	ArrayList<HashMap<String,String>> totalList = (ArrayList<HashMap<String,String>>)totalInfo.get("totalList");
	Paging pg = (Paging)request.getAttribute("pg");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

      height:1450px !important;
   }
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="leftMenu.jsp"%>
	<div class="outer">
		<div class="first-row">
			<div class="table1">
				<h2>환불요청 관리</h2>
				<p>환불요청 정보를 확인하고, 관리할 수 있습니다.</p>
				<hr>
				<h4 style="display: inline-block">오늘 환불 요청 : <%=todayList.size() %> 건</h4> 
				<div style="width: 100%; height: 300px; overflow: auto">
					<table class="table table-hover">
						<tr class="head">
							
							<th>결제번호</th>
							<th>ID</th>
							<th>요청금액</th>
							<th>신청일</th>
							<th>계약시작일</th>
							<th>계약종료일</th>
							<th>구분</th>
						</tr>
						<%if(todayList != null && todayList.size() != 0) {%>
							<%for(int i = 0 ; i < todayList.size(); i ++ ) { %>
								<tr align="center">
								
									
									<td><%=todayList.get(i).get("pay_no")%></td>
									<td><%=todayList.get(i).get("email") %></td>
									<td align="left">
										<% 
											SimpleDateFormat format = new SimpleDateFormat("YYYY-mm-dd");
											String tempStartDate = todayList.get(i).get("contract_start").substring(0,todayList.get(i).get("contract_start").indexOf(" "));
											String tempEndDate = todayList.get(i).get("contract_end").substring(0,todayList.get(i).get("contract_end").indexOf(" "));
											String tempRequestDate = todayList.get(i).get("pay_date").substring(0,todayList.get(i).get("contract_end").indexOf(" "));
											
											Date requestDate = format.parse(tempRequestDate);
											Date endDate = format.parse(tempEndDate);
											Date startDate = format.parse(tempStartDate);
											
											long checkStartDate = (requestDate.getTime() - startDate.getTime())/ (24 * 60 * 60 * 1000);
											long remainDate = (endDate.getTime()-requestDate.getTime()) / (24 * 60 * 60 * 1000);
											
											
										%>
									계약 포인트 : <span style="color:green"><%=todayList.get(i).get("pay_amount") %></span><br>
									<%if(checkStartDate < 0) {%>
									남은 서비스일 : 시작전  <br>
									동물 마리 수 : <%=todayList.get(i).get("pet_count") %><br>
									환불 포인트 : <span style="color:red"><%=todayList.get(i).get("pay_amount")%></span>
									<input type="hidden" name="refundAmount" value="<%=todayList.get(i).get("pay_amount")%>">
									<%} else {%>
									남은 서비스일 : <%=remainDate %>  <br>
									동물 마리 수 : <%=todayList.get(i).get("pet_count") %><br>
									환불 포인트 : <span style="color:red"><%=remainDate * Integer.parseInt(todayList.get(i).get("pet_count")) * Integer.parseInt(todayList.get(i).get("service_charge")) %></span>
									<input type="hidden" name="refundAmount" value="<%=remainDate * Integer.parseInt(todayList.get(i).get("pet_count")) * Integer.parseInt(todayList.get(i).get("service_charge")) %>">
									 <%} %>
									</td>
									<td><%=todayList.get(i).get("pay_date") %></td>
									<td><%=todayList.get(i).get("contract_start") %></td>
									<td><%=todayList.get(i).get("contract_end") %></td>
									<td>
										<%if(todayList.get(i).get("pay_method").equals("F")) {%>
											<div style="width:70px;background:orange; color:white">환불대기</div>
											<div style="margin-top:5px">
												<button style="background:green; color:white">환불처리</button>
												<button style="background:darkgray; color:white" onclick="refusal(<%=totalList.get(i).get("pay_no")%>)">환불거절</button>
											</div>
										<%} else { %>
											<div style="width:70px;background:red; color:white">환불</div>
										<%} %>
									</td>
								</tr>
							<%} %>
						<%} %>
					</table>
				</div>
				<script>
	</script>
				<hr>
				<h4 style="display:inline-block">전체 리스트</h4>

				<table class="table table-hover">
						<tr class="head">
					
							<th>결제번호</th>
							<th>ID</th>
							<th>요청금액</th>
							<th>신청일</th>
							<th>계약시작일</th>
							<th>계약종료일</th>
							<th>구분</th>
						</tr>
						<%if(totalList != null && totalList.size() != 0) {%>
							<%for(int i = 0 ; i < totalList.size(); i ++ ) { %>
								<tr align="center">
									<td><%=totalList.get(i).get("pay_no")%></td>
									<td><%=totalList.get(i).get("email") %></td>
									<td align="left">
										<% 
											SimpleDateFormat format = new SimpleDateFormat("YYYY-mm-dd");
											String tempStartDate = totalList.get(i).get("contract_start").substring(0,totalList.get(i).get("contract_start").indexOf(" "));
											String tempEndDate = totalList.get(i).get("contract_end").substring(0,totalList.get(i).get("contract_end").indexOf(" "));
											String tempRequestDate = totalList.get(i).get("pay_date").substring(0,totalList.get(i).get("contract_end").indexOf(" "));
											
											Date requestDate = format.parse(tempRequestDate);
											Date endDate = format.parse(tempEndDate);
											Date startDate = format.parse(tempStartDate);
											
											long checkStartDate = (requestDate.getTime() - startDate.getTime())/ (24 * 60 * 60 * 1000);
											long remainDate = (endDate.getTime()-requestDate.getTime()) / (24 * 60 * 60 * 1000);
											
											
										%>
									계약 포인트 : <span style="color:green"><%=totalList.get(i).get("pay_amount") %></span><br>
									<%if(checkStartDate < 0) {%>
									남은 서비스일 : 시작전  <br>
									동물 마리 수 : <%=totalList.get(i).get("pet_count") %><br>
									환불 포인트 : <span style="color:red"><%=totalList.get(i).get("pay_amount")%></span>
									<input type="hidden" name="refundAmount" value="<%=totalList.get(i).get("pay_amount")%>">
									<%} else {%>
									남은 서비스일 : <%=remainDate %>  <br>
									동물 마리 수 : <%=totalList.get(i).get("pet_count") %><br>
									환불 포인트 : <span style="color:red"><%=remainDate * Integer.parseInt(totalList.get(i).get("pet_count")) * Integer.parseInt(totalList.get(i).get("service_charge")) %></span>
									
									<input type="hidden" name="refundAmount" value="<%=remainDate * Integer.parseInt(totalList.get(i).get("pet_count")) * Integer.parseInt(totalList.get(i).get("service_charge")) %>">
									 <%} %>
									</td>
									<td><%=totalList.get(i).get("pay_date") %></td>
									<td><%=totalList.get(i).get("contract_start") %></td>
									<td><%=totalList.get(i).get("contract_end") %></td>
									<td>
										<%if(totalList.get(i).get("pay_method").equals("F")) {%>
											<div style="width:70px;background:orange; color:white">환불대기</div>
											<div style="margin-top:5px">
												<button type="submit" style="background:green; color:white">환불처리</button>
												<button type="button" style="background:darkgray; color:white" onclick="refusal(<%=totalList.get(i).get("pay_no")%>)">환불거절</button>
											</div>
										<%} else { %>
											<div style="width:70px;background:red; color:white">환불</div>
										<%} %>
									</td>
								</tr>
							<%} %>
						<%} %>
					</table>
					<script>
						function refusal(num){
							console.log(num);
						}
					</script>
					<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/refundMain.pa?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/refundMain.pa?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/refundMain.pa?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/refundMain.pa?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/refundMain.pa?currentPage=<%=maxPage%>'">>></button>
			</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>













