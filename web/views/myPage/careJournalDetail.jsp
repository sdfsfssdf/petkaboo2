<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.contentArea {
	margin-top: 80px;
	margin-left: 320px;
	width: 60%;
}


.careDetailTable{
	width:100%;
}

.careProfileImg{
	width:100px;
	height:100px;
	background:gray;
	border-radius:50px;
}
</style>
</head>
<body>
	<h1 align="center" id="logo">로고</h1>
	<br>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/sidemenubar.jsp"%>
	
	<div class="contentArea">
	<h2>돌봄 일지 상세보기</h2>
	<p>돌봄일지 내역을 확인할 수 있습니다.</p>
	<br>
		<table class="careDetailTable">
			<tr>
				<td align="center" rowspan="3" width="100px"><div class="careProfileImg"></div>
								<br><label>리주시터</label></td>
								
				<td><label>일시 : </label> 2018-10-01<td>
			</tr>
			<tr>
				<td><label>서비스 내용 : </label>기본돌봄서비스</td>
			</tr>
			<tr>
				<td><label>특이사항 : </label>똥을 자주 쌉니다.</td>
			</tr>
		</table>
		
		<hr>
		<table class="careDetailTable">
			<tr>
				<td align="center" rowspan="3" width="100px"><div class="careProfileImg"></div>
								<br><label>리주시터</label></td>
								
				<td><label>일시 : </label> 2018-10-01<td>
			</tr>
			<tr>
				<td><label>서비스 내용 : </label>기본돌봄서비스</td>
			</tr>
			<tr>
				<td><label>특이사항 : </label>똥을 자주 쌉니다.</td>
			</tr>
		</table>
		
		<hr>
		<table class="careDetailTable">
			<tr>
				<td align="center" rowspan="3" width="100px"><div class="careProfileImg"></div>
								<br><label>리주시터</label></td>
								
				<td><label>일시 : </label> 2018-10-01<td>
			</tr>
			<tr>
				<td><label>서비스 내용 : </label>기본돌봄서비스</td>
			</tr>
			<tr>
				<td><label>특이사항 : </label>똥을 자주 쌉니다.</td>
			</tr>
		</table>
		
		<hr>
		<table class="careDetailTable">
			<tr>
				<td align="center" rowspan="3" width="100px"><div class="careProfileImg"></div>
								<br><label>리주시터</label></td>
								
				<td><label>일시 : </label> 2018-10-01<td>
			</tr>
			<tr>
				<td><label>서비스 내용 : </label>기본돌봄서비스</td>
			</tr>
			<tr>
				<td><label>특이사항 : </label>똥을 자주 쌉니다.</td>
			</tr>
		</table>
		
		<hr>
	</div>

</body>
</html>