<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>


/* fixed창 속성 */
.fixed {
	position: fixed;
	/* bottom: 0; */
	top: 30%;
	right: 0;
	/* width: 150px;
	    height : 300px; */
	/* background-color: rgb(207, 183, 175); */
	z-index: 9999;
}

.elem {
	border-radius: 20px;
	width: 190px;
	height: 300px;
	background: rgb(207, 183, 175);
	text-align: center;
}
</style>
</head>
<body>
	<!-- fixed 창 -->
	<div class="fixed elem">
		<p
			style="font-size: 14px; font-weight: 400; line-height: 120%; margin: 0px; padding-top: 15px; padding-bottom: 5px; color: white; font-family: 'Jua', sans-serif;">
			<br>펫카부와 언제든지<br>상담 가능합니다.
		</p>
		<p
			style="color: white; font-size: 24px; font-weight: 600; line-height: 120%; font-family: 'Jua', sans-serif;">
			02-1588-5555<br>Click
		</p>
		<p
			style="color: white; font-size: 14px; font-weight: 400; line-height: 120%; font-family: 'Jua', sans-serif;">
			전화가능시간<br>10:00~19:00
		</p>
		<p
			style="color: white; font-size: 14px; font-weight: 500; line-height: 120%; font-family: 'Jua', sans-serif;">
			카카오톡ID<br>온마음펫시터
		</p>
		<p
			style="color: white; font-size: 14px; font-weight: 400; line-height: 120%; font-family: 'Jua', sans-serif;">
			이메일<br>petkaboo<br>@gmail.com
		</p>
	</div>
</body>
</html>