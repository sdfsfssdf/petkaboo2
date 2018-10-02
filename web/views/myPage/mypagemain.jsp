<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pkb.payment.model.vo.*, java.util.*,com.pkb.common.Paging,java.util.*"%>
	<% 
  	 CyberMoney cm = (CyberMoney)request.getAttribute("cm");
	String check = (String)request.getAttribute("check");
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");

	System.out.println(list);
	
/* 	Paging pg = (Paging) request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage(); */
%>

 
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

						<label>보유중인 포인트 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" value="<%=loginUser.getMoney() %>" readonly>&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<br>
							<br>
							<form method="post" action="<%=request.getContextPath()%>/insertRecharge.rc" id="testForm">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="user_no" value="<%=loginUser.getUser_no() %>">
							<input type="hidden" name="check" value=1>
							<label>충전할 금액 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" value="" name="paid_amount" id="paid_amount">
							<input type="hidden" id="imp_uid" name="imp_uid">&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" id="pay_type" name="pay_type">
							<input type="hidden" id="apply_num" name="apply_num">
							
							</form>
							<br>

							<label class=howToPs><input type="radio" id="card1"
						value="card" name="howToPS" />&nbsp;카드결제&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;

					<label class=howToPs><input type="radio" id="cash1"
						value="cash" name="howToPS" />&nbsp;무통장 입금&nbsp; </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				
					<button id="clickrecharge">충전하기</button>
						
						
					</div>


					<br> <br>

					<!-- <div class="notice">
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
					</div> -->
				</div>


				<!-- 충전내역 사용내역 탭 -->
				<div class="center-content2">
				
					<div class="container">

						
						<div class="tab-content">
									<br>

									<form class="lookup1" action="<%=request.getContextPath()%>/selectCyberMoneyHistory.pm">
										<span>조회기간</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pay_date" value="today" checked>오늘&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="pay_date" value="week">일주일&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="pay_date" value="month">1개월&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="pay_date" value="year">일년&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit">검색하기</button>
								<br>

										<span>조회내용</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pay_method" value="all" checked>전체&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="pay_method" value="recharge">충전내역만&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="pay_method" value="use">사용내역만&nbsp;&nbsp;&nbsp;&nbsp;
									</form>

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
	

			
			<!-- footer -->
			<div id="footer">
				<h1>footer</h1>
			</div>
		</div>
	</div>
	<div id="id01" class="w3-modal">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('id01').style.display='none'" 
      class="w3-closebtn">&times;</span>
      <p>Some text in the Modal..</p>
      <p>Some text in the Modal..</p>
    </div>
  </div>
  
  <!-- 페이지 처리 -->
		<%-- <div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectCyberMoneyHistory.pm?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectCyberMoneyHistory.pm?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/selectCyberMoneyHistory.pm?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/selectCyberMoneyHistory.pm?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectCyberMoneyHistory.pm?currentPage=<%=maxPage%>'">>></button>
			</div>
	</div>
   --%>
</div>
<script>


		$(function() {
			$('#clickrecharge')
					.click(
							function() {
								if (!$("input:radio[name=howToPS]:checked").val()) {
									alert('충전에 필요한 결제수단을 선택해주세요.');
									return false;
								} else if ($("input:radio[name=howToPS]:checked").val() == "card") {
									
									var paid_amount = document.getElementById('paid_amount').value;
									if(paid_amount == null || paid_amount == ""){
										alert('금액을 입력해주세요')
									}
									
									IMP.request_pay(
													{
														pg : 'jtnet',
														pay_method : 'card',
														merchant_uid : 'merchant_'
																+ new Date()
																		.getTime(),
														name : '펫카부 펫시팅 서비스',
														amount : paid_amount,
														buyer_email : '<%=loginUser.getEmail()%>',
														buyer_name : '<%=loginUser.getUser_name()%>',
														buyer_tel : '<%=loginUser.getPhone()%>',
														buyer_addr : '<%=loginUser.getAddress()%>',
														
													},
													function(rsp) {
														if (rsp.success) {
															//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
															console.log("haha");
															$('#imp_uid').val(rsp.imp_uid);
															$('#pay_type').val(rsp.pay_method);
															$('#apply_num').val(rsp.apply_num);
															document.getElementById("testForm").submit();
														}
													})

								} else {
									
									
									
										
									

								}
							})
		})
	</script>
	<%if(cm != null){ %>
 <script>
 	alert('충전이 완료되었습니다.');
 	
 </script>
 <%} %>
 
	
	<%
		} else {

			request.getRequestDispatcher("../common/login.jsp").forward(request, response);

		}
	%>
</body>
</html>