<%@page import="java.sql.SQLException"%>
<%@page import="com.pkb.common.JDBCTemplate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.pkb.petsitterService.model.vo.*"%>
<% ArrayList<PetsitterService> list = (ArrayList<PetsitterService>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Petsitting Service Update</title>
<style>

#MyPetsitterInfoTable th{
	text-align:center;
	
}
button{display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
	user-select: none;
	border: 1px solid transparent;
    border-radius: 4px;
    }
.content-left {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-right {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-center {
	width: 70%;
	float: left;
	/* text-align:center; */
	margin: 0 auto;
	margin-top:80px;
}

tr{
border : 1px solid #eee;
height:40px;
text-align:center;
color:white;
background-color:#9bcdf7;
}
.myContractInfoTable{

}
td{
width:10%;
color:black;
text-align:center;
background-color:white;

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
	
	<div class="content-left"><%@ include file="/views/common/sidemenubar.jsp"%></div>
	<!-- <div class="MyPetsitterInfoheader" id="MyPetsitterInfoheader">
		<h2><b>내 펫시터 등록 정보 및 진행 상황</b></h2>
		<hr>
	</div> -->
	<div class="content-center">
	<hr
						style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				
				<br>
				<!-- 내 펫시터 등록 정보 및 진행 상황 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold; ">펫시터 서비스 등록 정보 및 진행 상황</span>
				<hr
					style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
	<br><br>
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
			<th width="150px">시작 가능일</th>
			<th width="150px">종료일</th>
			<th width="100px">서비스가격</th>
			<th width="50px">상태</th>			
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
			<td><%= p.getContract_start() %></td>
			<td><%= p.getContract_end() %></td>
			<td><%= p.getService_charge() %></td>
			<td>
				<form name="selectContract" method="post" action="<%=request.getContextPath()%>/psContract.do">
					<!-- button 영역 차후 수정 -->
					<input type="hidden" name="contractno" value="<%= p.getPet_service_regno()%>">
					<input type="hidden" name="user_no" value="<%= loginUser.getUser_no() %>">
					<button style="background:#9bcdf7; color:white; border:1px solid #9bcdf7;">계약상태 조회</button>
				</form>
			</td>
		</tr>
		<% } %>
	</table>
	</div>
	</div>
	<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>
	<div class="content-right"></div>
		<!-- footer -->
				<%@ include file="/views/common/footer.jsp" %>
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