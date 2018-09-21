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

.container {
	padding: 0px;
}
.table{
	width:60%;
}
.first {
	width: 15%
}

.second {
	width: 40%;
}

.third {
	width: 25%;
}

.fourth{
width: 20%
}

.form-control{
	width:15%;
	display:inline-block;
	marig-left:5px;
}

.search{
 	width:45%;
}
</style>
</head>
<body>
	<h1 align="center" id="logo">로고</h1>
	<br>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/sidemenubar.jsp"%>

	<div class="contentArea">
		<h2>돌봄일지 내역</h2>
		<p>돌봄일지 내역을 보거나 펫시터일 경우 돌봄일지 작성이 가능합니다.</p>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="first">글번호</th>
						<th class="second">제목</th>
						<th class="third">펫시터</th>
						<th class="fourth">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>리주시터</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>은진맘</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>혜원맥</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>큰형님시터</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>잠실시터왕</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>리주시터</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>리주시터</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>리주시터</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>리주시터</td>
						<td>2018-09-09</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>리주시터</td>
						<td>2018-09-09</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div align="center">
			<p>페이징 들어갈부분</p>
		</div>
		<div class="searchArea">
			<select class="form-control" id="searchCondition"
				name="searchCondition">
				<option>----</option>
				<option value="category">제목</option>
				<option value="writer">내용</option>
				<option value="title">작성일</option>
			</select> <input type="search" class="form-control search">
			<button type="submit" class="btn btn-default">검색하기</button>
			<!--  펫시터일 경우에만 활성화(일반유저는 안보이게 처리해야 함) -->
			<button onclick="" class="btn btn-success">작성하기</button>
		</div>
	</div>

</body>
</html>