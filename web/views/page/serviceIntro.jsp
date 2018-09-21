<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서비스 소개</title>
<style>
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0
}

img, fieldset {
	border: 0
}

ul, ol {
	list-style: none
}

em, address {
	font-style: normal
}

a {
	text-decoration: none
}

a:hover, a:active, a:focus {
	text-decoration: none
}

#wrap {
	float: left;
	width: 100%;
	background: transparent;
}

/* #container 모든 컨텐츠를 가운데로 위치 레프트건 라이트건 hello world건 브라우저 창의 가운데에 위치해야 하는데 가운데에 있게 해주게끔하기위해 만든 컨테이너 입니다. 
위와 같이 가로 값 잡고 마진 제로 오토를 먹입니다. */
#container {
	width: 100%;
	margin: 0 auto
}

/*위의 소스에서 _가 있는데 이것은 그 CSS를 해제 시키는 역할입니다. 즉 헤더부분의 영역을 보고 싶다면 _를 삭제 하면 됩니다. ^^*/
#header {
	float: left;
	width: 100%;
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
}

.content-left {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-right {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-center {
	width: 70%;
	float: left;
	/* text-align:center; */
	margin: 0 auto;
}

.top-content {
	float: left;
	width: 100%;
	height: 250px;
	margin-top: 80px;
	margin-bottom: 40px;
	/* background: #edeef0; */
	text-align: center;
	/* border: 1px solid black; */
}

.float-frame {
	background: #eee;
	padding: 0px;
}

/* 센터 첫번째 줄 div */
.center-content1 {
	width: 100%;
	height: 300px;
	margin-top: 10px;
	text-align: center;
	float: left;
	/* position: relative; */
	/* background: #edeef0;
	border: 1px solid black; */
}
/* 센터 두번째 줄 div */
.center-content2 {
	width: 100%;
	height: 300px;
	margin-top: 10px;
	float: left;
	/* background: #edeef0;
	border: 1px solid black; */
	text-align: center;
}
/* 센터 세번째 줄 div */
.center-content3 {
	width: 100%;
	height: 300px;
	margin-top: 10px;
	margin-bottom: 100px;
	float: left;
	/* border: 1px solid black;
	background: #edeef0; */
	text-align: center;
}

/* 센터 각 요소 div */
.center-content1-1 {
	float: left;
	width: 33.1%;
	height: 300px;
	/* background: #edeef0;
	border: 1px solid black; */
}

.bottom-content {
	margin-top: 50px;
	width: 100%;
	text-align: center;
	height: 500px;
}

.bottom-content1 {
	float: left;
	width: 100%;
	height: 250px;
	margin-top: 30px;
}

#footer {
	float: left;
	width: 100%;
	height: 250px;
	margin: 100px 0 30px 0;
	background: #e1e1e1
}
</style>
</head>
<body>


	<div id="wrap">
		<div id="header">
			<h1 align="center">펫카부</h1>
		</div>
		<div id="container">


			<!-- 메뉴파일 -->
			<%@ include file="menubar.jsp"%>
			<!-- fixed 창 -->
			<%@ include file="fixed.jsp"%>


			<!-- 왼쪽영역 -->
			<div class=content-left></div>

			<div class="content-center">

				<!-- 서비스 소개부분 -->

				<div class="top-content">
					<h1 style="color: #cfb7af">SERVICE</h1>
					<br> <br> <span
						style="font-weight: bold; font-size: 17px">반려동물에게 맞춰진 펫카부의
						돌봄 내용입니다.</span><br> <span
						style="font-weight: bold; font-size: 17px">반려동물과 보호자 모두가
						안심할 수 있도록 다양한 서비스를 제공합니다.</span><br> <span
						style="font-weight: bold; font-size: 17px">아래 서비스 외의 문의사항은
						전화상담 혹은 카카오톡으로 문의 주세요.</span><br> <span
						style="font-weight: bold; font-size: 17px"><span
						style="color: #cfb7af">맞춤 플랜</span>을 제공 해드립니다.</span>

				</div>
				<span style="font-weight: bold; font-size: 26px"><span
					style="color: #cfb7af">●</span>펫시터 활동 안내</span>
				<div class="float-frame">
					<div class="center-content1">
						<div class="center-content1-1">
							<img src="../images/service01.png" width="75%" height="300px">
						</div>
						<div class="center-content1-1">
							<img src="../images/service02.png" width="75%" height="300px">
						</div>
						<div class="center-content1-1">
							<img src="../images/service03.png" width="75%" height="300px">
						</div>


					</div>
					<div class="center-content2">
						<div class="center-content1-1">
							<img src="../images/service04.png" width="75%" height="300px">
						</div>
						<div class="center-content1-1">
							<img src="../images/service05.png" width="75%" height="300px">
						</div>
						<div class="center-content1-1">
							<img src="../images/service06.png" width="75%" height="300px">
						</div>

					</div>
					<div class="center-content3">
						<div class="center-content1-1">
							<img src="../images/service07.png" width="75%" height="300px">
						</div>
						<div class="center-content1-1">
							<img src="../images/service08.png" width="75%" height="300px">
						</div>
						<div class="center-content1-1">
							<img src="../images/service09.png" width="89%" height="300px">
						</div>

					</div>
				</div>

				<!-- 구분선 -->
				<br> <br> <br> <br> <br>
				<hr
					style="border: thin dashed gray !important; display: inline-block !important; width: 100% !important;" />
				<br>

				<!-- 차별점 -->
				<h3>
					<br>차별점
				</h3>
				<div class="bottom-content">
					<br>
					<div class="bottom-content1">
						<img src="../images/info1.png" width="65%" height="250px">
					</div>



					<div class="bottom-content1">
						<img src="../images/info2.png" width="65%" height="250px">
					</div>
				</div>
			</div>


			<!-- 오른쪽영역 -->
			<div class=content-right></div>

			<!-- footer -->
			<div id="footer">
				<p>footer</p>
			</div>
		</div>
	</div>


</body>
</html>