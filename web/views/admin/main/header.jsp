<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pkb.member.model.vo.*"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE>
<html>
<style>
	body{
		background-color:#ffffff;
		margin-left:0px;
		margin-top:0px;
		margin-right:0px;
		margin-bottom:0px;
	}
	.admin_header{
		position:relative;
		overflow:hidden;
		width:100%;
		min-width:800px;
		background-color:#353944;
		border-top: 3px solid #228cde;
	}
	.admin_header.top_01{
		position:relative;
		overflow:hidden;
		height:54px;
		width:100%;
		border-bottom:1px solid #535760;
	}
	.top_01 h1 a:link, .top_01 h1 a:visited{
		color: #54a6f2;
		font-family: PT Sans;
		font_size:25px;
		line-height:2;
		text-decoration:none;
	}
	.top_01 h1{
		text-decoration:none;
		position :relative;
		overflow: hidden;
		float:left;
		padding: 15px 0 0 15px;
	}
	.top_01 ul{
		position: relative;
		overflow: hidden;
		float : right;
		padding : 16px 15px 0 0;
		text-decoration:none;
	}
	.top_01 li{
		float: left;
		padding : 8px 0 0 10px;
		text-decoration:none;
	}
	.zzim_area{
		position:relative;
		width:100%;
		z-index:320;
	}
	.topmenu{
		position:relative;
		background-color: #353944;
	}
	.top_02{
		position:relative;
		overflow:hidden;
		width:100%;
		min-width:600px;
		height:42px;
	}
	.top_02 li{
		float:left;
		text-decoration:none;
	}
	.top_02 li:hover{
		float:left;
		text-decoration:none;
		font-weight:bold;
		color:white;
		background:#47434C;
	}
	.top_02 li a:link, .top_02 li a:visited{
		display:block;
		padding: 0 18px;
		line-height:40px;
		height:42px;
		color: #d6d7d9;
		font-size:14px;
		letter-spacing:-0.7pt;
		text-decoration:none;
	}
	/* .search{
		display:inline-block;
		float : right;
	   /*  margin-left: 1330px;
 	    margin-top: 8px; */
 	   
	} */
	.search input{
		height:25px;
		width:200px;
	}
	a:link{
		text-decoration: none;
	}
	
	ol,ul,li,dt,dl,dd{
		list-style: none;
		margin:0;
		padding:0;
	}
	h1,h2,h3,h4,h5{
		margin:0;
	}
	.row.content {
		height: 1500px;
   	    min-width:600px;
    }
	.sidenav {
	    background-color: #f1f1f1;
	    width: 100%;
	    min-width:600px;
	}
	.pull-right{
		float:right;
	}
@media screen and (max-width: 767px) {
   .sidenav {
	    height: auto;
	    padding: 15px;
	    min-width:600px;
    }
   .row.content {
  		height: auto;
 	    min-width:600px;
 	} 
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="admin_header">
	<div class="top_01">
		<h1><a href="">펫카부<span>관리자</span></a></h1>
		<ul>
			<li>
				<a href="">내 홈페이지</a>
			</li>
			<li>
				<a href="">관리자메인</a>
			</li>
			<li class="logout"><a href="">로그아웃</a></li>
		</ul>
	</div>
</div>
<div class="zzim_area" id="zzim_area">
	<div class="topmenu">
		<div class="top_02">
			<ul class="leftMenu">
				<li><a class="menu" href="<%=request.getContextPath()%>/caaList.caa">기본설정</a></li>
				<li><a class="menu" href="<%=request.getContextPath()%>/selectList.me">회원관리</a></li>
				<li><a class="menu" href="">거래관리</a></li>
				<li><a class="menu" href="">통계/현황</a></li>
				<li id="search-bar" class="pull-right" >
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="회원정보 혹은 거래번호">
						</div>
						<button type="submit" class ="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
					</form>
				</li>
			</ul>
		</div>
	</div>
	<% if( loginUser == null || loginUser.getUser_type() == 1){ %>
		<script>
			$(function(){
				location.href="<%=request.getContextPath() %>/views/common/errorPage.jsp";
			})
		</script>
		
	<%} %>
</div>

</body>
</html>