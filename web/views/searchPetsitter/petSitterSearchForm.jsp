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
		background-color:brown;
		height:200px;
		padding:1%;
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
	#searchCondition
	{
		color:white;
		text-align:center;
	}	
</style>
</head>
<body>
<div class="searchbody">
<form id="searchForm" action="<%=request.getContextPath()%>/search.do" method="get">
<div class="center-searchArea">
	<h1 style="color:white;"><strong>지역, 동물, 닉네임으로 검색</strong></h1>
	<div id="searchCondition">
	<table align="center">
		<tr>
			<td>
				<label><b>상세 조건: </b></label>
				<input type ="radio" name="gender" value="M"><label for = "M">남자</label>
    			<input type ="radio" name="gender" value="F"><label for = "F">여자</label>
    			&nbsp; &nbsp; &nbsp;
    			<label><b>정렬: </b></label>
    			<input type ="radio" name="arrayCondition" value="priceAsc"><label for = "priceAsc">가격 높은 순</label>
    			<input type ="radio" name="arrayCondition" value="priceDesc"><label for = "priceDesc">가격 낮은 순</label>
    			<input type ="radio" name="arrayCondition" value="distAsc"><label for = "distAsc">거리 가까운 순</label>
    			<input type ="radio" name="arrayCondition" value="distDesc"><label for = "distDesc">거리 먼 순</label>
    	
			</td>
		</tr>
	</table>
	</div>
	<div class="center-searchBar">
	<input class="searchBar" name="searchKeyword" type="text" style="font-size:200%; font-weight:bold;" placeholder="원하는 펫시팅 조건을 검색해 보세요" autocomplete="off">
	<div id="goSearch" onclick="goSearch()"><span>상세검색</span>
	</div><div></div></div>
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