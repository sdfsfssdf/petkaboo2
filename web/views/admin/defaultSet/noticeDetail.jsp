<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pkb.notice.model.vo.*, java.util.*"%>
<%
	Notice nt = (Notice)request.getAttribute("nt");
%>

<!DOCTYPE>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
		height:800px;
		color:black;
		margin:0 auto;

	}
	
	
	.noticeDetailArea td {
		padding:10px;
	}
	
	.noticeDetailArea input[type=text] ,.noticeDetailArea input[type=date] , .contentArea {
		background:white;
	}
</style>
</head>
<body>
<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
		<br>
		<h2>공지사항 상세보기</h2>
		<p>공지사항의 상세 내용을 확인할 수 있습니다.</p>
		<hr>
		<div class="first-row">
			 <form action="<%=request.getContextPath() %>/noticeModifyForm.no" method="post">
				<table class="noticeDetailArea">
					<tr>
						<td>제목</td>
						<td colspan="3"><input class="form-control" type="text" size="50" name="title" readonly value="<%=nt.getArticle_title()%>"></td>
						<td>공지번호</td>
						<td><input class="form-control" id="nno" name="nno" type="text" readonly value="<%=nt.getArticle_no()%>"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input class="form-control" type="text" readonly value="<%=nt.getUser_name()%>">
						</td>
						<td>작성일</td>
						<td><input class="form-control" type="date" name="date" readonly value="<%=nt.getArticle_date()%>"></td>
						<td>최종수정일</td>
						<td><input class="form-control" type="date" name="date" readonly value="<%=nt.getArticle_modify_date()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="6">
							<textarea class="form-control contentArea" name="content" cols="128" rows="17" style="resize:none" readonly ><%=nt.getArticle_contents() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset" class="btn btn-default" onclick="location.href='<%=request.getContextPath()%>/noticeList.no'">취소하기</button>
					<button type="submit" class="btn btn-primary">수정하기</button>
					<button type="button" class="btn btn-danger" id="delete">삭제하기</button>
				</div>
				<script>
					$(function(){
						$('#delete').click(function(){
							var nno = $('#nno').val();
							location.href = "<%=request.getContextPath()%>/deleteNotice.no?nno="+nno;
						})
					})
				</script>
			</form>
		</div>
		
	</div>
</body>
</html>
