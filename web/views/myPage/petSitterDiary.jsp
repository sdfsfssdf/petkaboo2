<%@page import="com.google.gson.Gson"%>
<%@page import="com.pkb.petsitterService.model.vo.PetsitterDiary"%>
<%@page import="com.pkb.common.JDBCTemplate"%>
<%@page import="com.pkb.petsitterService.model.vo.PetCategory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, com.pkb.common.JDBCTemplate.*" %>
<%
	ArrayList<PetsitterDiary> myList = (ArrayList<PetsitterDiary>)request.getAttribute("myList");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 등록 서비스 수정</title>
<style>
.contentArea{
	margin-top:10px;
	margin-left:10px;
	text-align:center;
}
#insertTable{
	display:inline-block;
	border:1px dotted black;
}
th, tr, td{
	border:1px dotted black;
	padding:10px;
}
</style>
</head>
<body>
<!-- 임시코드를 여기에 넣어서 시험 -->

<!-- 임시코드 끝 -->
	<%@ include file="/views/common/menubar.jsp" %>
	<%
		if(loginUser == null || loginUser.getUser_grade() != 3){
	%>
	<script>
		alert('펫시터 회원만 이용할 수 있습니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if(loginUser.getUser_no() != p.getUser_no()) {%>
	<script>
		alert('잘못된 접근입니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else { %>
	<%@ include file="/views/common/sidemenubar.jsp"%>
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

/* 		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = sdf.format(cal.getTime());
		cal.add(Calendar.DATE, 7);
		String endDate = sdf.format(cal.getTime()); */
		
		// fileName 조회
		con = null;
		pstmt = null;
		rset = null;
		
		query = "SELECT FILE_NAME FROM TB_FILE WHERE FILE_NO = " + loginUser.getFile_no() + " AND USER_NO = " + loginUser.getUser_no();
		
		String fileName = null;
		
		try{
			
			con = JDBCTemplate.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				fileName = rset.getString("file_name");	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}

		// System.out.println("fileName: " + fileName);
		
	%>
	<div class="contentArea">
	</div>

</body>
</html>