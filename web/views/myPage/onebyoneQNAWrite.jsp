<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pkb.member.model.vo.User"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.contentArea {
	margin-left: 320px;
	width: 60%;
	margin-top: 80px;
}
</style>
</head>
<body>
	<h1 align="center" id="logo">로고</h1>
	<%@ include file="../common/menubar.jsp"%>
	
	<%@ include file="../common/oldMenubar.jsp"%>
		<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>
	
	<%
		if (loginUser != null) {
	%>




	<%@ include file="../common/sidemenubar.jsp"%>
	<div class="contentArea">
		<h2>1:1 문의</h2>
		<p>관리자에게 1:1 문의를 신청할 수 있습니다.</p>
		<br>
		<!-- 20180914-1 -->
		<form action="<%=request.getContextPath()%>/insertQna.bo"
			method="post">

			<div class="title">

				<input type="text" class="form-control" name="onetitle"
					placeholder="제목을 입력하세요.">
			</div>
			<br>
			<div class="content">
				<textarea class="form-control" rows="20" cols="30" name="onecontent"
					placeholder="내용을 입력하세요."></textarea>
			</div>
			<br>
			<div class="btns" align="center">
				<button type="submit" class="btn btn-success write">작성하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">취소하기</button>
			</div>
		</form>
	</div>
	<%
		} else {
	%>
	<script>
		alert('로그인한 회원만 이용 가능합니다.')
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	

	<%
		}
	%>

</body>
</html>