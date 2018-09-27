<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PETKABOO - Find Petsitter for your lovely pets</title>
<style>
#bottomDiv {
	display:inline-block;
	padding:10px;
}
.menu {
	display:inline-block;
	text-align:center;
}	
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp"%>
	<%@ include file="views/common/mainSearchForm.jsp" %>
	
	<div class="bottomDiv" id="bottomDiv" name="bottomDiv">
		<div id="menu1" class="menu">
		<img src="images/mainPageImgs/menu1.png">
		<span><h3>SERVICE</h3></span>
		<span>서비스 소개</span>
		</div>
		<div id="menu2" class="menu">
		<img src="images/mainPageImgs/menu4.png">
		<span><h3>SEARCH</h3></span>
		<span>펫시터찾기</span>
		</div>
		<div id="menu3" class="menu">
		<img src="images/mainPageImgs/menu3.png">
		<span><h3>STEP</h3></span>
		<span>이용절차</span>
		</div>
		<div id="menu4" class="menu">
		<img src="images/mainPageImgs/menu6.png">
		<span><h3>DEVELOPER</h3></span>
		<span>개발진 소개</span>
		</div>
		<div id="menu5" class="menu">
		<img src="images/mainPageImgs/menu5.png">
		<span><h3>VOICE</h3></span>
		<span>이용후기</span>
		</div>
		<div id="menu6" class="menu">
		<img src="images/mainPageImgs/menu2.png">
		<span><h3>APPLY</h3></span>
		<span>펫시터 신청</span>
		</div>
		<div id="menu7" class="menu">
		<img src="images/mainPageImgs/menu7.png">
		<span><h3>FAQ</h3></span>
		<span>고객센터</span>
		</div>
		<div id="menu8" class="menu">
		<img src="images/mainPageImgs/menu8.png">
		<span><h3>INTRODUCE</h3></span>
		<span>회사정보</span>
		</div>
	</div>
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