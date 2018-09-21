<%@page import="com.pkb.member.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html><br>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PETKABOO - Find Petsitter for your lovely pets</title>
<style>	
	#topView {
		background:lightgray;
		height:400px;
		width:100%;
		margin-left:auto;
		margin-right:auto;
	}
	
	#topView img {
		width:100%;
		height:100%;
	}
	
	.menu{
		width:18%;
		height:230px;
		margin:3%;
		display:inline-block;
		text-align: center;
		padding-top:20px;
		margin-bottom:0px;
	}
	
	.leftMenu{
		margin-left:5%;
	}
	
	.rightMenu{
		margin-right:5%;
	}
	
	.paddingDiv {
		height:70px;
		width:100%;
	}
	
	.navbar-form pull-left {
		position:absolute;
	}
	
	.menu img {
		width:100%;
		height:80%;
	}
	
	.menuPadding {
		width:100%;
		height:30px;
	}
	
	.reviewArea {
		width:100%;
		height:300px;
		padding-left:100px;
		padding-right:100px;
	}
	
	.star_rating {
		display:inline-block;
	}
	.star_rating a {
		font-size:22px;
		letter-spacing:0;
		display:inline-block;
		margin-left:5px;
		color:#ccc;
		text-decoration:none;
	}
	
	.star_rating a.on {
		color:yellow;
	}
	
	.reviewArea h4{
		display:inline-block;
		margin-left:100px;
	}
	
	
	.reviewPicture{
		width:40%;
		height:200px;
		background:lightgray;
	}
	 .loginArea{
	   	float:right;
	   	color:lightgray;
	   	text-decoration:none;
   }
   .loginArea:hover{
   		font-weight:bold;
   		text-decoration:none;
   	}
   .topArea{
		position:relative;
		overflow:hidden;
		width:100%;
		min-width:800px;
	}
	.topArea.loginArea{
		position:relative;
		overflow:hidden;
		height:54px;
		width:100%;
	}
   .topArea h1{
		text-decoration:none;
		position :relative;
		overflow: hidden;
		padding: 15px 0 0 15px;
	}
	.topArea ul{
		position: relative;
		overflow: hidden;
		float : right;
		padding : 16px 15px 0 0;
		text-decoration:none;
	}
	.login{
		text-decoration:none;
	}
	.logined{
		float : right;
	}
</style>

</head>
<body>
		<%
			String email =null;
			User login = (User)session.getAttribute("loginUser");
			if(session.getAttribute("loginUser")!=null){
			email = login.getEmail();
			}
		%>
	<div class="topArea">
		<h1 align="center" id="logo">로고</h1>
		
		  <%
			if(email == null){
		   %>
			<ul class="loginArea">
				<li class="login"><a href="views/common/login.jsp">로그인</a></li>	
			</ul>
			<ul class="loginArea">
				<li class="join"><a href="views/member/joinForm.jsp">회원가입</a></li>
			</ul>	
		<%
			}else{
		%>	
			<div class=logined>
				<button onclick="location.href='views/myPage/mypagemain.jsp'">마이페이지</button>
				<ul class="loginArea">
					<li class="logout"><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
				</ul>
			</div>
		<%
			}
		%>
	</div>
	<div id="menuBar">
		<%@ include file="views/common/menubar.jsp"%>
	</div>
	<div id="searchBox">
		<%@ include file="views/common/mainSearchForm.jsp" %>
	</div>
	
	<div class="paddingDiv"></div>
	<div class="menu leftMenu"><img src="images/mainPageImgs/menu1.png"><div class="menuPadding"></div><span><h3>SERVICE</h3></span><span>서비스 소개<span></span></div><div class="menu"><img src="images/mainPageImgs/menu4.png"><div class="menuPadding"></div><span><h3>SEARCH</h3></span><span>펫시터찾기</span></div><div class="menu"><img src="images/mainPageImgs/menu3.png"><div class="menuPadding"></div><span><h3>STEP</h3></span><span>이용절차</span></div><div class="menu rightMenu"><img src="images/mainPageImgs/menu6.png"><div class="menuPadding"></div><span><h3>DEVELOPER</h3></span><span>개발진 소개</span></div><br>
	<div class="menuPadding"></div><div class="menuPadding"></div>
	<div class="menu leftMenu"><img src="images/mainPageImgs/menu5.png"><div class="menuPadding"></div><span><h3>VOICE</h3></span>이용후기<span></span></div><div class="menu"><img src="images/mainPageImgs/menu2.png"><div class="menuPadding"></div><span><h3>APPLY</h3></span>펫시터 신청<span></span></div><div class="menu"><img src="images/mainPageImgs/menu7.png"><div class="menuPadding"></div><span><h3>FAQ</h3></span><span>고객센터</span></div><div class="menu rightMenu"><img src="images/mainPageImgs/menu8.png"><div class="menuPadding"></div><span><h3>INTRODUCE</h3></span>회사정보<span></span></div>
	<div class="paddingDiv"></div>
	
	<div class="paddingDiv"></div>
	<h4 align="center">ㅡ</h4>
	<h4 align="center">REVIEW</h4>
	
	<!-- 반복문으로? 아니면 뭐 필요한만큼해서 리뷰 보여줄갯수 보여주면 될듯 -->
	<div class="reviewArea">
		<p>정말 고마웠어요^^(제목)</p>
		<p class="star_rating">
			<a class="on">★</a>
			<a class="on">★</a>
			<a class="on">★</a>
			<a class="">★</a>
			<a class="">★</a>
		</p>
		<h4>이주혁 펫시터</h4>
		<div class="reviewPicture"></div>
		<pre>급하게 여행계획이 잡혀 아이들 케어를....
펫시터분들을 예약하기 힘든데도 ...
펫시터님 너무 고마웠어요!! ^^
(후기내용 들어갈 영역)
	</pre>
	</div>
	<br>
	
</body>
</html>