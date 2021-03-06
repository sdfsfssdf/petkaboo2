<%@page import="com.pkb.reservation.model.vo.Reservation"%>
<%@page import="java.util.*"%>\
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pkb.member.model.vo.User"%>
<%ArrayList<Reservation> rsvList = (ArrayList<Reservation>)request.getAttribute("rsvList"); 
String petsitterName = (String)request.getAttribute("petsitterName");
String petName=  (String)request.getAttribute("petName");
String contractNo = (String)request.getAttribute("contractNo");
/* String writter =(String) request.getAttribute("writter"); */
String onetitle = (String)request.getAttribute("onetitle");
String onecontent = (String)request.getAttribute("onecontent");
Date writtedDate = (Date)request.getAttribute("writtedDate");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.contentArea {
	margin-left: 320px;
	width: 60%;
	height: 500px;
	margin-top: 80px;
}
</style>

</head>
<body>

	<a href="/pkb/index.jsp"><h1 align="center" id="logo">로고</h1></a>
	<br>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/sidemenubar.jsp"%>
	<%
	if(loginUser != null){ %>
	<div class="contentArea">
		<h2>리뷰를 남겨주세요</h2>
		<p>돌봐준 펫시터에게 리뷰를 남겨주세요!</p>
		<br>

		<form action="<%=request.getContextPath() %>/insertReview.bo" method="post">

			<div class="title">
				
				<br /> 
				<input type="hidden" name="contractNo" value="<%= contractNo%>" /> 
				
				<label>반려동물이름</label>
				<input type="text" class="form-control writer"  id="detailwriter" name="petName" value="<%= petName%>" readOnly> &nbsp;&nbsp;&nbsp;&nbsp; <br />
					
				<label>펫시터</label> 
				<input type="text" class="form-control writer"	id="detailwriter" name="petsitterName" value="<%= petsitterName%>" readOnly>&nbsp;&nbsp;&nbsp;&nbsp; <br> 
				
				<label>작성자 </label> 
				<input	type="text" class="form-control writer" id="detailwriter" value="<%=loginUser.getUser_name() %>"	readOnly> &nbsp;&nbsp;&nbsp;&nbsp; <br /> 
				
				<label>작성일</label>
				<input type="text" class="form-control date" id="detaildate" name="writtedDate"
					value="<%  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
							 String today = formatter.format(new java.util.Date());
					 out.println(today); %>" readOnly> &nbsp;&nbsp;&nbsp;&nbsp; 
					 
				<input type="text" class="form-control" name="onetitle" placeholder="제목을 입력하세요.">
			</div>
			<br>
			<div class="content">
				<textarea class="form-control" rows="20" cols="30" name="onecontent"
					placeholder="내용을 입력하세요."></textarea>
			</div>

			<br>
			<div class="btns" align="center">
				<button type="submit" class="btn btn-success write">작성하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel">취소하기</button>
			</div>
		</form>
	</div>
	<%}else{ 
	
	request.getRequestDispatcher("../common/login.jsp").forward(request,response);

}%>


</body>
</html>