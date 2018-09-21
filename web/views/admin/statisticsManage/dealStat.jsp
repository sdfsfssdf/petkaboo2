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
		width:510px;
		height:400px;
		padding-left:50px;
		margin-right:auto;
	}
	.table2{
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
	<div class="table1" >
	<h2>거래현황</h2>
	<hr>
		<table id="dealStat">
			<tr>
				<td>chart</td>
			</tr>
		</table>
		</div>
	</div>
	<div class="second-row">
		<div class="table2">
			<table id="deal">
				<tr class="head">
					<th width="200px">누적 거래수</th>
					<th width="200px">정상 완료거래</th>
					<th width="200px">현재 등록된 거래</th>
					<th width="200px">진행중인 거래</th>		
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>