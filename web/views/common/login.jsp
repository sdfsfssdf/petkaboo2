<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="813464990898-qo4elebsbveqjcue4n774m7caep7g6gb.apps.googleusercontent.com">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"> 
<title>펫카부 로그인</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>		
				<span class="icon-bar"></span>					
			</button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp" style="color:#72b9f3;">Petkaboo!</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<%-- 			<ul class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>/index.jsp">메인</a></li>
			</ul> --%>
			<!-- <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanede="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="../member/joinForm.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul> -->
		</div>
	</nav>
	<div class="container">
	<br>
	<br>
	<br>
	<br>
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px; background-color:#9bcdf7; border:1px solid #9bcdf7;">
				<form method="post" action="<%=request.getContextPath()%>/login.me">
				<br>
					<p style="text-align:center; font-weight:bold; color:white">로그인</p>
					<script>
						$.getJSON('https://api.ipify.org?format=jsonp&callback=?', function(data) {
						  console.log(JSON.stringify(data, null, 2))
						   var ip = (data.ip);
						  console.log(ip);
						  $("#ip").val(ip);
						});
					</script>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="email" maxlength="100">
						<input type = "hidden" id="ip" name="ip">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="user_pwd" maxlength="100">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인" style="background:#72b9f3;border: 1px solid white; font-weight:bold; color:white;">
					<br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="findPassword.jsp" style="color:white">비밀번호 찾기&nbsp;&nbsp; |</a>&nbsp;&nbsp;
					<a href="../member/joinForm.jsp" style="color:white">회원가입 </a>&nbsp;&nbsp;
					<div class="form-group">
					<br>				
						<!-- <div class="g-signin2" data-onsuccess="onSignIn" style="width:226px"></div> -->
					<!-- 	<script>
						if(this.value === 'Login'){
							googleAuthObj.signIn().then(function(){
								checkLoginStatus();
							});
						}else{
							googleAuthObj.signOut().then(function(){
								checkLoginStatus();
	
							});
						}
						</script> -->
					<!-- 	<script>
							function onSignIn(googleUser) {
							  var profile = googleUser.getBasicProfile();
							  var id = profile.getId()); // Do not send to your backend! Use an ID token instead.
							  var name = profile.getName());
							  var email = profile.getEmail()); // This is null if the 'email' scope is not present.
							}
							
							  function signOut() {
							    var auth2 = gapi.auth2.getAuthInstance();
							    auth2.signOut().then(function () {
							      console.log('User signed out.');
							    });
							  }
						</script> -->
					</div>
				</form>
			</div>
			</div>
		<div class="col-lg-4"></div>
	</div>
		<!-- footer -->
				<%@ include file="/views/common/footer.jsp" %>
</body>


</html>