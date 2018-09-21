<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.outer{
		float:left;
		width:1000px;
		height:700px;
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
		width:460px;
		height:250px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.table2{
		float:left;
		width:510px;
		height:250px;
		margin-top:120px;
		margin-left:25px;
		padding-left:50px;
		margin-right:auto;
	}
	.head > th{
		background: #ddd;
		text-align:center;
		
	}
	.body > td{
		text-align:center;
		border:1px solid black;
	}
	</style>
</head>
<body>
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2>전체현황</h2>
	<hr>
		<table id="total">
			<tr class="head" >
				<td src="image"></td>
			</tr>
		</table>
	</div>
	<div class="table2" >
		<table id="statistics">
			<tr class="head">
				<th width="150px">사이트통계</th>
				<th width="150px">그제</th>
				<th width="150px">어제</th>
				<th width="150px">오늘</th>
			</tr>
			<tr class="body">
				<td height="50">거래금액</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="body">
				<td height="50">거래건</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="body">
				<td height="50">총매출액</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="body">
				<td height="50">신규회원</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="body">
				<td height="50">펫시터수</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="body">
				<td height="50">총회원수</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		</div>
	</div>
</div>
</body>
</html>