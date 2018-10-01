<%@ page import="com.pkb.member.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PETKABOO - Find Petsitter for your lovely pets</title>
<style>
.menubarOuter {
	margin-top:15px;
	padding:15px;
}
#upperLogo {
	text-align:center;
	margin-bottom:30px;
}
#upperLoginArea {
	text-align:right;
}
#upperMenu {
	width:50%;
	height:50px;
}

#upperMenu ul{ 
	list-style-type:none;
	/* 좌측 여백 없애기 */
	padding-left:0px;
	/* 우측 정렬 하기 */
	float:left;
}

#upperMenu ul li{
	display:inline-block;
	border-left: 2px solid #c0c0c0;
	/* 테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */
	padding: 0px 10px 0px 10px;
	/* 메뉴와 테두리 사이 간격 벌리기. margin: 위 오른쪽 아래 왼쪽; */
	margin: 5px 0px 5px 0px;
	}
	
#upperMenu ul li:first-child {
	/* li의 첫번째 요소의 좌측에는 테두리 없애기 */
	border-left: none;
	}
#upperMenu a:link {font-size:1.5em; color: #333333;}
#upperMenu a:visited {text-decoration: none; color: #333333;}
#upperMenu a:active {text-decoration: none; color: #333333;}
#upperMenu a:hover {text-decoration: none; color: red;}
</style>
</head>
<body>
	<div class="menubarOuter">
		<div id="upperLoginArea">
		  <%
			if(loginUser == null){
		   %>
			<div class="beforeLoginArea">
				<button name="login" onclick="location.href='<%=request.getContextPath()%>/views/common/login.jsp'">로그인</button>	
				&nbsp;|&nbsp;
				<button name="memberJoin" onclick="location.href='<%=request.getContextPath()%>/views/member/joinForm.jsp'">회원가입</button>
				&nbsp;
			</div>
		<%
			}else{
		%>	
			<div class="afterLoginArea">
				<a href="<%=request.getContextPath()%>/views/myPage/mypagemain.jsp">
				<% if (loginUser.getNickname() != null) { %>
				<b><%= loginUser.getNickname() %></b>
				<% } else { %>
				<b><%= loginUser.getEmail() %></b>
				<% } %>
				</a>님 환영합니다!&nbsp;
				<b>보유 사이버머니:</b> <%= loginUser.getMoney() %>원&nbsp;
				&nbsp;|&nbsp;
				<button name="logout" onclick="location.href='<%=request.getContextPath()%>/logout.me'">로그아웃</button>
				&nbsp;
			</div>
		<%
			}
		%>
		</div>
		<div id="upperLogo">
			<h1>PETKABOO</h1>
		</div>
		<div class="upperMenu" id="upperMenu">
		<ul class="menu">
			<li><a href="<%=request.getContextPath()%>/index.jsp">HOME</a></li>
			<li><a href="<%=request.getContextPath()%>/PetSitter.all">펫시터 찾기</a></li>
			<li><a href="https://goo.gl/forms/U9POJ4cUc5Chg2Aq2" target="_blank">펫시터 지원</a></li>
			<li><a href="#">자주하는 질문</a></li>
		</ul> 
		</div>
	</div>
</body>
</html>