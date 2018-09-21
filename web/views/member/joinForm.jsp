<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">

<title>펫카부 회원가입</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/index.jsp">펫카부</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>/index.jsp">메인</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanede="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../common/login.jsp">로그인</a></li>
						<li class="active"><a href="joinForm.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form id="joinForm" name="joinForm" method="post"
					action="<%=request.getContextPath()%>/join.me">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="email" id="email" class="form-control"
							placeholder="아이디" name="email" maxlength="100">
						<input type="button" onclick="checkEmail()" value="중복체크">
					</div>
					<div class="form-group">
						<input type="password" id="pwd" class="form-control"
							placeholder="비밀번호" name="user_pwd" maxlength="100">
					</div>
					<div class="form-group">
						<input type="password" id="check" class="form-control"
	
							placeholder="비밀번호를 확인해주세요" name="check" maxlength="100">
					</div>
					<input type="submit" id="join" onclick="join1()"
						class="btn btn-primary form-control" value="회원가입">

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

	<script>
			var checked = 0;
			
			function checkEmail(){
				
				
				var email = $("#email").val();
				$.ajax({
				url :"<%=request.getContextPath()%>/idCheck.do",
						data : {email : email},
						type : "get",
						success : function(data) {
							if (data == 0) {
								alert("사용 가능한 아이디입니다.");
								checked=1;
							} else {
								alert("이미 가입된 아이디입니다.");
							}
						}
					});
			}
			 function join1(){
						console.log(checked);
				if(checked == 0){
					alert("중복체크를 해주세요");
				}else{
				 if ($('#email').val() == "") {

					alert("이메일을 입력해 주세요");
					
					$('#email').focus();
					return;
					}
				 if ($('#pwd').val() == "") {
						alert("비밀번호를 입력 해 주세요");
						$('#pwd').focus();
						return;
				}
				if ($('#check').val() != $('#pwd').val()) {
							alert("입력하신 비밀번호를 확인 해 주세요");
							$('#check').focus();
							return;
						}
				if($('#pwd').val().length <6){
							alert("비밀번호를 6자리 이상입력해주세요");
							$('#pwd').focus();
							return;			
				}
				if($('#email').val() != "" && $('#pwd').val() != "" && ($('#pwd').val().length() > 6 ||$('#pwd').val().length() < 20)){
					$("#joinForm").submit();
					}
				}
				}
			
		</script>
</body>


</html>