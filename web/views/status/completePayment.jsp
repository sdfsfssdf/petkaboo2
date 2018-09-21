<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진행상황_결제완료</title>
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
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
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
	border-radius: 20px;
}

.PSid {
	width: 90%;
	height: 150px;
	background: lightgray;
	display: inline-block;
	margin-top: 20px;
	margin-left: 5%;
	margin-right: 5%;
	border-radius: 20px;
}

.RsvDetailed {
	width: 90%;
	height: 90%;
	background: lightgray;
	display: inline-block;
	margin-left: 5%;
	margin-right: 5%;
	margin-bottom: 5%;
	margin-top: 5%;
	border-radius: 20px;
}

img {
	border-radius: 100px;
}

.icon {
	width: 140px;
	height: 140px;
	margin-left: 3.7%;
	margin-right: 2.5%;
	margin-top:2.6%;
	margin-bottom:1%;
}

td {
	border: 1px solid black;
}
.tableSt{
	margin-left:5%;
}
.l {
	width: 100%;
	text-align: center;
}
.PSphoto {
	width: 127px;
	height: 127px;
	display: inline-block;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header"></div>
		<%@include file="../common/menubar.jsp"%>
		<h2 style="text-align: center; margin-top: 100px;">
			<span style="color: rgb(228, 100, 18);"> <strong>
					결제완료</strong>
			</span>
		</h2>
		<div class="body">
			<br /> <br />
			<h4></h4>
			<div class="status-icon">
				
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn0.iconfinder.com/data/icons/business-381/500/business-work_13-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">

			</div>
			<br />
			<br />
			<br /> <br />
			<div class="RsvStatement">
				<div class="PSid">
					<br />
					<h4>
						<span>예약번호 : </span>
					</h4>
				</div>


				<div class="RsvDetailed">
					<br /><br />
					<table class="tableSt">
						<tr>
							<td>예약번호 :</td>
							<td colspan="3">입력란</td>

						</tr>
						<tr>
							<td rowspan="2">펫시터</td>
							<td rowspan="2"><div class="l">
						<img
							src="https://pbs.twimg.com/profile_images/984239725190901760/-5wrSANU_400x400.jpg"
							class="PSphoto img-circle img-responsive" alt="Responsive image" />
					</div></td>
							<td>이름 : </td>
							<td>입력란</td>
						</tr>
						<tr>
							<td>주소 : </td>
							<td>입력란</td>
						</tr>
						<tr>
							<td rowspan="2">반려동물</td>
							<td>이름 : </td>
							<td colspan="2">입력란</td>

						</tr>
						<tr>
							<td>나이 : </td>
							<td colspan="2">입력란</td>

						</tr>
						<tr>
							<td>요구사항</td>
							<td colspan="3">입력란</td>
						</tr>
						보더색깔은 style의 td에서 지워주시면 됩니다. -->
					</table>
					<br />
					<br />
					<br />
					
				</div>
			</div>
		</div>







		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />



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
</body>
</html>