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
.contentArea {
	margin-top: 80px;
	margin-left: 320px;
	width: 60%;
}

.content {
	border: solid 1px black;
	border-radius: 8px;
	height: 40px;
}

.labelArea {
	display: inline-block;
	width: 60%;
}

.btnsArea {
	display: inline-block;
	width:38%;
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
	<div class="contentArea">
		<h2>내 펫시팅 서비스 정보 수정</h2>
		<p>나의 내가 등록한 펫시팅 서비스 정보를 수정할 수 있습니다.</p>

		<br>
		<div class="content">
			<div class="labelArea">
				<label>고양이 / 월화수목금토 / 20000원 / 산책, 밥주기</label>
			</div>
			<div class="btnsArea">
				<button type="submit" class="btn btn-info write">수정하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">삭제하기</button>
			</div>
		</div>
		<br>
		<div class="content">
			<div class="labelArea">
				<label>고양이 / 월화수목금토 / 20000원 / 산책, 밥주기</label>
			</div>
			<div class="btnsArea">
				<button type="submit" class="btn btn-info write">수정하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">삭제하기</button>
			</div>
		</div>
		<br><div class="content">
			<div class="labelArea">
				<label>고양이 / 월화수목금토 / 20000원 / 산책, 밥주기</label>
			</div>
			<div class="btnsArea">
				<button type="submit" class="btn btn-info write">수정하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">삭제하기</button>
			</div>
		</div>
		<br><div class="content">
			<div class="labelArea">
				<label>고양이 / 월화수목금토 / 20000원 / 산책, 밥주기</label>
			</div>
			<div class="btnsArea">
				<button type="submit" class="btn btn-info write">수정하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">삭제하기</button>
			</div>
		</div>
		<br><div class="content">
			<div class="labelArea">
				<label>고양이 / 월화수목금토 / 20000원 / 산책, 밥주기</label>
			</div>
			<div class="btnsArea">
				<button type="submit" class="btn btn-info write">수정하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">삭제하기</button>
			</div>
		</div>
		<br>
	</div>
	<% }%>
</body>
</html>