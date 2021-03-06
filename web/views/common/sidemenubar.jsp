﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 사이드바 메뉴</title>
<style>
.side-menu {
	margin: 80px auto;
	
	height: 800px;
	padding: 0;
	height: 700px;
	float: left;
}

ul#navi{
	width: 200px;
}

ul#navi ul li.group div.title {
	text-indent:0px;
}


ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

/* 주메뉴 */
li.group div.title {
	height: 50px;
	line-height: 50px;
	background: #9bcdf7;
	cursor: pointer;
	color:white;
	font-size:18px;
	text-align: center;
	font-family: 'Jua', sans-serif;
	
}

/* 서브메뉴 */
ul.sub li {
	margin-bottom: 2px;
	line-height: 50px;
	background: #f4f4f4;
	cursor: pointer;
	font-family: 'Jua', sans-serif;
	text-indent:10px;
	
}
 
ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	font-family: 'Jua', sans-serif;
	color: #000;
	font-size:16px;
}

ul.sub li:hover {
	background: #9bcdf7;
}

/* 드롭다운메뉴 */
ul.sub-sub{
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	font-family:'Jua', sans-serif;
	color: #000;
	font-size:14px;
	background: #f4f4f4;
	
}

ul.sub-sub li:hover{
background: #9bcdf7;
font-family:'Jua', sans-serif;
}

ul.sub ul.sub-sub{display:none;}

ul.sub li:hover > ul.sub-sub{display:block;} 


.getMyContractButton{
	background:transparent;
	border-style:none;
	font-size:16px;

}
.getMyContractButton:hover{
	color:black;
}

.lookcont:active{
outline:none;
cursor:pointer;
}

.lookcont:hover{
outline:none;
cursor:pointer;
}
</style>
</head>
<body>
				<div class="side-menu">
					<ul id="navi">
						<li class="group">
							<%
							if(loginUser != null && loginUser.getUser_grade() == 3){
							%>
							<div class="title">펫시터 관리</div>
							<ul class="sub">
								<li><a href="<%=request.getContextPath()%>/views/myPage/petSitterServiceInsertForm.jsp">펫시터 서비스 등록</a></li>
								<li><a href="<%=request.getContextPath()%>/search.do?user_no=<%=loginUser.getUser_no()%>">등록 펫시터 서비스 목록</a></li>
								<li>
								<form class="psContractManage" action="<%=request.getContextPath()%>/psContract.do" method="post">
								<input type="hidden" name="user_no" value="<%= loginUser.getUser_no() %>">
								<button class="lookcont" style="border-style:none; background-color:transparent; font-size:16px; font-family: 'Jua', sans-serif;">계약 현황 보기</button>
								</form>
								</li>
							</ul>
						</li>
							<% } %>
						<li class="group">
							<div class="title">서비스 관리</div>
							<ul class="sub">
								<li>
								<form class="getMyContractList" action="<%=request.getContextPath()%>/psContract.do" method="post">
								<input type="hidden" name="user_no" value="<%= loginUser.getUser_no() %>">
								<input type="hidden" name="request_client_list" value="1">
								<button class="getMyContractButton" style="background:transparent; border-style:none; font-size:16px; font-family: 'Jua', sans-serif;">내 계약 관리</button>
								</form>
								</li>
								<li><a href="<%=request.getContextPath()%>/selectCyberMoneyHistory.pm">거래내역</a></li>
								<li><a href="/pkb/views/myPage/onebyoneQNAWrite.jsp" >1:1 문의</a></li>
								<li><a href="<%=request.getContextPath()%>/selectOnebyOneList.bo">내 질문 내역</a></li>
							</ul>
						</li>
						<li class="group">
							<div class="title">개인 정보</div>
							<ul class="sub">
								<li><a href="<%=request.getContextPath()%>/modify.mb">개인정보 수정</a></li>
								<li><a href="/pkb/views/myPage/modifyPassword.jsp">비밀번호 변경</a></li>
								<li><a href="/pkb/views/myPage/modifyProfile.jsp">프로필 관리</a></li>
								<li><a>인증 관리</a>
									<ul class="sub-sub">
										<li><a href="/pkb/views/myPage/nameIdentify.jsp">실명 인증</a></li>
										<li><a href="/pkb/views/myPage/licenseIdentify.jsp">자격증 인증</a></li>
									</ul>
								
								</li>
								
								<!-- <li><a href="/pkb/views/myPage/registerPet.jsp">내 반려동물 등록</a></li> -->
							</ul>
						</li>
					</ul>
				</div>
				
				<script>
				 	
				 	 function rsv(){
				 		 location.href = "<%=request.getContextPath()%>/reservation.ps";
				 		 
				 	 }
				  
				 	 
				</script>
				
</body>
</html>