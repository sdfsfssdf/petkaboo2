<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pkb.member.model.vo.*"%>
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
<title>반려동물 등록</title>

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
	height: 150px;
	_border: 1px solid blue;
	background-color: white;
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

/* 비밀번호 변경 */
.center-content1 {
	margin: auto;
	text-align: center;
	width: 100%;
	height: 500px;
	/* border:1px solid black;
background-color:#eee;  */
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

 input[type=text], select {
    width: 90%;
    padding: 12px 20px;
    margin: 8px 0; 
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    display:inline-block;
    
}

input[type=date] {
 width: 90%;
    padding: 12px 20px;
    margin: 8px 0; 
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    display:inline-block;
}

input[type=textarea] {
	width: 90%;
    height : 200px;
    margin: 8px 0; 
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    
}

button[type=submit] {
    width: 30%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    
}

button[type=submit]:hover {
    background-color: #45a049;
}

.Petreginfo{
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    width:80%;
    margin-left: 100px;
    float:left;
    text-align:left;
} 





</style>
</head>
<body>


	<div id="wrap">
		<div id="header"></div>
		<%@ include file="../common/menubar.jsp"%>
		<%@include file="../common/oldMenubar.jsp"%>
		
		<%
				if (loginUser != null) {
		%>
		
		
		<div id="container1">
		
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


				<!-- 반려동물 등록 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold;">반려동물
					등록</span>
				<hr
					style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				<div class="center-content1">

					<div class="Petreginfo">
						<form action="<%=request.getContextPath()%>/insertPet.pi" method="post">
							<label>이름</label><br> <input type="text" id="petName"
								name="petName" placeholder="반려동물의 이름을 입력해주세요." required>
							<br>
							<br> <label>동물 종류</label><br> <input type="text"
								id="petCategory" name="petCategory" placeholder="종류를 입력해주세요."
								required> <br>
							<br> <label>생년월일</label><br> <input type="date"
								id="petBirth" name="petBirth" required> <br>
							<br> <label>무게</label><br> <input type="text"
								id="petWeight" name="petWeight" placeholder="무게를 입력해주세요."
								required>&nbsp; kg <br>
							<br> <label>성별</label><br> <select id="petGender"
								name="petGender" required>
								<option value="">-----</option>
								<option value="M">수컷</option>
								<option value="F">암컷</option>
							</select> <br>
							<br> <label>중성화 여부</label><br> <select
								id="neutralization" name="neutralization" required>
								<option value="">-----</option>
								<option value="O">했어요</option>
								<option value="X">안했어요</option>
							</select> <br>
							<br> <label for="fname">기타 사항</label><br> <input
								type=textarea> <br>
							<br> 
							<br> 
							<label>&nbsp;&nbsp;<input type="checkbox" id="okcheck">&nbsp;&nbsp;사실과 다른 정보를 입력했을 시 불이익이 있을 수 있으며, 그에 대한 책임은 사용자에게 있음을 동의합니다.</label>
							<br> 
							<br> 
							<br> 
							<br> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
							<button type="submit" id="submit">등록</button>
							<br> <br>
							
							
						</form>
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

	<script>
	$(function() {
		$('#submit').click(function() {
			if (!$("input:checkbox[id=okcheck]:checked").val()) {
				alert('아래 사항에 동의해주셔야 합니다.');
				return false;
			}
		})

	})
	
	
	
	
	</script>

	<%} else {%>
	<script>
		alert('로그인한 회원만 이용 가능합니다.')
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
			<!--  request.getRequestDispatcher("../common/login.jsp").forward(request, response);  -->

		<%}%>
	
</body>
</html>
