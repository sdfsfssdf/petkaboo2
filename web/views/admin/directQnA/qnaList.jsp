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
	<h2>1:1문의 목록</h2>
		<table id="qnaList">
			<tr class="head" >
				<th width="100px">회원번호</th>
				<th width="200px">ID</th>
				<th width="100px">이름</th>
				<th width="200px">전화번호</th>
				<th width="100px">주소</th>
				<th width="100px">등급</th>
				<th width="100px">문의사항</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="searchArea" align="center">
			<input type="search">
			<button type="submit">검색하기</button>
			
	</div>
</div>
</body>
</html>