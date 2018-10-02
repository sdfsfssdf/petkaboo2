<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petkaboo PetSitter Search Module Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.searchbody{
		background-color:#89c5f5;
		height:300px;
		padding:1%;
	}
	.center-searchArea{
	text-align:center;
	margin-top:80px;
	}
	.searchBar{
		width:600px;
		height:50px;
		border : 1px solid white;
	}
	.center-searchBar{
	display:inline-block;

	}
	input::placeholder {
	text-align:center;
  	/* font-weight: bold; */
  	font-size: 100%;
	}
	#goSearch {
		margin-left:10px;
		color:#89c5f5;
		background:white;
	/* 	font-weight:bold; */
		border-radius:5px;
		width:100px;
		height:48px;
		text-align:center;
  		/* display:inline-block; */
  		float:left;
  		/* vertical-align:30%; */
  		padding-top:8px;
	}
	#goSearch:hover {
		cursor:pointer;
		background:white;
		color:black;
	}

	#searchCondition
	{
		color:white;
		text-align:center;
	}	
	
	.search{
	float:left;
	}
	
	input{    
	outline: none;
    transition: border .12s ease-in-out;
}

	.sort input[type="radio"]{
	font-weight:lighter;
	} 
	
	

.searchBar input[name="searchKeyword"]{
    border-radius: 30px;
    box-sizing: border-box;
    color: #999;
    height: 40px;
    padding-left: 40px;
    padding-right: 20px;
    -webkit-appearance: none;
    width: 100%;
}

	
	.sort td{
		font-weight:lighter;
		font-size:14px;
	}
}
</style>
</head>
<body>
<div class="searchbody">
<form id="searchForm" action="<%=request.getContextPath()%>/search.do" method="get">
<div class="center-searchArea">
	<span style="color:white; font-size:19px;">지역, 동물, 닉네임으로 검색</span>
	<div id="searchCondition">
	<table class="sort" align="center">
		<tr>
			<td>
				<label"><b>상세 조건 &nbsp;: </b></label>&nbsp;
				<input type ="radio" name="gender" value="M"><label for = "M">&nbsp;남자</label>&nbsp;
    			<input type ="radio" name="gender" value="F"><label for = "F">&nbsp;여자</label>
    			&nbsp; &nbsp; &nbsp;
    			<label><b>정렬 &nbsp;: </b></label>&nbsp;&nbsp;
    			<input type ="radio" name="arrayCondition" value="priceAsc"><label for = "priceAsc">&nbsp;가격 높은 순</label>&nbsp;
    			<input type ="radio" name="arrayCondition" value="priceDesc"><label for = "priceDesc">&nbsp;가격 낮은 순</label>
    			<!--
    			<input type ="radio" name="arrayCondition" value="distAsc"><label for = "distAsc">거리 가까운 순</label>
    			<input type ="radio" name="arrayCondition" value="distDesc"><label for = "distDesc">거리 먼 순</label>
				 -->
			</td>
		</tr>
	</table>
	</div>
	<div class="center-searchBar">
	<div class="search">
	<input class="searchBar" name="searchKeyword" type="text"  style="font-size:14px; width:600px; height:35px; font-color:#999;" placeholder="원하는 펫시팅 조건을 검색해 보세요" area-label="원하는 펫시팅 조건을 검색해 보세요" autocomplete="off">
	</div>
	<div id="goSearch" style="height:35px; width:80px; background-color:white; "onclick="goSearch()">
	<p style="font-size:14px; font-weight:bold;  vertical-align:middle;">검색</p>
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