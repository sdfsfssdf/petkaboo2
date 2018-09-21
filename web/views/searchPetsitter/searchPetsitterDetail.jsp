<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.pkb.petsitterService.model.vo.*"%>
<% 
	PetsitterService p = (PetsitterService)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터상세보기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
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
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
}

.top-body {
	margin-top: 1%;
	margin-left: 20%;
	margin-right: 20%;
	/* border: 1px solid black; */
	display: inline-block;
}

.photo-detail {
	margin-left: 6%;
	width: 40%;
	height: 30%;
	display: inline-block;
	float: left;
}

.photo {
	display: inline-block;
	width: 500px;
}

nav ul {
	position: :relative;
	margin: 0;
	padding: 0;
	width: 100%;
	text-align: left;
	display: inline-block;
}

nav ul li {
	display: inline;
	margin-bottom: 1%;
}

nav {
	margin-top: 3%;
	margin-bottom: 3%;
	display: inline-block;
	width: 450px;
	height: 56px;
}

#nav-icon {
	width: 8%;
	height: 8%;
	margin-bottom: 10%;
}

.photo-box {
	width: 80px;
	height: 50px;
	background: lightgray;
	border: 1px solid black;
	display: inline-block;
}

.petsitter-id {
	margin-right: 6%;
	width: 30%;
	height: 40%;
	float: right;
	display: inline-block;
	float: right;
}

.PSid {
	margin-left: auto;
	margin-rignt: auto;
	margin-top: 2%;
	marign-bottom: auto;
	width: 300px;
	height: 400px;
	background: lightgray;
	display: inline-block;
}

td {
	border: 1px solid red;
}

.PSidTable {
	
}

.PSphoto {
	width: 127px;
	height: 127px;
	display: inline-block;
}

