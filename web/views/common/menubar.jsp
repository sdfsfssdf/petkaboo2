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
#upperLogo {
	text-align:center;
}
#upperLoginArea {
	text-align:right;
}
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
				<button name="myPage" onclick="location.href='<%=request.getContextPath()%>/views/myPage/mypagemain.jsp'">마이페이지</button>
				&nbsp;|&nbsp;
				<button name="logout" onclick="location.href='<%=request.getContextPath()%>/logout.me'">로그아웃</button>
				&nbsp;
			</div>
		<%
			}
		%>
		</div>
		<div id="upperLogo">
			<h1>PETKABOO - Find Petsitter for your lovely pets!</h1>
		</div>
		<div id="upperMenu">
			<h3>실제 상단 메뉴1234 위치 여기</h3>
		</div>
	</div>
</body>
</html>