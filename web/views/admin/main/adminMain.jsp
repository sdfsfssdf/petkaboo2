<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%@include file="/views/admin/main/header.jsp" %>
	
		<%@include file="/views/admin/main/leftSide.jsp" %>
		<%@include file="/views/admin/main/rightSide.jsp" %>
	
	<%-- <script>
		$(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/getClientIp.ad", //요청을 보냄
				type : "post",
				success : function(data) {
					console.log(data); 

				},
				error : function(status, msg) {
					console.log(status);
					console.log(msg);

				}
			});
		})
	</script> --%>
</body>

</html>