.l {
	width: 100%;
	text-align: center;
}
</style>
<body>
	<div class="header">
		<div id="header"></div>
		<%@include file="/views/common/menubar.jsp"%>
		<br /><br /><br />
		<div class="top-body">
			<div class="photo-detail" width="400px" height="300px">
				<div>
					<img
						style="width: 300px; height: 300px; margin-left: auto; margin-right: auto; margin-top: 2%; margin-bottom: 2%;"
						src="https://scontent-lhr3-1.cdninstagram.com/vp/ac8121339280924d9df4b40835a0d470/5C0572B3/t51.2885-15/e35/38777651_2135674779789937_5511126361474859008_n.jpg?se=7&ig_cache_key=MTg0NzAwNDU1MjU1NDIzMDg4Mw%3D%3D.2"
						alt="" />

				</div>
			</div>

			<div class="petsitter-id">
				<div class="PSid">
					<div class="l">
						<img
							src="https://pbs.twimg.com/profile_images/984239725190901760/-5wrSANU_400x400.jpg"
							class="PSphoto img-circle img-responsive" alt="Responsive image" />
					</div>
					<table width="200px" height="200px"
						style="margin-left: auto; margin-right: auto; margin-top:20px; margin-bottom:auto;">
						<tr>
							<td colspan="3" ><div width="100%" text-align="center"><%=p.getNickname() %> 펫시터<br><%=p.getAddress() %><br>☆★★★★ 8명 평가</div></td>
						</tr>
						<tr>
							<td>강아지<br />30000원</td>
							<td>고양이<br />30000원</td>
							<td>물고기<br />10000원</td>
						</tr>
						<tr>
							<td colspan="3">*정확한 가격 책정을 위한 <a href="#" >1:1문의하기</a></td>
						</tr>
					</table>
					<button class="btn btn-default" type="submit" style="width:80%; margin-left:auto; margin-right:auto; ">예약하기</button>
				</div>
			</div>

			<div class="photo">
				<nav>
				<ul>
					<li><a href="#"><img
							src="https://cdn.icon-icons.com/icons2/38/PNG/512/back_arrow_5821.png"
							alt="" id="nav-icon"></a></li>
					<li><a href="#"><div class="photo-box"></div></a></li>
					<li><a href="#"><div class="photo-box"></div></a></li>
					<li><a href="#"><div class="photo-box"></div></a></li>
					<li><a href="#"><img
							src="https://cdn.icon-icons.com/icons2/38/PNG/512/forwardarrow_haciaadelante_4836.png"
							alt="" id="nav-icon"></a></li>
				</ul>
				</nav>
			</div>



			<div>

				<h2 style="margin-top: 100px;">
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;펫시터 소개 </strong>
					</span>
				</h2>
				<hr />
				<br />
				<h5 >
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;펫시팅 관련 경험을 알려주세요. </strong>
					</span>
				</h5>
				<br />
				<p>&nbsp;&nbsp;&nbsp;펫시팅을 해 본 경험은 어렸을 때부터 있었습니다. 어렸을 때부터 강아지와 함께 자라온 터라, 주변에서 여행을 가거나 무슨 사정이 있을 경우에 지인분들께서 저희 집에 맡기고 가시고는 하셨습니다. 항상 새로운 강아지를 만나는 것은 즐겁고 너무 귀여워서 하루종일 보고 있었던 것 같습니다. 이러한 경험들을 바탕으로 사랑스럽고 귀여운 강아지를 자상하고 세심하게 돌봐줄 자신이 있습니다!
				<br />
				</p>
				<br />
				<h5 >
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;함께한 동물과의 이야기를 들려주세요. </strong>
					</span>
				</h5>
				<br />
				<p>
				&nbsp;&nbsp;&nbsp;현재 본가에 16년동안 함께 지내온 강아지가 있습니다. 견종은 요셔테리어이고 이제 할머니 입니다. 16년동안 강아지와 지내면서 부득이한 사정으로 1일~2일정도 호텔에 맡길 때마다 힘들어하는 강아지를 보면 저희 가족들도 미안한 마음이 들었습니다. 그래서 떨어져 있어애 하는 상황이 있을 때마다 강아지 때문에 망설여 졌습니다. 이러한 마음을 저는 모두 이해하고 있고 강아지와 오랜시간 함께 지내왔기 때문에 어떻게 케어를 해주어야 하는지 잘 알고 있습니다.
				</p>
				<br />
				<h5 >
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;자신만의 노하우를 알려주세요. </strong>
					</span>
				</h5>
				
				<br />
				<p>
					&nbsp;&nbsp;&nbsp;처음에 강아지가 낯선 환경에 잘 적응할 수 있도록 마음껏 집안 내부를 돌아다니게 할 예정입니다. 또한 많은 관심과 고객님과의 실시간 소통으로 안심하실 수 있도록 합니다.
				</p>
				<br />
				
				<br />
				<h2 style="margin-top: 20px;">
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;무료 부가 서비스 </strong>
					</span>
				</h2>
				<hr />
				<br />
				<h2 style="margin-top: 20px;">
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;고객 준비물</strong>
					</span>
				</h2>
				<hr />
				<br />
				<h2 style="margin-top: 20px;">
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;펫시팅 불가 항목</strong>
					</span>
				</h2>
				<hr />
				<br />
				<h2 style="margin-top: 20px;">
					<span style="color: rgb(228, 100, 18);"> <strong>
							&nbsp;&nbsp;&nbsp;평점 및 이용후기</strong>
					</span>
				</h2>
				<hr />
				
				<div>
					<table>
						<tr>
							<td>펫시터 등급 <br />☆☆☆☆☆</td>
							<td>
								☆☆☆☆☆(x건)
								☆☆☆☆☆(x건)
							☆☆☆☆☆(x건)
							☆☆☆☆☆(x건)
							</td>
						
						</tr>
						
						
					</table>				
				</div>
				
			</div>









		</div>
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
	<br />
	<br />
	<br />
	<br />
</body>
</html>