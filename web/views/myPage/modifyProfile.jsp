<%@page import="java.util.HashMap"%>
<%@page import="com.pkb.member.model.vo.ImgFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User u = (User)request.getSession().getAttribute("loginUser");
	ImgFile img = (ImgFile)request.getAttribute("profile");
%>
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

/* #footer {
	float: left;
	width: 100%;
	height: 250px;
	margin: 100px 0 30px 0;
	background: #e1e1e1
} */


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
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
user-select: none;
border: 1px solid transparent;
    border-radius: 4px;
}

/* .rechbutton:hover {
	color: black;
	opacity: 0.7;
	font-family: 'Jua', sans-serif;
} */

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
	width:80px;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
	user-select: none;
	border: 1px solid transparent;
    border-radius: 4px;
}


</style>
</head>
<body>
	<div id="wrap">
		
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

				<br> <br><br>

				<!-- 마이페이지 타이틀부분 -->
			
					
					<hr
						style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				
				<br>
				<!-- 프로필 수정 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold;">프로필 관리</span>
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
								<div id="contentImgArea">
									<%if(img != null) {%>
									<Img class=profileImg id="foo" style="width:450px;height:450px;" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=img.getFile_name()%>">
 									<%} else{ %>
 									<Img class=profileImg id="foo" style="width:450px;height:450px;" src="<%=request.getContextPath()%>/images/profileImagesUpload/profileBasicImage.png">
 									<%} %>
								</div>
							</div>
							
							<div class=modanddelete>
								<input type="file" id="imgInp" name="profile"  onchange="loadImg()" style="font-weight:lighter; margin-left:300px"></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <button id="delete" style="font-weight:lighter">삭제</button> -->
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
					<button type="submit" id="submit" style="background:#9bcdf7; color:white; border-style:#9bcdf7;">적용</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="cancel" onclick="modifyMemberInfoMain" style="background:white; color:#9bcdf7; border:1px solid #9bcdf7;">취소</button>
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
						<img src="../../images/myPageImgs/info1.png" width="65%" height="250px">
					</div>



					<div class="bottom-content1">
						<img src="../../images/myPageImgs/info2.png" width="65%" height="250px">
					</div>
				</div>

			</div>
			<!-- 	
			<div class="content-right">
			
			</div> -->



			<!-- footer -->
		<%@ include file="/views/common/footer.jsp" %>
		</div>
	</div>
		<script>
		<%-- 	$("#delete").click(function(){
					var src = <%=img.getFile_path()%>;
					var fileNo = <%=u.getFile_no()%>;
					var userNo = <%=u.getUser_no()%>;
					location.href="<%=request.getContextPath()%>/deleteTitleProfile.me?src="+src+"$fileNo="+fileNo+"&userNo="+userNo;
			}); --%>
			function readURL(input) {
		
		    if (input.files && input.files[0]) {
		      var reader = new FileReader();
		      reader.onload = function(e) {
		        $('#foo').attr('src', e.target.result);
		      }
		      reader.readAsDataURL(input.files[0]);
		    }
		  }
		  $("#imgInp").change(function() {
		    readURL(this);
		  });
		  
		</script>

</body>
</html>