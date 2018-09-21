<%@page import="com.pkb.reservation.model.vo.Reservation"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%ArrayList<Reservation> rsvList = (ArrayList<Reservation>)request.getAttribute("rsvList"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
.contentArea {
	margin-left: 320px;
	width: 60%;
	height:500px;
	margin-top:80px;
}

.imgArea{
	background:gray;
	text-align:center;
}

.pageing{
	margin-left: 320px;
	width: 60%;
}

.tableArea{
	width:100%;
	
}

.modalTop {
	width:100%;
}

.modalTopContent{
	padding-top:20px;
	height:100px;
	width:300px;
	float:left;
}

.modalTopImg{
	height:100px;
	width:100px;
	float:left;
	background:gray;
	border-radius:50px;
	border:1px solid gray;
	margin-right:20px;
	margin-bottom:20px;
}

.modalContentMenu{
	width:100%;
	border-radius:5px;
	background:black;
	color:white;
	border:1px solid black;
}
</style>
</head>
<body>
	<a  href="/pkb/index.jsp"><h1 align="center" id="logo">로고</h1></a>
	<br>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/sidemenubar.jsp" %>
	<div class="contentArea">
		<h2>예약현황</h2>
		<p>예약현황을 확인 할 수 있습니다.</p>
		<div class="listInfoArea">
		
		<!--  이거 테이블도 여러개지만 반복문으로 처리할 것... -->
		<%-- <form action="<%=request.getContextPath()%>/reservation.ps" method="get"> --%>
			
		
			<table class="tableArea" >
			<% for(int i=0;i<rsvList.size();i++){ %>
				<tr>
					<td class="imgArea" rowspan="4" width="150px">img</td>
					<td>이름 : <%=rsvList.get(i).getUser_name() %></td>
					<td colspan="2"><label>주소 : </label><%=rsvList.get(i).getAddress()%></td>
					
				</tr>
				<tr>
					<td><label>반려동물 이름 : </label><%=rsvList.get(i).getPet_name()%></td>
					<td><label>돌봄 시작일 : </label><%=rsvList.get(i).getContract_start()%></td>
					<td><label>돌봄 종료일 : </label><%=rsvList.get(i).getContract_end() %></td>
				</tr>
				<tr>
					<td colspan="3"><label>에약번호 : <%=rsvList.get(i).getContract_no() %> </label></td>
				</tr>
				<tr>
					<td colspan="3"><button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal">예약보기</button>
					<button type="submit" class="btn btn-success">바로예약</button>
					<button type="submit" class="btn btn-info">리뷰남기기</button></td>
				</tr>
				
				<%} %>
			</table>
			<!-- </form> -->
			<br><br>
			
		</div>
		
	</div>
		<div class="pageing">페이징 처리할 부분..</div>
		
		 <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">예약 상세 내역</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="modalTop">
          	<div class="modalTopImg"></div>
          	<div class="modalTopContent"><label>이름 : </label>이주혁<br>
          		 <label>주소 : </label>경기도 광주시 <br>
          	</div>	
          </div>
          <br clear="both">
          <div class="modalContent">
          	<label>예약번호 : </label><br>
          	<label>돌봄 시작일 : </label> 2018-09-13 <br>
          	<label>돌봄 종료일 : </label> 2018-09-30 <br>
          	<label>반려동물 정보 : </label> 쿠키(푸들) <br>
          	<label>총요금 : </label> 45000원 <br>
          	<label class="modalContentMenu">서비스 진행상황</label>
          	<label>1. 계약</label> v <br>
          	<label>2. 진행중</label>	<br>
          	<label>3. 완료대기</label> <br>
          	<label>4. 완료</label><br>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>