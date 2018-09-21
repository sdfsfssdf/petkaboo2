<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2><b>펫시팅 중</b></h2>
	<hr>
		<table id="ingDeal">
			<tr class="head" >
				<th width="120px">선택</th>
				<th width="120px">등록번호</th>
				<th width="120px">펫시터ID</th>
				<th width="120px">신청자ID</th>
				<th width="120px">동물</th>
				<th width="120px">지역</th>
				<th width="120px">기간</th>
			</tr>
		</table>
	</div>
	<div class="searchArea" align="center">
	<button class="selectAll">전부선택</button>
	<button class="delete">삭제</button>
			<input type="search">
			<button type="submit">검색하기</button>
	</div>
	</div>
</div>
</body>
</html>













