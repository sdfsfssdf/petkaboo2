<%@page import="java.sql.SQLException"%>
<%@page import="com.pkb.common.JDBCTemplate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.pkb.petsitterService.model.vo.*"%>
<% ArrayList<PetsitterService> list = (ArrayList<PetsitterService>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Petsitting Service Update</title>
<style>
#MyPetsitterInfoheader{
	text-align:center;
}
hr{
	width:50%;
	border:1px solid black;
}
#MyPetsitterInfoTable{
	margin-top:1%;
	margin-right:5%;
	margin-left:20%;
	width:auto;
	border:1px solid black;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%
		if(loginUser == null || loginUser.getUser_grade() != 3){
	%>
	<script>
		alert('펫시터 회원만 이용할 수 있습니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if(loginUser.getUser_no() != Integer.parseInt((String)(request.getParameter("user_no")))) {%>
	<script>
		alert('비정상적인 접근!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else { %>
	<%@ include file="/views/common/sidemenubar.jsp"%>
	<div class="MyPetsitterInfoheader" id="MyPetsitterInfoheader">
		<h2><b>내 펫시터 등록 정보 수정</b></h2>
		<hr>
	</div>
		<% 
		// PetCategory DB 조회
		Properties prop = new Properties();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM TB_PETCATEGORY P";
		
		ArrayList<PetCategory> pcl = null;
		
		try{
			con = JDBCTemplate.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			pcl = new ArrayList<PetCategory>();
			
			while(rset.next()){
				PetCategory pc = new PetCategory();
				
				pc.setPetCategory(rset.getInt("pet_category"));
				pc.setCategoryName(rset.getString("pet_categoryname"));
				
				pcl.add(pc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
	%>
	<div class="MyPetsitterInfoTable" id="MyPetsitterInfoTableOuter">
	<table id="MyPetsitterInfoTable">
		<tr>
			<th width="100px">서비스번호</th>
			<th width="100px">동물카테고리</th>
			<th width="100px">서비스 종류</th>
			<th width="200px">예약가능 요일</th>
			<th width="150px">시작 가능일</th>
			<th width="150px">종료일</th>
			<th width="100px">서비스가격</th>			
		</tr>
		<% for(PetsitterService p : list){ %>
		<tr>
			<td id="psrno" name="psrno" class="psrno"><%= p.getPet_service_regno() %></td>
			<td>
			<% String petName = null;
			
				for(PetCategory pc : pcl){
				
				if(pc.getPetCategory() == p.getPet_category()){
					
					petName = pc.getCategoryName();
					
				}	
			}
			%><%= petName %>
			</td>
			<td>
			<% 
				String contract_type = null;
			
				if(p.getContract_type().equals("v")){
					contract_type = "방문";
				} else {
					contract_type = "위탁";
				}
			%>
			<%= contract_type %></td>
			<td><%= p.getContract_days() %></td>
			<td><%= p.getContract_start() %></td>
			<td><%= p.getContract_end() %></td>
			<td><%= p.getService_charge() %></td>
		</tr>
		<% } %>
	</table>
	</div>
			<%-- 페이지 처리 --%>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled><</button>		
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=currentPage - 1 %>'"><</button>
			<% } %>
			<%
				for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
			%>
				<button disabled><%= p %></button>
			<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=p %>'"><%= p %></button>
			<% } %>			
			
			<% } %>
			
			<% if(currentPage >= maxPage){ %>
				<button disabled>></button>
			<% } else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=maxPage%>'">>></button>
			</div>
			<%-- 페이지 처리 끝 --%>
	<script>
		$(function(){
			$(".MyPetsitterInfoTable td").click(function(){
				var num = $(this).parent().children("#psrno").text();
				console.log(num);
				location.href = "<%=request.getContextPath()%>/selectOne.do?no=" + num;
			});
		});
	</script>			
	<% }%>
</body>
</html>