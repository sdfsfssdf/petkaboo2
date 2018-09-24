<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.pkb.member.model.vo.*"%>
    
<%
	HashMap<String,Object> loginInfo = (HashMap<String,Object>)request.getAttribute("userInfo");
	User u = (User)loginInfo.get("user");
	LoginHistory lh = (LoginHistory)loginInfo.get("loginHistory");
	ImgFile img = (ImgFile)loginInfo.get("profile");
%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
	.outer {
	float: left;
	width: 1000px;
	height: 800px;
	color: black;
	margin-left: 20px;
	margin-right: auto;
	margin-top: 20px;
}

.first-row {
	float: left;
	width: 100%;
}

.table1 {
	float: left;
	width: 1000px;
	height: 600px;
	margin-top: 20px;
	marign-left: auto;
	margin-right: auto;
	padding-left: 50px;
}

</style>
</head>
<body>
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
		<div class="">
			<hr>
			<div class="table1">
			<h2>회원정보 상세</h2>
			<p>회원의 상세정보를 확인할 수 있고, 수정, 삭제가 가능합니다.</p>
			<table class="table" >
				<tr>
					<td rowspan="5" colspan="2"><div id="imageArea" style="height:90%;width:100%">
						<img id="titleImg" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=img.getFile_path() %>">
					</div><button>프로필 사진 다운로드</button></td>
					<td width="25%" height="50" style="padding-top: 13px">회원번호</td>
					<td width="25%"	><%=u.getUser_no()%></td>
				</tr>
				<tr>
					<td width="25%" style="padding-top: 13px">아이디(이메일)</td>
					<td width="25%" ><%=u.getEmail() %></td>
				</tr>
				<tr>
					<td width="25%" height="50"style="padding-top: 13px">이름</td>
					<td><%=u.getUser_name()%></td>
				</tr>
				<tr>
					<td style="padding-top: 13px">회원가입일시</td>
					<td><%=u.getEnrollDate() %></td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13x">최근접속일시</td>
					<td><%=lh.getLoginDate() %></td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">전화번호</td>
					<td><%=u.getPhone() %></td>
					<td style="padding-top: 13px">메일수신여부</td>
					<td><%=u.getEmail_chk() %></td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">SMS수신여부</td>
					<td><%=u.getSms_chk() %></td>
					<td style="padding-top: 13px">인증여부</td>
					<%if(u.getUser_grade()==0){ %>
						<td>
							<img src="/pkb/images/adminImgs/check2.png">
							<img src="/pkb/images/adminImgs/check2.png">
							<img src="/pkb/images/adminImgs/check2.png">
						</td>
					<%} else if(u.getUser_grade() == 1){ %>
						<td>
							<img src="/pkb/images/adminImgs/check1.png">
							<img src="/pkb/images/adminImgs/check2.png">
							<img src="/pkb/images/adminImgs/check2.png">
						</td>
					<%} else if (u.getUser_grade() == 2) {%>
						<td>
							<img src="/pkb/images/adminImgs/check1.png">
							<img src="/pkb/images/adminImgs/check1.png">
							<img src="/pkb/images/adminImgs/check2.png">
						</td>
					<%} else { %>
						<td>
							<img src="/pkb/images/adminImgs/check1.png">
							<img src="/pkb/images/adminImgs/check1.png">
							<img src="/pkb/images/adminImgs/check1.png">
						</td>
					<%} %>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">사이버머니</td>
					<td>추가해야함..</td>
					<td height="50" style="padding-top: 13px">등급</td>
					<%if(u.getUser_grade()==0){ %>
						<td>미인증 회원</td>
					<%} else if(u.getUser_grade() == 1){ %>
						<td>기본 회원</td>
					<%} else if (u.getUser_grade() == 2) {%>
						<td>의뢰 가능 회원</td>
					<%} else { %>
						<td>펫시터</td>
					<%} %>
				</tr>
			</table>
			</div>
		</div>
	</div>
</body>
</html>