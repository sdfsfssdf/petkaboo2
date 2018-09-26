<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,com.pkb.common.Paging, com.pkb.member.model.vo.*"%>
<%
	ArrayList<User> mlist = (ArrayList<User>) request.getAttribute("mlist");
	Paging pg = (Paging) request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%>    
    
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2>휴면계정 관리</h2>
	<p>휴면계정 처리와 휴면계정의 목록을 확인할 수 있습니다.</p>
	<hr>
	<h4 style="display:inline-block">휴면처리가 필요한 계정</h4>
	<%-- <img src="<%=request.getContextPath() %>/images/adminImgs/newIcon.png" width="30px" height="30px"> --%>
	<div style="display:inline-block; float:right;">
		<button class="btn btn-default">일괄처리</button> <button class="btn btn-default">선택처리</button>
	</div>
	<hr style="clear:both;">
	
	<script>
		$(function(){
			$('.masterCheck').click(function(){
				$('.childCheck').prop('checked',this.checked);
			});
		});
	</script>
	<div class="" style="width:100%; height:300px; overflow:auto;">
		<table id="needDiapauseMemberTable" class="table table-hover" align="center" name="memberListTable">
			<tr class="head">
				<th width="2%"><input type="checkbox" class="masterCheck"></th>
				<th width="8%">회원번호</th>
				<th width="25%">ID</th>
				<th width="20%">이름</th>
				<th width="10%">등급</th>
				<th width="25%">인증</th>
				<th width="10%">상태</th>
			</tr>
		</table>
	</div>
	
	<hr>
		<table id="DiapauseMemberTable" class="table table-hover" align="center" name="memberListTable">
			<tr class="head">
				<th width="2%"><input type="checkbox" class="masterCheck"></th>
				<th width="8%">회원번호</th>
				<th width="25%">ID</th>
				<th width="20%">이름</th>
				<th width="10%">등급</th>
				<th width="25%">인증</th>
				<th width="10%">상태</th>
			</tr>
		</table>
		
	</div>
	<div class="searchArea" align="center">
			<input type="search">
			<button type="submit">검색하기</button>
	</div>
	</div>
</div>
</body>
</html>













