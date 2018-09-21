<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오른쪽 상단 메뉴 (미완성)</title>
<style>

.rightTop {
	width:300px;
	height:150px;
	background:lightgray;
	margin-left:20px;
	float:left;
	border:1px solid black;
}

.menu-left {
	width:39%;
	height:150px;
	border:1px solid black;
	float:left;
	
}

.menu-right {
	width:59%;
	height:150px;
	border:1px solid black;
	float:right;
	
}

.rm{
	width:110px;
	height:35px;
	border:1px solid black;
	float:left;

}

.lout{
	width:110px;
	height:35px;
	border:1px solid black;
	float:left;
	
}

#recharge{
	background:yellow;
	color:black;
}

#message{
	background:blue;
	color:black;
}
#logout{
	background:white;
	color:black;
}

</style>


</head>
<body>
	<div class="rightTop">
	<div class="menu-left">
		<div class="dropMenu">
		<form action="#">
			<select name="" id="">
				<option>***님</option>
				<option value="myPage">마이페이지</option>
				<option value="ing">진행현황</option>
			</select>
		</form>
		</div>
		</div>
		<div class="menu-right">
			<div class="point">
			<p>보유 포인트 : </p>
			</div>
			<div class="rm">
				<button onclick="#" id="recharge">충전하기</button>
				<button onclick="#" id="message">쪽지함</button>
			</div>
			<div class="lout">
			<button onclick="#" id="logout">로그아웃</button>
			</div>
		</div>
			
</div>




</body>
</html>