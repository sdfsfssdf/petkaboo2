<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.pkb.petsitterService.model.vo.*"%>
<% 
	PetsitterService p = (PetsitterService)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터상세보기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
#topArea{
	width:100%;
	display:inline-block;
	text-align:center;
}

#serviceDetail {
	display:inline-block;
	width:50%;
	height:250px;
	margin:auto;
	text-align:center;
	border:1px solid black;
}
#serviceDetail th{
	text-align:center;
}

#servicePhoto {
	display:inline-block;
	width:200px;
	height:250px;
	text-align:center;
	border:1px solid black;
}
#servicePhoto tr{
	margin:5px;
}
#buttons {
	display:inline-block;
}
</style>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	<div class="topArea" id="topArea" name="topArea">
		<table id="servicePhoto" name="servicePhoto">
			<tr>
				<td>
					<% 
						String profileImage = null;
						if(!p.getProfileImage().equals("/nullnull")){
							profileImage = p.getProfileImage();
						}else{
							profileImage = "/images/profileImagesUpload/profileBasicImage.png";
						}
						%>
						<p><img height="auto;" width="200px;" height-max="200px;" src="<%=request.getContextPath()%><%= profileImage %>"></p>				
					</td>
			</tr>
			<tr>
				<td><b><%=p.getNickname() %> 펫시터</b></td>
			</tr>
			<tr>
				<td>
				<br>
						<% 
							String maskedAddress = "";
							if(p.getAddress() != null){
							// 가져온 주소를 공백을 기준으로 잘라 동까지만 노출
							String[] splitAddress = null;
							splitAddress = p.getAddress().split("\\s");
								if(splitAddress.length > 3){
									for(int i = 0; i < 3; i++){
										maskedAddress += splitAddress[i] + " ";
									}
								}else{
									maskedAddress = "잘못된 주소";
								}
							}
						%>
						<%= maskedAddress %>					
				<br>		
				</td>
			</tr>
		</table>
		<table id="serviceDetail" name="serviceDetail">
			<tr>
				<th width="100px">서비스 종류</th>
				<th width="200px">예약가능 요일</th>
				<th width="150px">시작 가능일</th>
				<th width="150px">종료일</th>
				<th width="100px">서비스가격</th>			
			</tr>
			<tr>
				<td>
				<% 
				String contract_type = null;
			
				if(p.getContract_type().equals("v")){
					contract_type = "방문";
				} else {
					contract_type = "위탁";
				}
				%>
				<%= contract_type %>				
				</td>
				<td><%= p.getContract_days() %></td>
				<td><%= p.getContract_start() %></td>
				<td><%= p.getContract_end() %></td>
				<td><%= p.getService_charge() %></td>
			</tr>
		</table>
		<div name="space"></div>
		<div class="buttons" id="buttons" name="buttons">
		<form class="orderInfo" id="orderInfo" name="orderInfo" method="post" action="<%=request.getContextPath()%>/selectOne.do">
		<input type="hidden" id="revLevel" name="revLevel" value="1">
		<input type="hidden" id="no" name="no" value="<%= p.getPet_service_regno() %>">
		<button class="pre-order" id="pre-order" onclick="submit()">예약하기</button>
		</form>
		<%
			if(loginUser != null && loginUser.getUser_no() == p.getUser_no()){
				Gson gson = new Gson();
				String psi = gson.toJson(p);
				System.out.println("psi: " + psi);
		%>
		<div>
			<form id="psInfo" name="psInfo" action="<%=request.getContextPath()%>/views/myPage/petSitterServiceUpdateDetailForm.jsp" method="POST">
			<input type="hidden" id="psi" name="psi" maxlength="1000" value='<%= psi %>'>
			<button class="modify" name="modify" id="modify" onclick="modify()">수정하기</button>
			</form>
		</div>
		<% }else{ %>
		nothing to do
		<% } %>
		</div>			
		</div>
<script>
	function submit(){
		$("#orderInfo").submit();
	}
	
	function modify(){
		$("#psInfo").submit();
	}
</script>
</body>
</html>