<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>Petsitter Apply</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%
		if(loginUser == null){
	%>
	<script>
		alert('로그인 후 이용해 주세요');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if (loginUser.getUser_grade() == 3) { %>
	<script>
		alert('이미 펫시터 회원입니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else if (request.getAttribute("applyPetsitter") != null && request.getAttribute("applyPetsitter").toString().equals("OK")){%>
	<div id="applyMain">
		<b>펫시터 지원에 감사드립니다. 관리자가 지원서 확인 후 연락을 드릴 것입니다.</b>
	</div>
	<% } else {%>
	<div id="applyMain">
	<table>
		<tr>
			<td>
				펫시터 지원을 하시겠습니까? 25세 이상의 회원만 가능합니다.
				아래의 링크를 클릭해 구글 폼으로 지원서를 제출하고, 제출완료 버튼을 눌러주세요.
			</td>
		</tr>
		<tr>
			<td>
			<a href="https://goo.gl/forms/U9POJ4cUc5Chg2Aq2" target="blank">펫카부 펫시터 지원서 작성</a>
			<form name="applyPetsitterForm" method="post" action="<%=request.getContextPath()%>/ApplyPetsitter.req">
			<input type="hidden" name="apCheck" value="Y">
			<button>펫카부 펫시터에 지원합니다</button>
			</form>
			</td>
		</tr>
	</table>
	</div>
	<% } %>
</body>
</html>