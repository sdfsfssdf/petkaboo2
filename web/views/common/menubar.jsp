<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤더 상단메뉴</title>
<style>
.menubar>li>div>a:-webkit-any-link {
	cursor: pointer;
	text-decoration: none;
	transition: top 1s ease-out;
	color: black;
	margin: 1px 1px 1px 1px;
}

.menubar>li>div>a:hover {
	color: rgb(207, 183, 175);
}

.depth-02 {
	position: relative;
	/*   padding:20px; */
}

.menubar {
	text-align: center;
	font-size: 15px;
}

.menubar>li>div:hover {
	border:1px solid black;
   border-radius:30px;
}

.menubar>li>div {
	border:1px solid rgba(0,0,0,0);
   border-radius:30px;
}

.menubar>li {
	margin: 1.5%;
	display: inline-flex;
	text-align: -webkit-match-parent;
	font-size: 12px;
}
</style>
</head>
<body>

	<div>


		<div class="depth-02">

			<ul class="menubar">
				<li><div>
						<a href="<%=request.getContextPath()%>/index.jsp">HOME</a>
					</div></li>
				<li><div>
						<a href="/w.jsp">SERVICE</a>
					</div></li>
				<li><div>
						<a href="<%=request.getContextPath()%>/PetSitter.all">PETSITTER</a>
					</div></li>
				<li><div>
						<a href="/">STEP</a>
					</div></li>
				<li><div>
						<a href="/">RESERVATION</a>
					</div></li>
				<li><div>
						<a href="01_reviews.jsp">VOICE</a>
					</div></li>
				<li><div>
						<a href="/">FAQ</a>
					</div></li>
				<li><div>
						<a href="05_companyInfo.jsp">INTRODUCE</a>
					</div></li>
			</ul>



		</div>
	</div>

</body>
</html>