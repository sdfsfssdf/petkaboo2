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
		margin-top:10px;
		background-color:#89c5f5;
		height:400px;
		padding:10%;
	}
	.center-searchArea{
	text-align:center;
	}
	.searchBar{
		width:600px;
		height:45px;
	}
	.center-searchBar{
	display:inline-block;

	}
	input::placeholder {
	text-align:center;
  	font-size: 18px;
	}
	#goSearch {
		margin-left:10px;
		font-size:150%;
		font-weight:bold;
		color:#89c5f5;
		background:white;
		border-radius:5px;
		width:100px;
		height:45px;
		text-align:center;
  		float:left;
  		/* vertical-align:30%; */
  		padding-top:8px;
	}
	#goSearch:hover {
		cursor:pointer;
		background:white;
		color:black;
	}
	#goSearch span{
		/* vertical-align:middle; */
		font-size:18px;
		
	}	
	
	.input-searchBar{
	float:left;
	}
	input{    
	outline: none;
    transition: border .12s ease-in-out;
}
	
</style>
</head>
<body>
<!-- search.do를 향후 서블렛 이름으로 변경할 것. by 김경래 20180914 -->
<div class="searchbody">
<form id="searchForm" action="<%=request.getContextPath()%>/search.do" method="get">
<div class="center-searchArea">
	<p style="color:white; font-size:23px;">지금 바로 펫시터를 찾아보세요</p>
	<div class="center-searchBar">
	<div class="input-searchBar">
	<input class="searchBar" name="searchKeyword" type="text" style="font-size:20px; font-weight:lighter; border:1px solid white;" placeholder="원하는 펫시팅 조건을 검색해 보세요" autocomplete="off">
	</div>
	<div id="goSearch" onclick="goSearch()" style="height:45px;">
	<span>검색</span>
	</div>
	</div>
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