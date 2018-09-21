<%@page import="com.pkb.member.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% User loginUser = (User)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
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
<title>개인정보 수정</title>
<style>
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0;ㅇㄹ
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
#header {
	float: left;
	width: 100%;
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
}

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
}

/* 프로필수정 */
.center-content1 {
	float: left;
	width: 100%;
	height: 700px;
	margin-top: 30px;
	margin-bottom: 30px;
	/* 	background: #edeef0;
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
	text-align:center;
	border-bottom: 1px solid #ddd;
	font-size: 15px;
	border: 1px solid #ddd;
}



.photo {
	float: left;
	width: 100%;
	height: 450px;
	/* background: #edeef0;
border: 1px solid black; */
	margin: auto;
}

.modanddelete {
	float: left;
	width: 100%;
	height: 50px;
	/* background: #edeef0;
border: 1px solid black; */
	margin: auto;
	margin-top: 20px;
}

/* 적용 취소 부분 */
.submitandcancle {
	text-align: center;
	margin-top: 20px;
}

#modify, #delete, #submit, #cancel {
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



.phone1 {
	width: 100%;
	height: 50px;
	/* background: #edeef0;
	border: 1px solid black; */
	padding: 10px;
	text-align: left;
}

.phone2 {
	width: 100%;
	height: 40px;
	
	/*border: 1px solid black;
	background: #edeef0; */
	margin-top: 10px;
}

.phone2-1 {
	width: 30%;
	/* background: #edeef0;
	border: 1px solid black; */
	text-align: left;
	float: left;
}

.phone2-2 {
	width: 50%;
	/* background: #edeef0;
	border: 1px solid black; */
	text-align: left;
	float: left;
}

.phone2-3 {
	width: 15%;
	/* background: #edeef0;
	border: 1px solid black; */
	text-align: left;
	float: left;
	margin-left:10px;
}

.phone3 {
	width: 100%;
	height: 50px;
	float: left;
	text-align: left;
/* 	border: 1px solid black;
	background: #edeef0; */
	margin-top: 10px;
}

#modify:hover, #delete:hover . #submit:hover, #cancel:hover {
	color: black;
	opacity: 0.7;
	font-family: 'Jua', sans-serif;
	font-size: 17px;
	color: white;
	border: none;
	border-radius: 0.5em;
	width: 80px;
	height: 50px;
	line-height: 38px;
	background-color: #cfb7af;
	font-family: 'Jua', sans-serif;
}

#submitphone, #cancelphone, #identify, #modifypassword {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	text-decoration: none;
	font-size: 15px;
	color: white;
	border: none;
	border-radius: 0.5em;
	width: 80px;
	height: 30px;
	
	background-color: #cfb7af;
	font-family: 'Jua', sans-serif;
}



.modifyphone {
	margin-top: 30px;
	width: 100%;
	height: 40px;
	/* background: #edeef0;
	border: 1px solid black; */
	float: left;
	text-align: center;

	margin-top: 10px;
}
</style>
</head>
<body>


	<div id="wrap">
		<div id="header">
			<h1 align="center">펫카부</h1>
		</div>
		<div id="container1">

			<!-- 메뉴파일 -->
			<%@ include file="../common/menubar.jsp"%>


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
					<h3 align="center"
						style="font-weight: bold; font-family: 'Jua', sans-serif;">마이페이지</h3>
					<hr
						style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				</div>



				<br>


				<!-- 개인정보 수정 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold;">개인정보
					수정</span>
				<hr
					style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				<div class="center-content1">

					<table>

						<tr>
							<td width=300px; height=100px>휴대전화</td>

							<td colspan="2" width=800px; height=200px>
								<form action="#">
									<div class=phone>
										<div class="phone1">
											<input type="text" name="name" size='20' maxlength='15'
												style="width: 300px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0"
												value="010-7777-7777" readonly>
										</div>
										<div class="phone2">

											<div class="phone2-1">
												<form action="#">
													<select style="height: 30px" name="cars">
														<option value="fornum1">휴대폰 번호 선택</option>
														<option value="fornum1">010</option>
														<option value="fornum2"">011</option>
														<option value="fornum3"">016</option>
														<option value="fornum4"">017</option>
														<option value="fornum5"">018</option>
														<option value="fornum6"">019</option>
													</select> <br>
												</form>

											</div>

											<div class="phone2-2">

												<input type="text" name="inputidenphone" size='20'
													maxlength='20'
													, style="width: 300px; height: 30px; margin: 0; color: black; border-width: 1px;"
													value="번호를 입력해주세요">

											</div>

											<div class="phone2-3">
												<button id="identify" onclick="#">인증</button>
											</div>


										</div>


										<!-- 수정완료 수정취소 -->
										<div class="phone3">
											<p style="font-size: 15px";>인증번호 입력</p>
											<input type="text" name="inputphone" size='20' maxlength='20'; style="width: 300px; height: 30px; margin: 0; color: black; border-width: 1px">
										</div>

										<div class=modifyphone>
											<button type="submit" id="submitphone" onclick="#"
												style="font-weight: lighter">수정완료</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="submit" id="cancelphone" onclick="#"
												style="font-weight: lighter">수정취소</button>

										</div>
									</div>

								</form>
							</td>
						</tr>
						<tr>
							
							<td width=300px; height=100px>주소</td>

							<td colspan="2" width=800px; height=100px>
							<div class="address" align="left">
									<span>현재 주소 :</span>&nbsp;&nbsp;&nbsp;<input type="text" name="name" size='20' maxlength='15'
										style="width: 300px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0"
										<% if(loginUser != null){
											if(loginUser.getAddress()==null){ %>
				
											value="지정된 주소가 없습니다."
									<% }else{ %>
											value="<%=loginUser.getAddress()%>"
										<% }} %>	 readonly><br>
				<form method="get" action="<%=request.getContextPath()%>/modifyAdd.ma">			
				<input type="text" id="postcode"  name="postcode" style="width: 100px; height: 30px;" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" style="width: 100px; height: 30px;" value="주소 찾기"><br>
				<input type="text" id="address"  name="address" style="width: 300px; height: 30px;"  placeholder="주소" >
				<input type="text" id="addressDetail" name="addressDetail" style="width: 300px; height: 30px;"  placeholder="상세주소">
								</div>
							</td>
		
						</tr>
						<tr>
							<td width=300px; height=70px>비밀번호</td>
							<td colspan="2" width=800px; height=70px>
							<div class="modifypassword" align="left">
							<button id="modifypassword" onclick="location.href='modifyPassword.jsp'"
									style="font-weight: lighter">변경하기</button>
							</div>
							</td>
						</tr>
					</table>
					<div class=submitandcancle>
						<button type="submit" id="submit" style="font-weight: lighter">적용</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" id="cancel" onclick="#"
							style="font-weight: lighter">취소</button>
					</div>
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
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
				<script>
				    function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = ''; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				
				                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    fullAddr = data.roadAddress;
				
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    fullAddr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				                if(data.userSelectedType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('address').value = fullAddr;
				
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById('addressDetail').focus();
				            }
				        }).open();
				    }
				</script>
								

</body>
</html>