<%@page import="com.pkb.common.JDBCTemplate"%>
<%@page import="com.pkb.petsitterService.model.vo.PetCategory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, com.pkb.common.JDBCTemplate.*" %>
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
<title>펫시터 등록</title>
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
	<%@ include file="/views/common/menubar.jsp"%>
	<%
		if(loginUser == null || loginUser.getUser_grade() != 3){
	%>
	<script>
		alert('펫시터 회원만 이용할 수 있습니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else {%>
	<%@ include file="/views/common/sidemenubar.jsp"%>
	<% 
		// PetCategory DB 조회
		Properties prop = new Properties();
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM TB_PETCATEGORY P";
		
		// System.out.println("query : " + query);
		
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
		cal.add(Calendar.DATE, 7);
		String endDate = sdf.format(cal.getTime());
		
		// System.out.println("sysdate : " + sysdate1);
		
	%>
	<div class="contentArea">
		<h2><b>펫시터 서비스 등록</b></h2>
		<p>펫시터 서비스를 등록할 수 있습니다.</p>
		<div id="insertFormArea">
			<form id="insertForm" method="post" action="<%=request.getContextPath()%>/insertPetService.do">
				<table id="insertTable">
					<tr>
						<td rowspan="13">프로필 사진</td>
					</tr>
					<tr>
						<td><label>이름 </label>
						</td>
						<td>
						<%=loginUser.getUser_name() %></td>
					</tr>
					<%	
							String[] fullAddress = null;
							String address = "잘못된 주소";
							String zipcode = "잘못된 우편번호";
							
							if(loginUser.getAddress().contains("^")){
							fullAddress = loginUser.getAddress().split("\\^");
							address = fullAddress[0];
							zipcode = fullAddress[1];
							}
					%>
					<tr>
						<td><label>주소 </label>
						</td>
						<td id="address"><%=address %></td>					
					</tr>
					<tr>
						<td><label>우편번호</label>
						</td>
						<td id="zipcode"><%=zipcode %></td>
					</tr>
					<tr>
						<td>
						<label>카테고리 </label>
						</td>
						<td>
						<%if(pcl != null)
							{
								for(PetCategory pc : pcl){ %>
						<input type="radio" value="<%= pc.getPetCategory() %>" name="pet_category" id="<%= pc.getPetCategory() %>">
						<label for="<%= pc.getPetCategory() %>"><%= pc.getCategoryName() %></label>
						<% } 
								}else { %>
						<b>펫 카테고리 불러오기 오류!</b>
						<% } %>
						</td>
					</tr>
					<tr>
						<td>
						<label>서비스 종류</label>
						</td>
						<td>
						<input type="radio" name="contract_type" value="v" id="v">
						<label for="v">방문</label>
						<input type="radio" name="contract_type" value="c" id="c">
						<label for="c">위탁</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>예약가능 요일 </label>
						</td>
						<td>
							<input type="checkbox" name="contract_days" id="mon" value="mon">
							<label for="mon">월</label>
							<input type="checkbox" name="contract_days" id="tues" value="tues">
							<label for="tues">화</label>
							<input type="checkbox" name="contract_days" id="wed" value="wed">
							<label for="wed">수</label>
							<input type="checkbox" name="contract_days" id="thurs" value="thurs">
							<label for="thurs">목</label>
							<input type="checkbox" name="day" id="fri" value="fri">
							<label for="fri">금</label>
							<input type="checkbox" name="contract_days" id="sat" value="sat">
							<label for="sat">토</label>
							<input type="checkbox" name="contract_days" id="sun" value="sun">
							<label for="sun">일</label>
						</td>
					</tr>
					<tr>
						<td>
						<label>서비스 시작 가능일</label>
						</td>
						<td>
						<input type="date" id="contract_start" name="contract_start" value="<%= startDate %>">
						</td>
						</tr>
					<tr>
						<td>
						<label>서비스 종료일</label>
						</td>
						<td>
						<input type="date" id="contract_end" name="contract_end" value="<%= endDate %>">
						</td>
					</tr>					
			<tr>
				<td>
					<label>펫시팅 이용가격 </label>
				</td>
				<td>
					<input type="number" id="service_charge" name="service_charge">
				</td>
			</tr>
			<tr>
				<td><label>최대 서비스 가능 동물 수</label>
				</td>
				<td> <input type="number" id="pet_count" name="pet_count"></td>
			</tr>
			<tr>
				<td><label>서비스 내용</label></td>
						<td> <input type="text"
					id="service_detail" name="service_detail"></td>
							<tr>
				<td><label>제한 사항</label></td>
						<td> <input type="text"
					id="service_restrict" name="service_restrict"></td>	
			</tr>	
			</tr>														
				</table>	
			</form>
		</div>
	</div>
		<br>
		<div class="btnsArea" align="center">
			<button type="submit" class="btn btn-default write">추가하기</button>
			&nbsp;
			<button type="submit" id="submit" onclick="insertService()" class="btn btn-success write">등록하기</button>
			&nbsp;
			<button type="button" class="btn btn-danger cancel">취소하기</button>
		</div>
	<script>
		function insertService(){
			var address = $("#address").text();
			var zipcode = $("#zipcode").text();
			var today = new Date();
			today.setHours(0, 0, 0, 0);
			var startdayArr = $("#contract_start").val().split('-');
			var contract_startDay = new Date(startdayArr[0], startdayArr[1] - 1, startdayArr[2]);
			var enddayArr = $("#contract_end").val().split('-');
			var contract_endDay = new Date(enddayArr[0], enddayArr[1] - 1, enddayArr[2]);
			var chk_petcategory = document.getElementsByName('pet_category');
			var chk_type = document.getElementsByName('contract_type');
			var price = $("#service_charge").val();
			var petcount = $("#pet_count").val();
			price *= 1;
			petcount *= 1;
			
			var sel_type = null;
			var sel_type2 = null;
			
			console.log(price);
			
			var isPetcategoryChk = $("input:checkbox[name='pet_category[]']").is(":checked");

			if($("#pet_category").prop("checked", true)){
				alert("동물 카테고리를 선택하세요.");
				return;
			}
			
			// var isContractTypeChk = $("input:checkbox[name='contract_type[]']").is(":checked");
			
			if($("#contract_type").prop("checked", true)){
				alert("서비스 종류를 선택하세요.");
				return;
			}
			
			var isDaysChk = $("input:checkbox[name='contract_days[]']").is(":checked");
			
			if(!isDaysChk){
				alert('가능 요일은 최소한 1개 이상 선택해야 합니다.');
				return;
			}

			if(contract_startDay >= contract_endDay || today > contract_endDay || today > contract_startDay){
				alert('계약 개시일과 종료일이 잘못되었습니다. 올바르게 입력해 주세요.')
				return;
			}
			
			if(price < 1000){
				alert('가격이 잘못되었습니다. 올바르게 입력해 주세요. 최소 금액은 1천원입니다.');
				return;
			}
			
			if(petcount < 1 || petcount > 5){
				alert('최대 서비스 가능 동물 수가 잘못되었습니다. 1인당 5마리를 초과할 수 없습니다. 올바르게 입력해 주세요.');
				return;
			}
			
			if(address == "잘못된 주소" || zipcode == "잘못된 우편번호"){
				alert('주소가 잘못되었습니다. 회원정보수정에서 올바르게 입력해 주세요.');
				return;
			}
			
			alert('정상');
			console.log(zipcode);
			$("#insertForm").submit();
			
			}
	</script>
	<% } %>

</body>
</html>