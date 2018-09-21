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
		height:835px;
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
	.table4{
		height:333px;
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
	<h4>1:1상담</h4>
		<table id="directConsult">
			<tr class="head" >
				<th width="100px">일시</th>
				<th width="100px">ID</th>
				<th width="200px">내용</th>
				<th width="100px">기능</th>
			</tr>
			<tr>
				<td width="100px">20100909</td>
				<td width="100px">sji1123</td>
				<td width="200px">바보바봐보바ㅗ바ㅘ보</td>
				<td width="100px">버튼버트</td>
			</tr>
		</table>
	</div>
	<div class="table2" >
	<h4>신고상황</h4>
		<table id="report">
			<tr class="head">
				<th width="100px">일시</th>
				<th width="100px">ID</th>
				<th width="100px">피신고자</th>
				<th width="200px">내용</th>
				<th width="50px">기능</th>
			</tr>
		</table>
		</div>
	</div>
	<div class="second-row">
		<div class="table3">
		<h4>출금/환불요청</h4>
			<table id="withdraw-refund">
				<tr class="head">
					<th width="200px">일시</th>
					<th width="200px">ID</th>
					<th width="200px">금액</th>
					<th width="200px">세부정보</th>
					<th width="200px">처리상황</th>
				</tr>
			</table>
		</div>
	</div>
	<div class="third-row">
		<div class="table4">
		<h4>인증요청상황</h4>
			<table id="authenfication">
				<tr class="head">
					<th width="200px">일시</th>
					<th width="200px">ID</th>
					<th width="200px">이름</th>
					<th width="200px">요청사항</th>
					<th width="200px">처리</th>
				</tr>
			</table>
		</div>
	</div>
</div>
	
</body>
</html>