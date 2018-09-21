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
	.second-row{
		float:left;
		width:100%;
	}
	.third-row{
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
		margin-top:20px;
		margin-left:25px;
		padding-left:50px;
		margin-right:auto;
	}
	.table3{
		height:250px;
		padding-left:50px;
		margin-right:auto;
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
	<h4>수수료 설정</h4>
		<table id="feeSetting">
			<tr class="head" >
				<th width="200px">카테고리</th>
				<th width="200px">수수율</th>
			</tr>
		</table>
	</div>
	<div class="table2" >
	<h4>무통장 입금계좌 설정</h4>
		<table id="accountSetting">
			<tr class="head">
				<th width="100px">은행</th>
				<th width="100px">계좌번호</th>
				<th width="100px">예금주</th>
				<th width="200px">기능</th>
			</tr>
		</table>
		</div>
	</div>
	<div class="second-row">
		<div class="table3">
		<h4>동물 카테고리 추가</h4>
			<table id="adding">
				<tr class="head">
					<th width="200px">카테고리</th>
					<th width="200px">선택</th>		
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>