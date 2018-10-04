<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>Petsitter Apply</title>
<style>
.content-left {
	width: 15%;
	float: left;
/* 	border: 1px solid black;
	background: yellow; */
}
.applyMain{
display:relative;
	 margin-top: 15%; text-align:center;
	
}
.contentArea {
	display:abolute;
	margin-left: 320px;
	width: 60%;
	height:500px;
	margin-top:80px;
}

.content-left {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-right {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-center {
	width: 70%;
	float: left;
	/* text-align:center; */
	margin: 0 auto;
}	
a:hover{
	text-decoration:none;	
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<div class="content-left">
	<%@ include file="../common/sidemenubar.jsp" %>
	</div>
	
	<%
		if(loginUser == null){
	%>
	<script>
		alert('로그인 후 이용해 주세요');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if (loginUser.getUser_grade() == 3) { %>
	<script>
		alert('이미 펫시터 회원입니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if (request.getAttribute("applyPetsitter") != null && request.getAttribute("applyPetsitter").toString().equals("OK")){%>
	<% } else {%>
	<div class=contentArea>
	<div class="content-left"></div>
	
	<div class="content-center">
	<div id="applyMain" style="margin-top: 15%; text-align:center; border:2px dashed #9bcdf7; width:100%; margin-left:auto; margin-right:auto; ">
	<br /><br />
		<p>펫시터 지원에 감사드립니다. 관리자가 지원서 확인 후 연락을 드릴 것입니다.</p>
		<br />
		<p><strong>25세 이상의 회원만 가능합니다.</strong></p>
		<br />
		<p>아래의 링크를 클릭해 구글 폼으로 지원서를 제출하고, 제출완료 버튼을 눌러주세요.</p>
		<br />
		<br />
		
		<p><a href="https://goo.gl/forms/U9POJ4cUc5Chg2Aq2" target="blank"> > > > > 펫카부 펫시터 지원서 작성 < < < < </a></p>
		<form name="applyPetsitterForm" method="post" action="<%=request.getContextPath()%>/ApplyPetsitter.req">
			<input type="hidden" name="apCheck" value="Y">
		</form>
		<br /><br />
	</div>	
	</div>
	<div class="content-right"></div>
	</div>
	<% } %>
</body>
</html>