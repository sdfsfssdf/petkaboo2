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
	<h2>제재관리</h2>
	<p>휴면계정 처리와 휴면계정의 목록을 확인할 수 있습니다.</p>
	<hr>
	<h4>휴면처리가 필요한 계정</h4>
	<div style="display:inline-block" align="right">
		<button>일괄처리</button><button>선택처리</button>
	</div>
	<hr>
		<table id="memberList">
			<tr class="head" >
				<th width="100px">회원번호</th>
				<th width="300px">ID</th>
				<th width="100px">이름</th>
				<th width="200px">등급</th>
				<th width="300px">사유</th>
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













