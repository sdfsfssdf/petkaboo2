<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 메인</title>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp97048672');
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<style>
/* body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0;
	font-family: none;
} 

img, fieldset {
	border: 0;
}

ul, ol {
	list-style: none;
	font-family: none;
}

em, address {
	font-style: normal;
}

a {
	text-decoration: none;
	font-family: none;
	color: black;
}
*/
a:hover, a:active, a:focus {
	text-decoration: none;
	font-family: none;
	color: rgb(207, 183, 175);
	
}

#wrap {
	float: left;
	width: 100%;
	background: transparent;
	
}

/* #container 모든 컨텐츠를 가운데로 위치 레프트건 라이트건 hello world건 브라우저 창의 가운데에 위치해야 하는데 가운데에 있게 해주게끔하기위해 만든 컨테이너 입니다. 
위와 같이 가로 값 잡고 마진 제로 오토를 먹입니다. */
#container1 {
	width: 100%;
	margin: 0 auto;
}

/*위의 소스에서 _가 있는데 이것은 그 CSS를 해제 시키는 역할입니다. 즉 헤더부분의 영역을 보고 싶다면 _를 삭제 하면 됩니다. ^^*/
/* #header {
	float: left;
	width: 100%;
	height: 150px;
	_border: 1px solid blue;
	background-color: white;
} */


.intro {

	border: 1px solid black;
	text-align: center;
	margin-top: 40px;
}

.content-left {
	width: 15%;
	float: left;
/* 	border: 1px solid black;
	background: yellow; */
}

.content-right {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}


.content-center {
	width: 70%;
	float: left;
	margin: 0 auto;
	text-align:center;
}

/* 보유포인트, 충전하기 */
.center-content1 {
	float: left;
	width: 100%;
	height: 400px;
	margin-top: 30px;
	margin-bottom: 30px;
	/* 	background: #edeef0;
	border: 1px solid black; */
}

/* 충전내역, 사용내역탭 */
.center-content2 {
	float: left;
	width: 100%;
	height: 200px;
	margin-bottom: 0px;
	/* background: #edeef0;
	border: 1px solid black; */
}

