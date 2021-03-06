<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.pkb.board.model.vo.*, java.util.*, com.pkb.common.Paging, com.pkb.member.model.vo.User"%>

 <% 
 	
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
 
	Paging pg = (Paging)request.getAttribute("pg");
	int currentPage = pg.getCurrentPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
	int oneByOneListCount = pg.getListCount();
	int maxPage = pg.getMaxPage();
	
	
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
.contentArea {
	margin-top: 80px;
	margin-left: 320px;
	width: 60%;
}

th {
	background: lightgray;
}

.container {
	margin-left: 0px;
	width: 90%;
	height: 430px;
	padding: 0px;
}

.first {
	width: 15%
}

.second {
	width: 60%;
}

.third {
	width: 25%;
}

.form-control {
	width: 15%;
	display: inline-block;
	marig-left: 5px;
}

.search {
	width: 45%;
}

.searchArea{
	margin-left:5%;
}

.pagingArea{
	margin-left:30%;
}

button{
	border-style:none;
	background:white;
	color:black;
	
}

button:hover{
color:#9bcdf7;
}

button:active{
	outline:none;
}

btn-success:active{
outline:none;
}

th{
background-color:#9bcdf7;
border-style:none;
color:white;
}
</style>
</head>
<body>




	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/oldMenubar.jsp"%>
	<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>
<%


if(loginUser != null){ %>
	
	<%@ include file="../common/sidemenubar.jsp"%>
	<div class="contentArea">
		<h2>내 질문내역</h2><br>
		<p>나의 1:1 문의내역을 확인할 수 있습니다.</p>
		<br>
		<div class="container">
			<table class="table table-hover" id="listArea">
				<tr >
				   
					<th class="first">글번호</th>
					<th class="second">제목</th>
					<th class="third">작성일</th>
				</tr>

				 <%for(Board b : list){ %>

				<tr>
					
				    <input type="hidden" value="<%=b.getArticle_no() %>">
					<td><%=b.getArticle_no() %></td>
					<td><%=b.getArticle_title()%></td>
					<td><%=b.getArticle_date()%></td>
				</tr>

				<% } %> 

			</table>
		</div>
		<!-- 페이지처리 -->
		<div class="pagingArea">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    <button onclick="location.href='<%=request.getContextPath()%>/selectOnebyOneList.bo?currentPage=1'"><<</button>
			<% if(currentPage <= 1 ){ %>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href'<%=request.getContextPath()%>/selectOnebyOneList.bo?currentPage=<%=currentPage - 1%>'"><</button>
			<%} %>

			<!-- 1,2,3,4,5버튼 -->
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
				%>
			<button disabled><%= p %></button>
			<% 	}else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectOnebyOneList.bo?currentPage=<%=p%>'"><%= p %></button>

			<% } %>

			<% } %>

			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectOnebyOneList.bo?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectOnebyOneList.bo?currentPage=<%=maxPage%>'">>></button>

		</div>
		
		
		
		<div class="searchArea" style="text-align:right; width:85%">
<!-- 			<form name="searchOne">
			<select class="form-control" id="searchCondition"
				name="searchCondition">
				<option>----</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="date">작성일</option>
			</select> <input type="search" class="form-control search">
			<button type="submit" class="btn btn-default">검색하기</button>
			</form> -->
			<button onclick="location.href='/pkb/views/myPage/onebyoneQNAWrite.jsp'"
				class="btn btn-success" style="border:1px solid #9bcdf7; color:white; background-color:#9bcdf7;">작성하기</button>
			
		</div>
		

	</div>
	<%@ include file="/views/common/footer.jsp" %>
	
	
	<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"})
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/selectOneOnebyOne.bo?num=" + num;
			});
		});
	
		
		$(function(){
			
			
		})
	
	</script>
	
	<%
		} else {
	%>
	<script>
		alert('로그인한 회원만 이용 가능합니다.')
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	

	<%
		}
	%>
	
	
</body>
</html>