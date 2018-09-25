<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pkb.member.model.vo.*"%>
<%
	User user = (User)(session.getAttribute("loginUser"));
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진행상황_결제요청</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp97048672');
</script>
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
	height: 40%;
	background: lightgray;
	display: inline-block;
	margin-left: 5%;
	margin-right: 5%;
	margin-bottom: 2%;
	margin-top: 2%;
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
	margin-top: 2.6%;
	margin-bottom: 1%;
}

.btnSt {
	margin-left: 30%;
	margin-right:;
}
</style>
</head>
<body>

	<div id="container">
		<div id="header"></div>
		<%@ include file="../common/menubar.jsp"%>

		<%@ include file="../common/oldMenubar.jsp"%>

		<%
			if (loginUser != null) {
		%>
	
		<h2 style="text-align: center; margin-top: 100px;">
			<span style="color: rgb(228, 100, 18);"> <strong>
					수락확인</strong>
			</span>
		</h2>
		<div class="body">
			<br /> <br />
			<h4></h4>
			<div class="status-icon">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn0.iconfinder.com/data/icons/business-381/500/business-work_13-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">
				<img class="icon"
					src="https://cdn3.iconfinder.com/data/icons/luchesa-vol-9/128/Light-512.png">

			</div>
			<br /> <br /> <br /> <br />
			<div class="RsvStatement">
				<div class="PSid">
					<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>예약번호 :
						<input type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();">
					</label>
				</div>
				<br />


				<div class="RsvDetailed">
					<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>예약신청일 : <input
						type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>주소 : <input
						type="text" size='50'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>펫시팅 시작일 : <input
						type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>펫시팅 종료일 : <input
						type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>신청자 : <input
						type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />

				</div>
				<div class="RsvDetailed">
					<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>요금 상세</label>
					<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>목록 : <input
						type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>목록 : <input
						type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label> <br /> <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<hr />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>결제
						포인트 : <input type="text" size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();">
					</label>&nbsp;&nbsp;&nbsp;&nbsp; <label>보유 포인트 : <input type="text"
						size='18'
						style="background-color: transparent; border-style: none;"
						readonly onfocus="this.blur();"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					 <label class=howToPs><input type="radio" id="card1"
						value="card" name="howToPS" />&nbsp;카드결제&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;

					<label class=howToPs><input type="radio" id="cash1"
						value="cash" name="howToPS" />&nbsp;무통장 입금&nbsp; </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




					<button id="clickrecharge" background="yellow">충전하기</button>
					<br />
					<hr />
					<br />
					<button class="btn btn-default btnSt" type="submit">결제하기</button>
					<button class="btn btn-default btnSt" type="reset">취소</button>
					
				
	
					
					<br /> <br />
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



<form action = location></form>
	<script>
	
	
	
		$(function() {
			$('#clickrecharge').click(
							function() {
								if (!$("input:radio[name=howToPS]:checked")
										.val()) {
									alert('충전에 필요한 결제수단을 선택해주세요');
									return false;
								} else if ($(
										"input:radio[name=howToPS]:checked").val() == "card") {

									IMP.request_pay(
													{
														pg : 'jtnet',
														pay_method : 'card',
														merchant_uid : 'merchant_'
																+ new Date()
																		.getTime(),
														name : '펫카부 펫시팅 서비스',
														amount : 1000,
														buyer_email : '<%=user.getEmail()%>',
														buyer_name : '<%=user.getUser_name()%>',
														buyer_tel :  '<%=user.getPhone()%>',
														buyer_addr : '<%=user.getAddress()%>',
														
													},
													function(rsp) {
														
															if (rsp.success) {
															//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
															jQuery.ajax(
																			{
																				url : 'insertRecharge.rc', //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
																				type : 'POST',
																				dataType : 'json',
																				data : {
																					imp_uid : rsp.imp_uid,
																					paid_amount : rsp.paid_amount ,
																					merchant_uid : rsp.merchant_uid,
																					pay_method : rsp.pay_method,
																					apply_num : rsp.apply_num,
								
																					user_no :  <%=user.getUser_no()%>,
																				//기타 필요한 데이터가 있으면 추가 전달
																				
																				
																				
																				}
																			})
																	.done(
																			function(data) {
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
																					
																					window.location = '/insertRecharge.rc';
																					
																				} else {
																					//[3] 아직 제대로 결제가 되지 않았습니다.
																					//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
																				}
																			});

														} else {
													        var msg = '결제에 실패하였습니다.';
													        msg += '에러내용 : ' + rsp.error_msg;

													        alert(msg);
													    }
													});

								} <%-- else {

									IMP.request_pay(
													{
														pg : 'jtnet',
														pay_method : 'trans',
														merchant_uid : 'merchant_'
																+ new Date()
																		.getTime(),
														name : '펫카부 펫시팅 서비스',
														amount : 14000,
														buyer_email : '<%=user.getEmail()%>',
														buyer_name : '<%=user.getUser_name()%>',
														buyer_tel : '<%=user.getPhone()%>',
														buyer_addr : '<%=user.getAddress()%>',
														buyer_postcode : '123-456'
													},
													function(rsp) {
														if (rsp.success) {
															//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
															jQuery.ajax(
																			{
																				url : "insertRecharge.rc", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
																				type : 'POST',
																				dataType : 'json',
																				data : {
																					imp_uid : rsp.imp_uid
																					paid_amount : rsp.paid_amount 
																					pay_method : rsp.pay_method
																					merchant_uid : rsp.merchant_uid
																					apply_num : rsp.apply_num
																					paid_at : rsp.paid_at
																					user_no :  <%=user.getUser_no()%>
																				   
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
																			});

														} else {
													        var msg = '결제에 실패하였습니다.';
													        msg += '에러내용 : ' + rsp.error_msg;

													        alert(msg);
													    }
													});

								} --%>
							});
		});
	</script>
	<%
		} else {
	%>
	<script>
		alert('로그인한 회원만 이용 가능합니다.')
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	

	<%
		}
	%>
</body>
</html>