.center-content3 {
	float: left;
	width: 100%;
	height: 200px;
	margin-bottom: 50px;
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

/* 충전내역 사용내역탭 */
.container {
	width: 45%;
	height: 300px;
}



.lookup1 {
	font-size: 15px;
}

.lookup2 {
	font-size: 15px;
}

.point {
	text-align: center;
}

.rechbutton {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	text-decoration: none;
	font-size: 17px;
	color: white;
	border: none;
	border-radius: 0.5em;
	width: 118px;
	height: 38px;
	line-height: 38px;
	background-color: #cfb7af;
	font-family: 'Jua', sans-serif;
}

.rechbutton:hover {
	color: black;
	opacity: 0.7;
	font-family: 'Jua', sans-serif;
}

.notice {
	text-align: center;
}

.noticespan {
	text-align: center;
}

.noticetable {
	border-collapse: collapse;
	width: 70%;
	margin: 0 auto;
}

.mclist {
	border-collapse: collapse;
	width: 70%;
	margin: 0 auto;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	font-size:15px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%
		if (loginUser != null) {
	%>
	<div id="wrap">
			
		<div id="header"></div>
			<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>

			<!-- 사이드 메뉴 부분 -->
			<div class="content-left">
			<%@ include file="../common/sidemenubar.jsp" %>
			</div>


			<!-- 센터 컨텐츠 -->
			<div class="content-center">

				<br> <br>

				<!-- 마이페이지 타이틀부분 -->
				<div class="title">
					<h3 align="center" style="font-weight: bold; font-family: 'Jua', sans-serif;">마이페이지</h3>
					<hr
						style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				</div>



				<br>


				<!-- 보유포인트, 충전하기 -->
				<div class="center-content1">
					<span style="text-align:center; font-size:17px; font-weight:bold;">거래내역</p>
					<br> <br>
					<div class="point">
						<span>보유중인 포인트 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" value="<%= %>" readonly>&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class=howToPs><input type="radio" id="card1"
						value="card" name="howToPS" />&nbsp;카드결제&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;

					<label class=howToPs><input type="radio" id="cash1"
						value="cash" name="howToPS" />&nbsp;계좌이체&nbsp; </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<button id="clickrecharge">충전하기</button>
							
						
					</div>

					<br> <br>

					<div class="notice">
						<span class="noticespan">공지사항</span> <br> <br> <br>
						<form action="">
							<table align="center" class="noticetable">
								<tr>
									<th>글번호</th>
									<th>글제목</th>
									<th>등록일자</th>
								</tr>
								<tr>
									<td>1</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>2</td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</form>
					</div>
				</div>


				<!-- 충전내역 사용내역 탭 -->
				<div class="center-content2">
				
					<div class="container">


						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#recharge" style="font-weight:bold">충전내역</a></li>
							<li><a data-toggle="tab" href="#use" style="font-weight:bold">사용내역</a></li>

						</ul>

						<div class="tab-content">
							<div id="recharge" class="tab-pane fade in active">
								<div class="recharge1-1">
									<br>


									<form class="lookup1">
										<span>조회기간</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="lookup" value="today" checked>오늘&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="week">일주일&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="month">1개월&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="allterm">전체&nbsp;&nbsp;&nbsp;&nbsp;
									</form>
								</div>
								<br>
								<div class="recharge1-2">

									<form class="lookup1">
										<span>조회내용</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="lookup" value="allcont" checked>전체&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="rechargecont">충전내역만&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="usecont">사용내역만&nbsp;&nbsp;&nbsp;&nbsp;
									</form>
								</div>
							</div>

							<div id="use" class="tab-pane fade">

								<div class="use1-1">
									<br>
									<form class="lookup2">
										<span>조회기간</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="lookup" value="today" checked>오늘&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="week">일주일&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="month">1개월&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="allterm">전체&nbsp;&nbsp;&nbsp;&nbsp;
									</form>
								</div>
								<div class="use1-2">
									<br>
									<form class="lookup2">
										<span>조회내용</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="lookup" value="allcont" checked>전체&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="rechargecont">충전내역만&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="lookup" value="usecont">사용내역만&nbsp;&nbsp;&nbsp;&nbsp;
									</form>
								</div>

							</div>

						</div>

					</div>
				</div>


				<div class="center-content3">
					<form action="">
						<table class=mclist>
							<tr>
								<th>거래일시</th>
								<th>분류</th>
								<th>내용</th>
								<th>금액</th>
								<th>비고</th>
							</tr>
							<tr>
								<td>20180901</td>
								<td>Griffin</td>
								<td>Griffin</td>
								<td>Griffin</td>
								<td>$100</td>
							</tr>
							<tr>
								<td>20180902</td>
								<td>Griffin</td>
								<td>Griffin</td>
								<td>Griffin</td>
								<td>$150</td>
							</tr>
							<tr>
								<td>20180903</td>
								<td>Swanson</td>
								<td>Griffin</td>
								<td>Griffin</td>
								<td>$300</td>
							</tr>
							<tr>
								<td>20180904</td>
								<td>Brown</td>
								<td>Griffin</td>
								<td>Griffin</td>
								<td>$250</td>
							</tr>
						</table>
						
					</form>

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
			<!-- 	
			<div class="content-right">
			
			</div> -->


			<form method="post" action="<%=request.getContextPath()%>/insertRecharge.rc" id="testForm">
				<input type="hidden" value="10000" name="paid_amount" id="testBtn">
				<input type="hidden" id="imp_uid" name="imp_uid"">
			</form>
			<!-- footer -->
			<div id="footer">
				<h1>footer</h1>
			</div>
		</div>
	</div>
<script>
		$(function() {
			$('#clickrecharge')
					.click(
							function() {
								if (!$("input:radio[name=howToPS]:checked").val()) {
									alert('충전에 필요한 결제수단을 선택해주세요');
									return false;
								} else if ($("input:radio[name=howToPS]:checked").val() == "card") {

									IMP.request_pay(
													{
														pg : 'jtnet',
														pay_method : 'card',
														merchant_uid : 'merchant_'
																+ new Date()
																		.getTime(),
														name : '펫카부 펫시팅 서비스',
														amount : 1000,
														buyer_email : 'iamport@siot.do',
														buyer_name : '구매자이름',
														buyer_tel : '010-1234-5678',
														buyer_addr : '서울특별시 강남구 삼성동',
														buyer_postcode : '123-456'
													},
													function(rsp) {
														if (rsp.success) {
															//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
															console.log("haha");
															$('#imp_uid').val(rsp.imp_uid);
															document.getElementById("testForm").submit();
														}
													})

								} else {

									IMP.request_pay(
													{
														pg : 'jtnet',
														pay_method : 'trans',
														merchant_uid : 'merchant_'
																+ new Date()
																		.getTime(),
														name : '펫카부 펫시팅 서비스',
														amount : 14000,
														buyer_email : 'iamport@siot.do',
														buyer_name : '구매자이름',
														buyer_tel : '010-1234-5678',
														buyer_addr : '서울특별시 강남구 삼성동',
														buyer_postcode : '123-456'
													},
													function(rsp) {
														if (rsp.success) {
															//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
															jQuery
																	.ajax(
																			{
																				url : "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
																				type : 'POST',
																				dataType : 'json',
																				data : {
																					imp_uid : rsp.imp_uid
																				//기타 필요한 데이터가 있으면 추가 전달
																				}
																			})
																	.done(
																			function(
																					data) {
																				//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
																				if (everythings_fine) {
																					var msg = '결제가 완료되었습니다.';
																					msg += '\n고유ID : '
																							+ rsp.imp_uid;
																					msg += '\n상점 거래ID : '
																							+ rsp.merchant_uid;
																					msg += '\결제 금액 : '
																							+ rsp.paid_amount;
																					msg += '카드 승인번호 : '
																							+ rsp.apply_num;

																					alert(msg);
																				} else {
																					//[3] 아직 제대로 결제가 되지 않았습니다.
																					//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
																				}
																			})

														}
													})

								}
							})
		})
	</script>
	<%
		} else {

			request.getRequestDispatcher("../common/login.jsp").forward(request, response);

		}
	%>
</body>
</html>