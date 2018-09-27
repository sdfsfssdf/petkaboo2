<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.pkb.petsitterService.model.vo.*"%>
<% 
	PetsitterService p = (PetsitterService)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
#topArea{
	width:100%;
	display:inline-block;
	text-align:center;
}

#serviceDetail {
	display:inline-block;
	width:50%;
	height:250px;
	margin:auto;
	text-align:center;
	border:1px solid black;
}
#serviceDetail th{
	text-align:center;
}

#servicePhoto {
	display:inline-block;
	width:200px;
	height:250px;
	text-align:center;
	border:1px solid black;
}
#servicePhoto tr{
	margin:5px;
}
</style>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	<div class="topArea" id="topArea" name="topArea">
		<table id="servicePhoto" name="servicePhoto">
			<tr>
				<td>
					<% 
						String profileImage = null;
						if(!p.getProfileImage().equals("/nullnull")){
							profileImage = p.getProfileImage();
						}else{
							profileImage = "/images/profileImagesUpload/profileBasicImage.png";
						}
						%>
						<p><img height="auto;" width="200px;" height-max="200px;" src="<%=request.getContextPath()%><%= profileImage %>"></p>				
					</td>
			</tr>
			<tr>
				<td><b><%=p.getNickname() %> 펫시터</b></td>
			</tr>
			<tr>
				<td><%=p.getAddress() %></td>
			</tr>
		</table>
		<table id="serviceDetail" name="serviceDetail">
			<tr>
				<th width="100px"></th>
				<th width="100px">서비스 종류</th>
				<th width="200px">예약가능 요일</th>
				<th width="150px">시작 가능일</th>
				<th width="150px">종료일</th>
				<th width="100px">서비스가격</th>			
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
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
					<form class="orderInfo" id="orderInfo" name="orderInfo" method="post" action="<%=request.getContextPath()%>/selectOne.do">
					<input type="hidden" id="revLevel" name="revLevel" value="1">
					<input type="hidden" id="no" name="no" value="<%= p.getPet_service_regno() %>">
					<button class="pre-order" id="pre-order" onclick="submit()">예약하기</button>
					</form>
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
<script>
	function submit(){
		$("#orderInfo").submit();
	}
</script>
</body>
</html>