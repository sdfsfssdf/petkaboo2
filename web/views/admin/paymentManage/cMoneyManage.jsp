<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<title>Insert title here</title>
<style>
	.outer{
		float:left;
		width:1000px;
		height:600px;
		color:black;
		margin-left:20px;
		margin-right:auto;
		margin-top:20px;
	}
	.first-row{
		float:left;
		width:100%;
	}
	.table1{
		float:left;
		width:1000px;
		height:600px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.head > th{
		background: #ddd;
		text-align:center;
	}
</style>
</head>
<body>
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2>사이버머니 관리</h2>
	<p>사이버머니 내역과 간단한 통계를 확인, 조회할 수 있습니다.</p>
	<hr>
		<div>
			<table class="table table-hover" >
				<tr class="head" align="center">
					<th>오늘의 충전 건 수</th>
					<th>총 충전 금액</th>
					<th>오늘의  거래 금액</th>
					<th>구분</th>
					<th>거래액</th>
					<th>실수입</th>
				</tr>
				<tr align="center">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
				</tr>
				<tr align="center">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>합계 : </td>
					<td>10000원</td>
				</tr>
			</table>
		</div>
	<hr>
		<table id="cMoneyManage">
			<tr class="head" >
				<th width="120px">결제번호</th>
				<th width="120px">ID</th>
				<th width="120px">금액</th>
				<th width="120px">입금자명</th>
				<th width="120px">결제일시</th>
				<th width="120px">결제수단</th>
				<th width="120px">상태</th>
			</tr>
		</table>
	</div>
	<div class="searchArea" align="center">
			<input type="search">
			<button type="submit">검색하기</button>
	</div>
	</div>
</div>
</body>
</html>













