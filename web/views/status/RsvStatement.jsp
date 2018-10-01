<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pkb.petsitterService.model.vo.*, com.pkb.reservation.model.vo.*"%>
	
		<% 
   PetsitterService p = (PetsitterService)request.getAttribute("p");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진행상황_예약내역</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#container {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
}

#header {
	float: left;
	width: 100%;
	height: 150px;
	_border: 1px solid blue;
	background-color: white;
}

.body {
	margin-top: 1%;
	margin-left: 10%;
	margin-right: 10%;
	display: block;
	/* border: 1px solid black; */
}

.status-icon {
	width: 90%;
	height: 200px;
	background: lightgray;
	display: inline-block;
	margin-left: 5%;
	margin-right: 5%;
	border-radius: 20px;
}

.RsvStatement {
	width: 90%;
	height: 90%;
	background: gray;
	display: inline-block;
	margin-left: 5%;
	margin-right: 5%;
	border-radius:20px;
}

.PSid {
	width: 90%;
	height: 250px;
	background: lightgray;
	display: inline-block;
	margin-top: 50px;
	margin-left: 5%;
	margin-right: 5%;
	border-radius:20px;
}

.RsvDetailed{
	width: 90%;
	height: 90%;
	background: lightgray;
	display: inline-block;
	margin-left: 5%;
	margin-right: 5%;
	margin-bottom:5%;
	margin-top:5%;
	border-radius:20px;
}
img{
	border-radius:100px;
}
.icon {
	width: 140px;
	height: 140px;
	margin-left: 3.7%;
	margin-right: 2.5%;
	margin-top:2.6%;
	margin-bottom:1%;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header"></div>
		<%
				if (loginUser != null) {
		%>
		<h2 style="text-align: center; margin-top: 100px;">
			<span style="color: rgb(228, 100, 18);"> <strong>
					요청완료</strong>
			</span>
		</h2>
		<div class="body">
			<br />
			<br />
			
			<h4></h4>
			<div class="status-icon">
				<img class="icon"
					src="https://cdn0.iconfinder.com/data/icons/business-381/500/business-work_13-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				
			</div>
			<br /><br /><br />
			<br />
			<div class="RsvStatement">
				<div class="PSid">
						<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>펫시터 정보</label><br><div style="float:left; margin-left:15px "><img width="180px" height="180px" border-radius="100px" display="inline-block" src="https://scontent.cdninstagram.com/vp/d432a9c5818f68d1dcfd3860935145f2/5BDCF333/t51.2885-15/sh0.08/e35/p640x640/34982645_1703252956454507_5788207006821122048_n.jpg" alt="" /></div>
						&nbsp;&nbsp;<label>&nbsp;&nbsp;닉네임&nbsp;&nbsp;:&nbsp;&nbsp;<%=c.getPetNickname() %><br><br><br>&nbsp;&nbsp;주소&nbsp;&nbsp;:&nbsp;&nbsp;<%
					String addressSplit = c.getPetAddress();
					String address;
					int index = addressSplit.indexOf("^");
					address = addressSplit.substring(0, index);
				
					%> <%=address %><br><br><br>&nbsp;&nbsp;연락처&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=c.getPetPhone() %></label>
					<br>
					<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<br />
				<br />
				<br />
				</div>
			
				
				<div class="RsvDetailed">
					<br />
					<br />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;예약신청일 &nbsp;&nbsp;:&nbsp;&nbsp;<%=c.getContract_date() %></label><input
									type="text" name="contract_date" size='18'
									style="background-color: transparent; border-style: none;"
									readonly onfocus="this.blur();">
					<br />
					<br />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;:&nbsp;&nbsp;<%
					String addressSplit2 = c.getUserAddress();
					String address2;
					int index2 = addressSplit.indexOf("^");
					address2 = addressSplit.substring(0, index);
				
					%><%=address2 %> </label><input
									type="text" name="useraddress" size='18'
									style="background-color: transparent; border-style: none;"
									readonly onfocus="this.blur();">
					<br />
					<br />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;펫시팅 시작일&nbsp;&nbsp;:&nbsp;&nbsp;<%=c.getContract_start() %></label><input
									type="text" name="contract_start" size='18'
									style="background-color: transparent; border-style: none;"
									readonly onfocus="this.blur();">
					<br />
					<br />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;펫시팅 종료일&nbsp;&nbsp;:&nbsp;&nbsp;<%=c.getContract_end() %></label><input
									type="text" name="contract_end" size='18'
									style="background-color: transparent; border-style: none;"
									readonly onfocus="this.blur();">
					<br />
					<br />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;신청자&nbsp;&nbsp;:&nbsp;&nbsp;<%=c.getUserName() %></label><input
									type="text" name="user_name" size='18'
									style="background-color: transparent; border-style: none;"
									readonly onfocus="this.blur();">
					<br />
					
					<br /><br /><br />
				</div>
			</div>
		</div>







		<br />
		<br />
		<br />
		<br />
		<br /> <br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br /> <br />
		<br />
		<br />



	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<%} else {%>
	<script>
		alert('로그인한 회원만 이용 가능합니다.')
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
			

	<%}%>
	
</body>
</html>