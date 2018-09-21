<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 사이드바 메뉴</title>
<style>
.side-menu {
	margin: 20px auto;
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
	background: #cfb7af;
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
	background: #cfb7af;
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
background: #cfb7af;
font-family:'Jua', sans-serif;
}

ul.sub ul.sub-sub{display:none;}

ul.sub li:hover > ul.sub-sub{display:block;} 

</style>
</head>
<body>

	
				<div class="side-menu">

					<ul id="navi">
					
						<li class="group">
							<div class="title">펫시터 관리</div>
							<ul class="sub">
								<li><a href="../myPage/petSitterServiceInsertForm.jsp">펫시터 서비스 등록</a></li>
								<li><a href="#">펫시터 정보 수정</a></li>
								<li><a href="#">수입 현황</a></li>
								<li><a href="#">돌봄일지</a></li>
							</ul>
						</li>
						<li class="group">
							<div class="title">서비스 관리</div>
							<ul class="sub">
								<li><a href="../myPa">예약현황</a></li>
								<li><a href="#">거래내역</a></li>
								<li><a href="../myPage/onebyoneQNAWrite.jsp" >1:1 문의</a></li>
								<li><a onclick="goOnebyOneQna()">내 질문 내역</a></li>
							</ul>
						</li>
						<li class="group">
							<div class="title">개인 정보</div>
							<ul class="sub">
								<li><a href="../myPage/modifyMemberInfoMain.jsp">개인정보 수정</a></li>
								<li><a href="../myPage/modifyPassword.jsp">비밀번호 변경</a></li>
								<li><a href="../myPage/modifyProfile.jsp">프로필 관리</a></li>
								<li><a>인증 관리</a>
									<ul class="sub-sub">
										<li><a href="../myPage/nameIdentify.jsp">실명 인증</a></li>
										<li><a href="../myPage/licenseIdentify.jsp">자격증 인증</a></li>
									</ul>
								
								</li>
								
								<li><a href="#">내 반려동물 등록</a></li>
							</ul>
						</li>
					</ul>
				</div>
				
				<script>
				 	 function goOnebyOneQna(){
						location.href = "<%=request.getContextPath()%>/selectOnebyOneList.bo";
						
					}
				  
				</script>
				
</body>
</html>