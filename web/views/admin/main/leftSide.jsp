<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script type="text/javascript" src="https://api.ipify.org?format=json"></script>
<script type="application/javascript">

</script>

<script type="application/javascript"
	src="https://api.ipify.org?format=jsonp&callback=getIP"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.wrapper {
	display: grid;
	grid-auto-rows: minmax(70px, auto);
	width: 250px;
	text-align: center;
	float: left;
}

.wrapper {
	border: 2px soild #ddd;
}

.wrapper>div {
	border-bottom: 1px solid #bbb;
	border-right: 2px solid #353944;
	background-color: #fff;
	padding: 1em;
}

.wrapper2 {
	display: grid;
	grid-template-colums: repeat(3, 1fr);
	grid-auto-rows: minmax(70px, auto);
	width: 250px;
}

.wrapper2>div {
	text-align: center;
	border-right: 2px solid #353944;
}

.one {
	background: #ddd !important;
	color: cornflowerblue;
}

.six {
	background: #ddd !important;
	color: cornflowerblue;
}

#rtcInput {
	border: none;
}
</style>
<script type="text/javascript">
	function realtimeClock() {
		document.rtcForm.rtcInput.value = getTimeStamp();
		setTimeout("realtimeClock()", 1000);
	}
	function getTimeStamp() { // 24시간제
		var d = new Date();

		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);
		
		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script type="text/javascript" src="https://api.ipify.org?format=json"></script>
<script type="application/javascript">
$(function(){
	ip = "";

  function getIP(json) {
   	ip = json.ip;	
  }
  
  $('ipArea').text(ip);
  console.log(ip)
})
</script>

<script type="application/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="one">
			<h3>관리자메인</h3>
		</div>
		<div class="two">
			현재시간<br>
			<body onload="realtimeClock()">
				<form name="rtcForm">
					<input type="text" name="rtcInput" size="15" readonly="readonly" />
				</form>
		</div>
		<div class="three">최종로그인</div>
		<div class="four">접속IP <p name="ipArea" id="ipArea"></p></div>
		<div class="five">보안경고</div>
		<div class="six">
			<h3>오늘의 펫카부</h3>
		</div>
		<div class="seven">거래금액</div>
		<div class="eight">거래건</div>
		<div class="nine">총매출액</div>
		<div class="ten">신규회원</div>
		<div class="eleven">펫시터수</div>
		<div class="twelve">총회원수</div>
	</div>

</body>
</html>