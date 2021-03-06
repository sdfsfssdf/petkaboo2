<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.pkb.board.model.vo.*, com.pkb.member.model.vo.*"%>
<%
	Board b = (Board) (request.getAttribute("b"));
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.contentArea {
	margin-top: 80px;
	margin-left: 320px;
	width: 60%;
}

.no {
	display: inline-block;
	width: 10%;
}

.oboTitle {
	display: inline-block;
	width: 65%;
}

.topView label {
	width: 10%;
	align: cetner;
}

.topView input[type=text] {
	background: white;
}

.labelTitle {
	margin-left: 15px;
}

.writer {
	display: inline-block;
	width: 20%;
}

.date {
	display: inline-block;
	width: 20%;
}

.category {
	display: inline-block;
	width: 22%;
}
</style>
</head>
<body>
	
		<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/oldMenubar.jsp"%>
	<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>

	<%
		if (loginUser != null) {
	%>
	<%@ include file="../common/sidemenubar.jsp"%>
	<div class="contentArea">
		<!-- 구현하시는 분이 따로 action을 정의해주셔야 합니다. -->
		<form action="<%=request.getContextPath()%>/oneModify.bo"
			method="post">
			<h2>1:1문의 수정하기</h2>
			<p>나의 1:1 문의를 수정할 수 있습니다.</p>
			<br>
			<table>

			</table>
			<div class="topView">

				<label>글번호</label> <input type="text" class="form-control no"
					id="num" name="num" value="<%=b.getArticle_no()%>" readOnly>
				&nbsp;&nbsp; <label class="labelTitle">제목</label> <input type="text"
					class="form-control oboTitle" id="detailtitle" name="title"
					value="<%=b.getArticle_title()%>">
				<!-- 받아온 정보를 넣어야함.-->

				<br> <br> <label>작성자 </label> <input type="text"
					class="form-control writer" id="detailwriter" name="writer"
					value="<%=b.getUser_name()%>" readOnly>
				&nbsp;&nbsp;&nbsp;&nbsp; <label>작성일</label> <input type="text"
					class="form-control date" id="detaildate" name="date"
					value="<%=b.getArticle_date()%>" readOnly>
				&nbsp;&nbsp;&nbsp;&nbsp;

				<%-- <label>카테고리</label>
				<input type="text" class="form-control category" id="detailcategory" value="<%=b.getUser_name() %>" readOnly> --%>

			</div>
			<br>
			<div class="content">
				<textarea class="form-control" rows="20" cols="30" name="content"
					id="comment" value=""><%=b.getArticle_contents()%></textarea>
			</div>
			<br>
			<div class="btns" align="center">
				<button type="submit" class="btn btn-success write" style="background:#9bcdf7; color:white; border:1px solid #9bcdf7;">수정하기</button>
				&nbsp;
				<button type="button" class="btn btn-danger cancel"
					onclick="location.href='<%=request.getContextPath()%>/selectOnebyOneList.bo'" style="background:white; color:#9bcdf7; border:1px solid #9bcdf7;">취소하기</button>
			</div>
		</form>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
	
	<%
		} else {
	%>
	<script>
		alert('로그인한 회원만 이용 가능합니다.')
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	

	<%
		}
	%>
</body>
</html>