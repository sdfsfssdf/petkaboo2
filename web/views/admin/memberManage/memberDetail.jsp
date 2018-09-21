<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h2>회원정보수정</h2>
			<p>회원의 상세정보를 확인할 수 있고, 수정, 삭제가 가능합니다.</p>
			<table class="table" >
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">회원번호</td>
					<td width="25%"	>      </td>
					<td width="25%" style="padding-top: 13px">아이디(이메일)</td>
					<td width="25%" >      </td>
				</tr>
				<tr>
					<td width="25%" height="50"style="padding-top: 13px">이름</td>
					<td>      </td>
					<td style="padding-top: 13px">회원가입일시</td>
					<td>      </td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13x">최근접속일시</td>
					<td>      </td>
					<td style="padding-top: 13px">접속IP</td>
					<td>      </td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">생년월일</td>
					<td>      </td>
					<td style="padding-top: 13px">주소</td>
					<td>      </td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">전화번호</td>
					<td>      </td>
					<td style="padding-top: 13px">메일수신여부</td>
					<td>      </td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">SMS수신여부</td>
					<td>      </td>
					<td style="padding-top: 13px">인증여부</td>
					<td>      </td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">사이버머니</td>
					<td>      </td>
					<td style="padding-top: 13px">특별적립포인트</td>
					<td>      </td>
				</tr>
				<tr>
					<td colspan="2" width="25%" height="50" style="padding-top: 13px">비밀번호</td>
					<td colspan="2">   </td>
				</tr>
				<tr>
					<td colspan="2" height="50" style="padding-top: 13px">등급</td>
					<td colspan="2">   </td>
				</tr>
				<tr>
					<td colspan="2" height="50" style="padding-top: 13px">거래상황</td>
					<td colspan="2">   </td>
				</tr>
			</table>
			</div>
		</div>
	</div>
</body>
</html>