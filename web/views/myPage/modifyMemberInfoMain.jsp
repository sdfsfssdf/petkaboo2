<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pkb.member.model.vo.User" %>
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
<title>개인정보 수정 메인</title>
<style>
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
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

/* 개인정보 관리 */
.center-content1 {
	float: left;
	width: 100%;
	height: 700px;
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
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

.row {
	width: 100%;
	height: 300px; 
/* 	background-color : #eee; */
/* 	border: 1px solid black; */
	padding: 10px;
	margin: 0 20px 0 0;
	text-align:left;
}

.element {
	width: 45%;
	height: 280px;
	margin: 0 15px 0px 0px;
	padding: 15px;
	/* display: inline-block; */
	float:left;
/* 	border: 1px solid black; */
	background-color: #eee;
	margin-left:30px;
}

.circleimg {
	width: 35%;
	height: 180px;
	float: left;
	margin-top: 10px;
	border: 1px solid lightgray;
	background-color: #eee;
	border-radius: 100%;
	background-color: #eee;
	border: 1px solid lightgray;
}

.nicknamespan {
	width: 40%;
	height: 100px;
	margin-top: 10px;
	margin-left: 10px;
	float: left;
	background-color: #eee;
}

.modibutton {
	width: 15%;
	height: 30px;
	float: left;
	background-color: #eee;
	margin-top: 170px;
}

#modifyprofile {
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

.info {
	width: 80%;
	height: 200px;
	float: left;
	background-color: #eee;
}

.mname, .memail, .maddress {
	width: 100%;
	display: inline-block;
	text-align: left;
	background-color: #eee;
	float:left;
}

.modipass {
	width: 100%;
	text-align: left;
	background-color: #eee;
	margin-top: 50px;
}
.mlicense, .midentify, .mphone {
	width: 100%;
	height:40px;
	display: inline-block;
	text-align: left;
	background-color: #eee;


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
				<%@ include file="../common/sidemenubar.jsp"%>


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


				<!-- 개인정보 관리-->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold;">개인정보
					관리</span>
				<hr
					style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				<div class="center-content1">
					<!-- 상단 -->
					<div class="row">
						<!-- 프로필 수정 -->
						<div class="element">
							<p style="text-align: left; font-size: 17px; font-weight: bold;">프로필
								수정</p>
							<br>
							<!-- 사진부분 -->
							<div class=circleimg></div>
						
							<!-- 닉네임 -->
							<div class=nicknamespan>
								<span style="text-align: left">닉네임 : </span>&nbsp;<input
									type="text" name="nimknamespann" size="20" maxlength="15"
									style="width: 50px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"
									<% if(loginUser != null){%>
									value="<%=loginUser.getNickname()%>"
									<% } %> readonly>
							</div>
							<!-- 수정버튼 -->
							<div class=modibutton>
								<button id=modifyprofile onclick="location.href='modifyProfile.jsp'">수정하기</button>
							</div>
						</div>
						<!-- 개인정보수정 -->
						<div class="element">
							<p style="text-align: left; font-size: 17px; font-weight: bold;">개인정보
								수정</p>
							<br>
							<!-- 개인정보 표시부분 -->
							<div class=info>
								<div class=mname>
									<span style="text-align: left">이름 : </span>&nbsp;<input
										type="text" name="nimknamespann" size="15" maxlength="10"
										style="width: 50px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"
									
										<% if(loginUser != null){
											if(loginUser.getUser_name()==null){ %>
											value="지정된 주소가 없습니다."
										<% }else{ %>
											value="<%=loginUser.getUser_name()%>"
										<% }} %> readonly>
								</div>
			
								<div class=memail>
									<span style="text-align: left">이메일 : </span>&nbsp;<input
										type="text" name="nimknamespann" size="20" maxlength="15"
										style="width: 200px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"
										<% if(loginUser != null){%>
											value="<%=loginUser.getEmail()%>"
										<% } %> readonly>
								</div>
								<div class=maddress>
									<span style="text-align: left">주소 : </span>&nbsp;<input
										type="text" name="nimknamespann" size="80" maxlength="60"
										style="width: 300px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"	
										<% if(loginUser != null){%>
											value="<%=loginUser.getAddress()%>"
										<% } %>	 readonly>
								</div>


							</div>
							<!-- 수정버튼 -->
							<div class=modibutton>
								<button id=modifyprofile onclick="location.href='modifyMemberInfo.jsp'">수정하기</button>
							</div>
						</div>
					</div>

					<!-- 하단 -->
					<div class="row">


						<div class="element">
							<p style="text-align: left; font-size: 17px; font-weight: bold;">비밀번호
								변경</p>

							<div class="modipass">
								<a href="modifyPassword.jsp">비밀번호 변경하기</a>

							</div>

						</div>
						<div class="element">
							<p style="text-align: left; font-size: 17px; font-weight: bold;">인증하기</p>
							<br>
						
							<div class=identify>
								<div class=mlicense>
									<a href="#">자격증 인증하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="text" name="license" size="80" maxlength="60"
										style="width: 300px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"
										value="미인증" readonly="">
								</div>
								<br>
								<div class=midentify>
									<a href="#">실명 인증하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="text" name="identify" size="80" maxlength="60"
										style="width: 300px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"
										value="미인증" readonly="">
								</div>
								
								<div class=mphone>
									<a href="#">휴대폰 인증하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="text" name="phone" size="80" maxlength="60"
										style="width: 300px; color: black; margin: 0; padding: 0; height: 35px; border-width: 0; background-color: #eee;"
										value="미인증" readonly="">
								</div>
							</div>
	
						</div>
					</div>

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

</body>
</html>