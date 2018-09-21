<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petkaboo Main Search Module Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.searchbody{
		background-color:brown;
		height:400px;
		padding:10%;
	}
	.center-searchArea{
	text-align:center;
	}
	.searchBar{
		width:600px;
		height:50px;
	}
	.center-searchBar{
	display:inline-block;

	}
	input::placeholder {
	text-align:center;
  	font-weight: bold;
  	font-size: 100%;
	}
	#goSearch {
		margin-left:10px;
		font-size:150%;
		font-weight:bold;
		color:white;
		background:yellowgreen;
		border-radius:5px;
		width:100px;
		height:50px;
		text-align:center;
  		display:inline-block;
  		vertical-align:30%;
  		padding-top:6px;
	}
	#goSearch:hover {
		cursor:pointer;
		background:white;
		color:yellowgreen;
	}
	#goSearch span{
		vertical-align:middle;
	}	
</style>
</head>
<body>
<!-- search.do를 향후 서블렛 이름으로 변경할 것. by 김경래 20180914 -->
<div class="searchbody">
<form id="searchForm" action="<%=request.getContextPath()%>/search.do" method="get">
<div class="center-searchArea">
	<h1 style="color:white;"><strong>지금 바로 펫시터를 찾아보세요</strong></h1>
	<div class="center-searchBar">
	<input class="searchBar" name="searchKeyword" type="text" style="font-size:200%; font-weight:bold;" placeholder="원하는 펫시팅 조건을 검색해 보세요" autocomplete="off">
	<div id="goSearch" onclick="goSearch()"><span>검색하기</span></div><div></div></div>
	</div>
</form>
</div>
<script>
	function goSearch(){
		$("#searchForm").submit();
	}
</script>
</body>
</html>