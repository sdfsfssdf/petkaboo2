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
<title>프로필 수정</title>
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
	text-align: center;
	border-bottom: 1px solid #ddd;
	font-size: 15px;
	font-weight:bold;
	border: 1px solid #ddd;
}

.photo{
float:left;
width: 100%;
height:450px;
/* background: #edeef0;
border: 1px solid black; */
margin:auto;

}
.modanddelete{
float:left;
width: 100%;
height:50px;
/* background: #edeef0;
border: 1px solid black; */
margin:auto;
margin-top:20px;
}
/* 적용 취소 부분 */
.submitandcancle{
	text-align:center;
	margin-top:20px;
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
#modify:hover, #delete:hover. #submit:hover, #cancel:hover {
	color: black;
	opacity: 0.7;
	font-family: 'Jua', sans-serif;
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
				<!-- 프로필 수정 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold;">프로필
					수정</span>
				<hr
					style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				<div class="center-content1">
									
					<form action="<%=request.getContextPath()%>/insert.tn" method="post" encType="multipart/form-data">	
					<table>
						<tr>
							<td width=300px; height=500px;>프로필 사진</td>
							<td colspan="2"; width=800px; height=300px>
							<!-- 사진 -->
							<div class="photo">
								<img id="profileImg" width=450px; height=450px; alt="" />
							</div>
							
							<div class=modanddelete>
								<input type="file" id="profile" name="profile" onchange="loadImg()" style="font-weight:lighter">사진변경</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="delete" style="font-weight:lighter">삭제</button>
							</div>					
							</td>
						</tr>
<!-- 	<button id="modify" onclick="#" style="font-weight:lighter">사진변경</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="delete" onclick="#" style="font-weight:lighter">삭제</button>
 -->					
						<tr>
							<td width=300px; height=100px>별명</td>
							<td colspan="2"; width=800px; height=100px>
								<div class="nickName">
									<input type="text" id="nickName" name="nickname" size='20' maxlength='15'  
										style="width:300px; color:black; margin:0; 
										padding:0; height:35px; border-width:1px" placeholder="별명을 입력하세요">
								</div>
							
							</td>


						</tr>

					</table>
					
					<div class=submitandcancle>
					<button type="submit" id="submit" style="font-weight:lighter">적용</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="cancel" onclick="modifyMemberInfoMain" style="font-weight:lighter">취소</button>
					</div>
					</form>	
				</div>

				<script>
					function loadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){
								$("#profileImg").attr("src", e.targetresult);
							}
						}
						reader.readAsDataURL(value.files[0]);
					}
				</script>



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