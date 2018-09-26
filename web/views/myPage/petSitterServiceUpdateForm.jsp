<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Petsitting Service Update</title>
<style>
#MyPetsitterInfoheader{
	text-align:center;
}
hr{
	width:50%;
	border:1px solid black;
}
#MyPetsitterInfoTable{
	margin-top:1%;
	margin-right:5%;
	margin-left:20%;
	width:auto;
	border:1px solid black;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%
		if(loginUser == null || loginUser.getUser_grade() != 3){
	%>
	<script>
		alert('펫시터 회원만 이용할 수 있습니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else {%>
	<%@ include file="/views/common/sidemenubar.jsp"%>
	<div class="MyPetsitterInfoheader" id="MyPetsitterInfoheader">
		<h2><b>내 펫시터 등록 정보 수정</b></h2>
		<hr>
	</div>
	<div class="MyPetsitterInfoTable" id="MyPetsitterInfoTable">
		loginUser 정보 출력 테스트: <%= loginUser.getUser_no() %>
	
	</div>
	<% }%>
</body>
</html>