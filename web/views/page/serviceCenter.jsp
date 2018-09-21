<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
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

.title {
	float: left;
	width: 100%;
	height: 250px;
	margin-top: 80px;
	/* background:#edeef0; */
	text-align: center;
	/* border:1px solid black; */
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
	/* text-align: center; */
	margin: 0 auto;
}

.bestqna {
	float: left;
	width: 100%;
	height: 200px;
	margin-top: 20px;
	margin-bottom: 180px;
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

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
	text-align: left;
	
}

table, td, th {
	border: 1px solid #ddd;
	text-align: left;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 16px;
}

th {
	background: #eee;
	text-align: center;
}

.button {
	background-color: #eee;
	border: none;
	color: black;
	padding: 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: auto;
	cursor: pointer;
	width: 240px;
	height: 50px;
	border-radius: 10px;
}

.noticenum, .noticedate, .noticecount, .noticewriter {
	text-align: center;
}

.noticetitle {
	text-align: left;
}

.notice {
	width: 100%;
	margin-top:120px;
	align: center;
}

.buttoncontent {
	text-align: center;
	margin-top:40px;
	width: 100%;
}
</style>
</head>
<body>


	<div id="wrap">

		<div id="container">


			<div id="header">
				<h1 align="center">펫카부</h1>
			</div>
			<!-- 메뉴파일 -->
			<%@ include file="menubar.jsp"%>
			<!-- fixed 창 -->
			<%@ include file="fixed.jsp"%>

			<div class="content-left">
			
			
			</div>

			<div class="content-center">
				<!-- QnA 타이틀부분 -->
				<div class="title">

					<h1 style="color: #cfb7af">FAQ</h1>
					<br> <br> <span
						style="font-weight: bold; font-size: 17px">펫카부를 향한 궁금증을 알기
						쉽게 정리하였습니다.</span> <br> <br> <span
						style="font-weight: bold; font-size: 17px">이 외의 문의사항은 카카오톡,
						전화로 문의 주시면 친절하게 답변해드리겠습니다.</span><br>

				</div>


				<!-- 자주하는 질문 -->
				<div class="bestqna">
					<!-- 	<img src="../images/bestqna.jpg" width="92%" height="1950px"> -->

					<button class="accordion">1. 펫시팅 요금은 어떻게 계산되나요</button>
					<div class="panel">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>

					<button class="accordion">2. 취소 환불은 어떻게 이루어지나요?</button>
					<div class="panel">
						<p>
							펫시터와 상호 합의하여 의뢰를 취소하고 환불할 수 있습니다.<br> 환불을 요청할 경우 페팸은 결제대행사에
							취소를 요청합니다.<br> 이후 결제대행사는 카드사에 취소를 요청합니다. 그리고 카드사가 최종 취소를 할
							경우 환불이 완료됩니다.<br> 단, 결제대행사를 거치지 않는 무통장 입금의 경우 더 빠르게 환불이
							진행됩니다.<br> 고객의 귀책사유로 취소, 환불요청하는 경우 환불요청 시점으로부터 의뢰 진행 시작일까지
							남은 기간을 기준으로 다음과 같은 취소 수수료 및 환불정책을 적용합니다.<br> 의뢰진행 시작일 3일 전까지
							취소를 요청하는 경우 100% 환불, 의뢰 진행 시작일 1일 또는 2일 전에 취소를 요청하는 경우 50% 환불, 의뢰
							진행 당일 취소를 요청하는 경우 30% 환불합니다. 단 당일 예약의 경우 환불이 불가합니다.
						</p>
					</div>
				</div>
				<br>
				<br>
				<br>
				

				<div class="notice">
					<h2>&nbsp;&nbsp;&nbsp;공지사항</h2>
					<br>
					<br>
					<table>
						<tr>
							<th width=50px>글번호</th>
							<th width=500px>제목</th>
							<th width=150px>게시날짜</th>
							<th width=50px>조회수</th>
							<th width=120px>작성자</th>
						</tr>
						<tr>
							<td class=noticenum>1</td>
							<td class=noticetitle>555</td>
							<td class=noticedate>2018-09-09</td>
							<td class=noticecount>34</td>
							<td class=noticewriter>고구마</td>
						</tr>
						<tr>
							<td class=noticenum>2</td>
							<td class=noticetitle>22</td>
							<td class=noticedate>2018-09-09</td>
							<td class=noticecount>111</td>
							<td class=noticewriter>감자</td>
						</tr>
						<tr>
							<td class=noticenum>3</td>
							<td class=noticetitle>22</td>
							<td class=noticedate>2018-09-09</td>
							<td class=noticecount>53</td>
							<td class=noticewriter>옥수수</td>
						</tr>

					</table>


				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<h2>&nbsp;&nbsp;&nbsp;펫카부 서비스 관련 약관</h2>

				<div class="buttoncontent">
					<button class="button button1">서비스 이용약관</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="button button2">안전보상 프로그램</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="button button3">개인정보 취급약관</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="button button4">위치정보 활용약관</button>

				</div>

				<!-- 구분선 -->
				<br> <br> <br> <br> <br>
				<hr
					style="border: thin dashed black; ! important; display: inline-block !important; width: 100% !important;" />

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
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>

</body>
</html>