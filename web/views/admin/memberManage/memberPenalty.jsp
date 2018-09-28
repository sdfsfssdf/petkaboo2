<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,com.pkb.common.Paging, com.pkb.member.model.vo.*, com.pkb.board.model.vo.*"%>
<%
	HashMap<String,Object> pMap = (HashMap<String,Object>)request.getAttribute("pMap");
	ArrayList<Board> mlist = (ArrayList<Board>) pMap.get("pmlist");
	ArrayList<Board> rList = (ArrayList<Board>) pMap.get("reList");
	ArrayList<Board> sList = (ArrayList<Board>) pMap.get("seList");
	Paging pg = (Paging) request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	.outer{
		float:left;
		width:1000px;
		height:600px;
		color:black;
		margin-left:20px;
		margin-right:auto;
		margin-top:20px;
	}
	.first-row{
		float:left;
		width:100%;
	}
	.table1{
		float:left;
		width:1000px;
		height:950px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.head > th{
		background: #ddd;
		text-align:center;
	}
	
	.vertical_line{
		width:1px;
		border:0.5px solid lightgray;
		height:300px;
		display:inline-block;
		margin-left:20px;
		margin-right:20px;
	}
	
	.leftWrapArea{
		height:1450px !important;  
	}
</style>
</head>
<body>
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
	<div class="first-row">
	<div class="table1">
	<h2>제재/탈퇴 회원관리</h2>
	<p>제재/탈퇴 처리된 회원의 이력을 확인할 수 있습니다.</p>
	<hr>
	<div style="display:inline-block; width:47%; height:300px; overflow:auto" >
		<h4 style="display:inline-block">최근 탈퇴/제재 : <%if(rList != null ){%> <%=rList.size()%> <%} %>  명</h4>
		<table class="table table-hover" align="center" id="recentlyMemberListTable" >
			<tr class="head">
				<th>회원번호</th>
				<th>아이디</th>
				<th>일자</th>
				<th>구분</th>
			</tr>
			<%if(rList != null){
			for(int i = 0; i < rList.size();i ++) {%>
				<tr align="center">
					<input type="hidden" value="<%=rList.get(i).getArticle_no() %>">
					<td><%=rList.get(i).getArticle_title().substring(1,rList.get(i).getArticle_title().indexOf("/")) %></td>
					<td><%=rList.get(i).getArticle_title().substring(rList.get(i).getArticle_title().indexOf("/")+1,rList.get(i).getArticle_title().lastIndexOf(")")) %></td>
					<td><%=rList.get(i).getArticle_date() %></td>
					<td>
						<%if(rList.get(i).getArticle_type().equals("D")){ %>
							<div style="border-radius:10px; background:red; color:white" align="center">탈퇴</div>
						<%} else {%>
							<div style="border-radius:10px; background:orange; color:white" align="center">제재</div>
						<%} %>
					</td>
				</tr>
			<%} 
			} else { %>
				<tr>
					<td colspan="4">이력이 존재하지 않습니다.</td>
				</tr>
			<%} %>
		</table>
	</div>
	<div class="vertical_line"></div>
	<div style="display:inline-block; width:47%;height:300px; overflow:auto">
		<h4 style="display:inline-block">제재 만료 처리</h4>
		<div style="float:right">
			<button class="btn btn-default" id="totalProcessBtn" name="totalProcessBtn">일괄처리</button>
			<button class="btn btn-default" id="selectProcessBtn" name="selectProcessBtn">선택처리</button>
		</div>
		<table class="table table-hover" align="center" >
			<tr class="head">
				<th><input type="checkbox" class="masterCheck"></th>
				<th>회원번호</th>
				<th>아이디</th>
				<th>정지일</th>
				<th>만료일</th>
			</tr>
			<%if(sList != null) { %>
				<%for(int i = 0; i < sList.size();i ++) {%>
					<tr align="center">
						<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectUserNo1" class="childCheck" value="<%=sList.get(i).getArticle_title().substring(1,sList.get(i).getArticle_title().indexOf("/")) %>/<%=sList.get(i).getArticle_no()%>"></td>
						<td><%=sList.get(i).getArticle_title().substring(1,sList.get(i).getArticle_title().indexOf("/")) %></td>
						<td><%=sList.get(i).getArticle_title().substring(sList.get(i).getArticle_title().indexOf("/")+1,sList.get(i).getArticle_title().lastIndexOf(")")) %></td>
						<td><%=sList.get(i).getArticle_date()%></td>
						<td><%=sList.get(i).getArticle_modify_date() %></td>
					</tr>
				<%} %>
			<%} else {%>
				<tr>
					<td colspan="5">이력이 존재하지 않습니다.</td>
				</tr>
			<%} %>
		</table>
	</div>
	<script>
		$(function(){
			$('.masterCheck').click(function(){
				$('.childCheck').prop('checked',this.checked);
			});
			
			$("#selectProcessBtn").click(function(){
				var checkBoxs = document.getElementsByName("selectUserNo1"); // 체크박스 객체
				var len = checkBoxs.length;
				var checkRow = "";
				var checkCnt = 0;
				var checkLast = "";
				var rowid = '';
				var values = "";
				var cnt = 0;
				for(var i = 0; i < len ; i ++){
					if(checkBoxs[i].checked == true){
						checkCnt++;
						checkLast = i;
					}
				}
				
				for(var i = 0; i < len ; i ++){
					if(checkBoxs[i].checked == true){
						checkRow = checkBoxs[i].value;
						
						if(checkCnt == 1){
							rowid += checkRow;
						} else {
							if(i == checkLast){
								rowid += checkRow ;
							} else {
								rowid += checkRow + ",";
							}
						}
						
						cnt ++;
						checkRow = '';
					}	
				}
				
				if(rowid === ''){
					alert('제재를 만료시킬 회원을 선택해 주세요')
					return;
				}
				location.href="<%=request.getContextPath()%>/updateSantions.me?selecUserNo="+rowid;
			})
		
			$('#totalProcessBtn').click(function(){
				var checkBoxs = document.getElementsByName("selectUserNo1"); // 체크박스 객체
				var len = checkBoxs.length;
				var checkRow = "";
				var rowid = '';

				for(var i = 0; i < len ; i ++){
					checkRow = checkBoxs[i].value;
						if(i == 0){
							if(len == 0) {
								rowid += checkRow;
							} else {
								rowid += checkRow+",";
							}
						} else {
							if(i == len -1){
								rowid += checkRow ;
							} else {
								rowid += checkRow + ",";
							}
						}
					checkRow = '';
				}	
				location.href="<%=request.getContextPath()%>/updateSantions.me?selecUserNo="+rowid;
			})
		});
	</script>
	
	<hr>
	<h3>전체 제재/탈퇴 이력</h3>
		<table class="table table-hover" align="center" id="penaltyMemberListTable">
			<tr class="head">
				<th>회원번호</th>
				<th>아이디</th>
				<th>일자</th>
				<th>제재만료일</th>
				<th>구분</th>
			</tr>
			<%if(mlist != null){
			for(int i = 0; i < mlist.size();i ++) {%>
				<tr align="center">
					<input type="hidden" value="<%=mlist.get(i).getArticle_no()%>">
					<td><%=mlist.get(i).getArticle_title().substring(1,mlist.get(i).getArticle_title().indexOf("/")) %></td>
					<td><%=mlist.get(i).getArticle_title().substring(mlist.get(i).getArticle_title().indexOf("/")+1,mlist.get(i).getArticle_title().lastIndexOf(")")) %></td>
					<td><%=mlist.get(i).getArticle_date() %></td>
					<td>
						<%if(mlist.get(i).getArticle_type().equals("D")){ %>
							-
						<%} else {%>
							<%=mlist.get(i).getArticle_modify_date() %>
						<%} %>
					</td>
					<td>
						<%if(mlist.get(i).getArticle_type().equals("D")){ %>
							<div style="border-radius:10px; background:red; color:white" align="center">탈퇴</div>
						<%} else {%>
							<div style="border-radius:10px; background:orange; color:white" align="center">제재</div>
						<%} %>
					</td>
				</tr>
			<%} 
			} else { %>
				<tr>
					<td colspan="4">이력이 존재하지 않습니다.</td>
				</tr>
			<%} %>
		</table>
	</div>
	
	<script>
		$(function(){
			
			$('#penaltyMemberListTable td').click(function(){
				var num = $(this).parent().children("input[type=hidden]").val();
				console.log(num);
				$.ajax({
					url:"selectPenaltyOne.me",
					data : {
						selectNum : num
					},
					type : "get",
					success : function(data){
						console.log("전송 성공")
						$('#reasonArea').show();
						$('#targetUser').val("");
						$('#targetUser').val(data.article_title);
						console.log(data.article_title);
						$('#reasonTextArea').val("");
						$('#reasonTextArea').val(data.article_contents);
						$('.leftWrapArea').css('height',1300);
						var offset = $('#reasonArea').offset();
						$('html, body').animate({scrollTop : offset.top}, 'slow');
					}, error : function(status, msg){
						console.log("전송 실패")
					}
				})
			})
			
			$('#recentlyMemberListTable td').click(function(){
				var num = $(this).parent().children("input[type=hidden]").val();
				console.log(num);
				$.ajax({
					url:"selectPenaltyOne.me",
					data : {
						selectNum : num
					},
					type : "get",
					success : function(data){
						console.log("전송 성공")
						$('#reasonArea').show();
						$('#targetUser').val("");
						$('#targetUser').val(data.article_title);
						console.log(data.article_title);
						$('#reasonTextArea').val("");
						$('#reasonTextArea').val(data.article_contents);
						$('.leftWrapArea').css('height',1300);
						var offset = $('#reasonArea').offset();
						$('html, body').animate({scrollTop : offset.top}, 'slow');
					}, error : function(status, msg){
						console.log("전송 실패")
					}
				})
			})
		})
	</script>
	

	<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectPenaltyList.me?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectPenaltyList.me?currentPage=<%=currentPage - 1%>'"><</button>
				<%
					}
				%>

				<%
					for (int p = startPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>

				<button class="btn btn-default" disabled><%=p%></button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectPenaltyList.me?currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (currentPage >= maxPage) {
				%>
				<button class="btn btn-default" disabled>></button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectPenaltyList.mee?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectPenaltyList.me?currentPage=<%=maxPage%>'">>></button>
			</div>
	</div>
		<div id="reasonArea" style="display:none; width:100%; height:200px;">
			<hr>
			<h3>탈퇴/제대 대상</h3>
			<input type="text" class="form-control" id="targetUser" readonly/>
			<br>
			<p>세부 사유</p>
			<textarea class="form-control" id="reasonTextArea" rows="10" readonly></textarea>	
		</div>
	</div>
</body>
</html>













