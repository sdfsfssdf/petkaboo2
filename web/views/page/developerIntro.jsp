<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개발자소개</title>

<!-- 개발자소개 -->

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
	margin: 0 auto;
}

/*위의 소스에서 _가 있는데 이것은 그 CSS를 해제 시키는 역할입니다. 즉 헤더부분의 영역을 보고 싶다면 _를 삭제 하면 됩니다. ^^*/
#header {
	float: left;
	width: 100%;
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
}

.title {
	float: left;
	width: 100%;
	height: 250px;
	margin-top: 80px;
	/* background: #edeef0; */
	text-align: center;
	/* border: 1px solid black; */
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
	text-align: center;
	margin: 0 auto;
}

.developerIntro {
	float: left;
	width: 100%;
	height: 1000px;
	margin-top: 30px;
	margin-bottom: 80px;
	background: #edeef0;
	border: 1px solid black;
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

			<div class="content-left"></div>

			<div class="content-center">


				<!-- DEVELOPER 타이틀부분 -->
				<div class="title">

					<h1 style="color: #cfb7af">DEVELOPER</h1>
					<br> <br> <span
						style="font-weight: bold; font-size: 17px">펫카부는 회사에서 보증하는
						믿을 수 있는 펫시터분들을 관리합니다.</span><br> <span
						style="font-weight: bold; font-size: 17px">아이들을 사랑하는 마음은
						기본이며 교육을 통한 전문적인 돌봄이 가능합니다.</span> <br> <br> <span
						style="font-weight: bold; font-size: 17px">온마음 펫시터는 안전과 신뢰를
						바탕으로 하는 돌봄이 1순위입니다.</span><br>



				</div>


				<div class="developerIntro">
					<p>이미지 삽입</p>
					<h2 align="left">펫카부 개발자 소개</h2>
				</div>

				<!-- 구분선 -->
				<br> <br> <br> <br> <br>
				<hr
					style="border: thin dashed gray; ! important; display: inline-block !important; width: 100% !important;" />



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

			<div class="content-right"></div>



			<!-- footer -->
			<div id="footer">
				<h1>footer</h1>
			</div>
		</div>
	</div>


</body>
</html>