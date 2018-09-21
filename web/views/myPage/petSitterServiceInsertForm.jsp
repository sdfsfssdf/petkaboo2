<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, com.pkb.member.model.vo.User" %>
<% User loginUser = (User)session.getAttribute("loginUser");%>
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
	<h1 align="center" id="logo">로고</h1>
	<br>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/sidemenubar.jsp"%>

	<div class="contentArea">
		<h2><b>펫시터 서비스 등록</b></h2>
		<p>펫시터 서비스를 등록할 수 있습니다.</p>
		<div id="insertFormArea">
			<form id="insertForm" method="post" action="<%=request.getContextPath()%>/insertPetService.do">
				<table id="insertTable">
					<tr>
						<td rowspan="13">프로필 사진을 여기에</td>
					</tr>
					<tr>
						<td><label>이름 </label><input type="text" placeholder="<%=loginUser.getUser_name() %>" readonly></td>
					</tr>
					<tr>
						<td><label>주소 </label><input type="text" placeholder="<%=loginUser.getAddress() %>" readonly></td>					
					</tr>
					<tr>
						<td><label>카테고리 </label> <input type="radio" value="1"
						name="pet_category" id="1"><label for="dog">개</label> <input
						type="radio" value="2" name="pet_category" id="2"><label
						for="2">고양이</label> <input type="radio" value="3"
						name="pet_category" id="3"><label for="3">파충류</label> <input
						type="radio" value="4" name="pet_category" id="4"><label
						for="4">조류</label> <input type="radio" value="5"
						name="pet_category" id="5"><label for="5">어류</label></td>
					</tr>
					<tr>
						<td><label>서비스 종류</label>
						<input type="radio" name="contract_type" value="v" id="v">
						<label for="v">방문</label>
						<input type="radio" name="contract_type" value="c" id="c">
						<label for="c">위탁</label>
						</td>
					</tr>
					<tr>
					<td><label>예약가능 요일 </label><input type="checkbox"
					name="contract_days" id="mon" value="mon"><label for="mon">월</label>
					<input type="checkbox" name="contract_days" id="tues" value="tues"><label
					for="tues">화</label> <input type="checkbox" name="contract_days" id="wed"
					value="wed"><label for="wed">수</label> <input
					type="checkbox" name="contract_days" id="thurs" value="thurs"><label
					for="thurs">목</label> <input type="checkbox" name="day" id="fri"
					value="fri"><label for="fri">금</label> <input
					type="checkbox" name="contract_days" id="sat" value="sat"><label
					for="sat">토</label> <input type="checkbox" name="contract_days" id="sun"
					value="sun"><label for="sun">일</label></td>
					</tr>
					<tr>
						<td><label>서비스 시작 가능일</label><input type="date" id="contract_start" name="contract_start" value="2017-01-01">
						</td>
						</tr>
					<tr>
						<td><label>서비스 종료일</label><input type="date" id="contract_end" name="contract_end" value=""></td>
					</tr>					
			<tr>
				<td><label>펫시팅 이용가격 </label><input type="number" id="service_charge" name="service_charge"></td>
			</tr>
			<tr>
				<td><label>최대 서비스 가능 동물 수</label> <input type="number" id="pet_count" name="pet_count"></td>
			</tr>
			<tr>
				<td><label>서비스 내용</label> <input type="text"
					id="service_detail" name="service_detail"></td>
							<tr>
				<td><label>제한 사항</label> <input type="text"
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
			$("#insertForm").submit();
		}
	</script>

</body>
</html>