<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
		height:800px;
		color:black;
		margin-left:280px;
	}
	.head1{
		background: #ddd;
		padding:0px;
		margin:0px;
		border:0px;
	}
	
	.contentTable td{
		padding:10px;
	}
</style>
</head>
<body>
<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
		<br>
		<h2>공지사항 작성</h2>
		<p>공지사항을 새로 작성할 수 있습니다.</p>
		<hr>
		<div class="first-row">
			 <form action="<%=request.getContextPath()%>/insertNotice.no" method="post">
				<table class="contentTable">
					<tr>
						<td>제목</td>
						<td colspan="1"><input class="form-control" type="text" size="50" name="title"></td>
						<td>작성자</td>
						<td>
							<input class="form-control" type="text" value="admin" readonly name="writer">
							<input type="hidden">
							<!-- 로그인 기능 완성되면 수정해야할 부분 -->
							<input type="hidden" value="3" name="userNo">
						</td>
					</tr>

					<tr>
						<td>내용</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" class="form-control" cols="138" rows="20" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset" class="btn btn-danger">취소하기</button>
					<button type="submit" class="btn btn-success">등록하기</button>
				</div>
			</form>
		</div>
		
	</div>
</body>
</html>
