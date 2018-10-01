<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.outer {
	float: left;
	width: 1000px;
	height: 600px;
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

.head>th {
	background: #ddd;
	text-align: center;
}

.vertical_line {
	width: 1px;
	border: 0.5px solid lightgray;
	height: 300px;
	display: inline-block;
	margin-left: 20px;
	margin-right: 20px;
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="leftMenu.jsp"%>
	<div class="outer">
		<div class="first-row">
			<div class="table1">
				<h2>무통장 입금 관리</h2>
				<p>무통장 입금 신청 내역 확인과 입금완료 처리가 가능합니다.</p>
				<hr>
				<div style="display: inline-block; width: 47%; height: 300px; overflow: auto">
					<h4 style="display:inline-block">오늘   : 0 건</h4>
					<table  class="table table-hover">
						<tr class="head">
							<th width="10%">번호</th>
							<th width="15%">ID</th>
							<th width="15%">금액</th>
							<th width="15%">결제일</th>
							<th width="10%">결제수단</th>
							<th width="25%">승인번호/입금 계좌번호</th>
							<th width="10%">구분</th>
						</tr>
					</table>
				</div>
				<div class="vertical_line"></div>
				<div style="display: inline-block; width: 47%; height: 300px; overflow: auto">
					<h4 style="display:inline-block">오늘 출금 요청 : 0 건</h4>
					<table  class="table table-hover">
						<tr class="head">
							<th width="10%">결제번호</th>
							<th width="15%">ID</th>
							<th width="15%">금액</th>
							<th width="15%">결제일</th>
							<th width="10%">결제수단</th>
							<th width="25%">승인번호/입금 계좌번호</th>
							<th width="10%">구분</th>
						</tr>
					</table>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>
