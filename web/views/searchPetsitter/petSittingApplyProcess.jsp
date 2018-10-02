<%@page import="com.pkb.reservation.model.vo.Contract"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.pkb.common.JDBCTemplate"%>
<%@page import="com.pkb.petsitterService.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   PetsitterService p = (PetsitterService)request.getAttribute("p");
	Contract c = (Contract)request.getAttribute("c");
	String checkApply = (String)request.getAttribute("afterApply");
	String errorCode = (String)request.getAttribute("errorCode");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>PetSitter Service Apply</title>
</head>
<body>
	<!-- menubar include -->
	<%@ include file="../common/menubar.jsp"%>
	<%
		if(loginUser == null){
	%>
	<script>
		alert('로그인 후 이용해 주세요!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if(c != null && errorCode != null && errorCode.equals("alreadyExist")){ %>
	<script>
		alert('이미 해당 펫시터 서비스에 계약 신청을 한 상태입니다!');
	</script>
		<div class="ApplyInfoDiv">
		<table>
			<tr>
				<td>다음과 같은 정보로 펫시팅 서비스를 신청한 상태입니다.</td>
			</tr>
			<tr>
				<td><b><%= c.getPetNickname() %></b> 펫시터</td>
				<td><b>계약 신청일:</b> <%= c.getContract_date() %></td>
				<td><b>계약 시작 희망일:</b> <%= c.getContract_start() %></td>
				<td><b>계약 종료 희망일:</b> <%= c.getContract_end() %></td>
			</tr>
			<tr>
				<td>이 div에서 취소 페이지로 갈 수 있게 설정</td>
			</tr>
		</table>
	</div>
	<% } else if(checkApply != null && checkApply.equals("y") && c != null) { %>
	<div class="checkApplyDiv">
		<table>
			<tr>
				<td>다음과 같은 정보로 펫시팅 서비스를 신청하는데 성공했습니다.</td>
			</tr>
			<tr>
				<td><b><%= c.getPetNickname() %></b> 펫시터</td>
				<td><b>계약 신청일:</b> <%= c.getContract_date() %></td>
				<td><b>계약 시작 희망일:</b> <%= c.getContract_start() %></td>
				<td><b>계약 종료 희망일:</b> <%= c.getContract_end() %></td>
			</tr>
			<tr>
				<td><b>이 div에서는 더 이상 할 것이 없음</b></td>
			</tr>
		</table>
	</div>
	<% } else if(c.getContract_status().equals("W")) { %>
	<div id="paymentDiv">
	<b>펫시터가 계약신청을 수락했습니다. 결제가 필요합니다.</b>
	</div>
	<% } else if(p == null) {%>
	<script>
		alert('비정상적인 접근');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>		
	<% } else { %>
	<!-- 신청서 메인 페이지 시작 -->
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
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = sdf.format(cal.getTime());
		cal.add(Calendar.DATE, 1);
		String endDate = sdf.format(cal.getTime());		
	%>
	<div class="applyBody">
		<div id="petsitterInfo">
		<h2>선택하신 펫시터 및 서비스 정보입니다</h2>
		<hr>
		<table id="petsitterInfoTable">
			<tr>
				<th width="100px">펫시터 닉네임</th>
				<th width="100px">펫시터 성명</th>
				<th width="100px">동물</th>
				<th width="200px">서비스 종류</th>
				<th width="150px">가능일</th>
				<th width="150px">시작일</th>
				<th width="150px">종료일</th>
				<th width="100px">서비스가격</th>
				<th width="50px">상태</th>			
			</tr>
			<tr>
				<td><%= p.getNickname() %></td>
				<td><%= p.getUser_name() %></td>
				<td>
					<% 						
						PetCategory pc = null;
					
						for (PetCategory pc2 : pcl){
					    	if (pc2.getPetCategory() == p.getPet_category()){
					        	 pc = pc2;
					     	    break;
					    	}
						}
					%>
					<%= pc.getCategoryName() %>
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
					<%= contract_type %>	
				</td>
				<td><%= p.getContract_days() %></td>
				<td><%= p.getContract_start() %></td>
				<td><%= p.getContract_end() %></td>
				<td><%= p.getService_charge() %></td>				
			</tr>
		</table>
		<!-- 임시 구분자 -->
		<hr>
		<form id="applyForm" method="post" action="<%=request.getContextPath()%>/requestPetService.do">
		<table id="clientInfoTable">
			<tr>
				<th width="100px">성명</th>
				<th width="100px">전화번호</th>
				<th width="250px">주소</th>
				<th width="100px">동물</th>
				<th width="100px">동물 숫자</th>
				<th width="100px">서비스종류</th>
				<th width="150px">서비스 시작희망일</th>
				<th width="150px">종료일</th>
				<th width="50px">상태</th>			
			</tr>
			<tr>
				<input type="hidden" name="clientUserno" value="<%= loginUser.getUser_no() %>">
				<input type="hidden" name="psUserno" value="<%= p.getUser_no() %>">
				<input type="hidden" name="psrno" value="<%= p.getPet_service_regno() %>">
				<td><input type="text" name="clientName" placeholder="<%= loginUser.getUser_name() %>" value="<%= loginUser.getUser_name() %>" readonly></td>
				<td><input type="text" name="clientPhone" placeholder="<%= loginUser.getPhone() %>" value="<%= loginUser.getPhone() %>"></td>
				<td><input type="text" name="clientAddress" placeholder="<%= loginUser.getAddress() %>" value="<%= loginUser.getAddress() %>"></td>
				<td><%= pc.getCategoryName() %></td>
				<td> <input type="number" id="request_count" name="request_count"></td>
				<td><%= contract_type %></td>
				<td>
				<input type="date" id="request_start" name="request_start" value="<%= startDate %>">
				</td>
				<td>
				<input type="date" id="request_end" name="request_end" value="<%= endDate %>">
				</td>
				<td>정상</td>
			</tr>		
		</table>
		<button>펫시팅 요청 보내기</button>
		</form>
		</div>
	</div>
	<% } %>
</body>
</html>