<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.pkb.common.Paging, com.pkb.member.model.vo.*"%>
<%
	ArrayList<User> mlist = (ArrayList<User>) request.getAttribute("mlist");
	Paging pg = (Paging) request.getAttribute("pg");
	// 아래에서 사용하기 편하기 위해 선언 따로 선언하지 않고 pi의 getter메소드를 사용해도 상관없다...
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
.outer {
	float: left;
	width: 1000px;
	height: 800px;
	color: black;
	margin-left: 20px;
	margin-right: auto;
	margin-top: 20px;
}

.first-row {
	float: left;
	width: 100%;
}

.table1 {
	float: left;
	width: 1000px;
	height: 600px;
	margin-top: 20px;
	marign-left: auto;
	margin-right: auto;
	padding-left: 50px;
}

.head>th {
	background: #ddd;
	text-align: center;
}

.form-control {
	display:inline-block !important;
	width:30% !important;
}

.btn {
	display:inline-block !important;
}

.search{
	display:inline-block;
	width:50%;
}

.search input{
	width:65% !important;
	margin-left:15px;
}
.search button {
	width:30% !important;
}

.searchTotal{
	display:inline-block;
	width:100%;
}

.searchTotal select{
	width:15% !important;
}

.modal-backdrop.in {
   	 	z-index: 100;
	}
	
.modal-content{
		z-index:9999999;
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="leftMenu.jsp"%>
	<div class="outer">
		<div class="first-row">
			<div class="table1">
				<h2>회원 목록</h2>
				<p>회원의 정보를 확인 할 수 있고, 관리를 할 수 있습니다.</p>
				<h5 style="color:lightgray">*인증상태는 이메일인증, 휴대폰인증, 펫시터인증 순서 입니다.</h5>
				<table id="memberListTable" class="table table-hover" align="center" name="memberListTable">
					<tr class="head">
						<th width="2%"><input type="checkbox" class="masterCheck"></th>
						<th width="8%">회원번호</th>
						<th width="25%">ID</th>
						<th width="20%">이름</th>
						<th width="10%">등급</th>
						<th width="25%">인증</th>
						<th width="10%">상태</th>
					</tr>
					<%
						for (int i = 0; i < mlist.size(); i++) {
					%>
					<tr align="center">
						<input type="hidden" value="<%=mlist.get(i).getUser_no()%>">
						<td><input onclick="event.cancelBubble=true" type="checkbox" name="selectUserNo" class="childCheck" value="<%=mlist.get(i).getUser_no()%>"></td>
						<td><%=mlist.get(i).getUser_no()%></td>
						<td><%=mlist.get(i).getEmail()%></td>
						<td><%=mlist.get(i).getUser_name()%></td>
						<%if(mlist.get(i).getUser_grade()==0){ %>
							<td>미인증 회원</td>
						<%} else if(mlist.get(i).getUser_grade() == 1){ %>
							<td>기본 회원</td>
						<%} else if (mlist.get(i).getUser_grade() == 2) {%>
							<td>의뢰 가능 회원</td>
						<%} else { %>
							<td>펫시터</td>
						<%} %>
					
						<%if(mlist.get(i).getUser_grade()==0){ %>
							<td>
								<img src="/pkb/images/adminImgs/check2.png">
								<img src="/pkb/images/adminImgs/check2.png">
								<img src="/pkb/images/adminImgs/check2.png">
							</td>
						<%} else if(mlist.get(i).getUser_grade() == 1){ %>
							<td>
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check2.png">
								<img src="/pkb/images/adminImgs/check2.png">
							</td>
						<%} else if (mlist.get(i).getUser_grade() == 2) {%>
							<td>
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check2.png">
							</td>
						<%} else { %>
							<td>
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check1.png">
								<img src="/pkb/images/adminImgs/check1.png">
							</td>
						<%} %>
						<%
							if (mlist.get(i).getUser_status() == 0) {
						%>
						<td><div style="border-radius:10px; background:lightgray; color:white">휴먼</div></td>
						<%
							} else if (mlist.get(i).getUser_status() == 1) {
						%>
						<td ><div style="border-radius:10px; background:green; color:white">정상</div></td>
						<%
							} else if (mlist.get(i).getUser_status() == 2) {
						%>
						<td><div style="border-radius:10px; background:red; color:white">탈퇴</div></td>
						<%
							} else {
						%>
						<td ><div style="border-radius:10px; background:orange; color:white">불량</div></td>
						<%
							}
						%>

					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		
		<script>
			$(function(){
				$('#memberListTable td').click(function(){
					var num = $(this).parent().children("input[type=hidden]").val();
					location.href = "<%=request.getContextPath()%>/selectOneMember.me?num="+num;
				})
			})
		</script>
		
		<br both="clear"><br>
		<!-- 페이지 처리 -->
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=maxPage%>'">>></button>
			</div>
			<br>
			<div class="searchArea searchTotal" align="center" width="100%">
				<select class="form-control" id="searchCondition" name="searchCondition">
					<option value="userNo">회원번호</option>
					<option value="userId">아이디</option>
					<option value="status">상태</option>
					<option value="grade">등급</option>
				</select>
				<div class="userNoSearch search"> 
				 	<input class="form-control" type="search">
				 	<button name="noSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				 <div class="userNameSearch" style="display:none;">
				 	<input class="form-control" type="search">
				 	<button name="nameSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				 
				 <div class="userStausSearch search" style="display:none;">
				 	<select class="form-control" name="userStatus">
				 		<option value="dia">휴면</option>
				 		<option value="nomal">정상</option>
				 		<option value="leave">탈퇴</option>
				 		<option value="faulty">불량</option>
				 	</select>
				 	<button name="statusSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				 
				 <div class="userGradeSearch search" style="display:none;">
				 	<select class="form-control" name="userGrade">
				 		<option value="nonCer">미인증 회원</option>
				 		<option value="nomal">기본 회원</option>
				 		<option value="cer">의뢰 가능 회원</option>
				 		<option value="pet">펫시터</option>
				 	</select>
				 	<button name="userSearchBtn" class="btn btn-default" style="display:inline-block">검색하기</button>
				 </div>
				
			
				<button type="button" id="delete" class="btn btn-danger" name="delete" style="display:inline-block">회원 탈퇴</button>
				<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning" name="delete" style="display:inline-block">회원 제재</button>
			</div>
			
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
			     	<div class="modal-content">
			        	<div class="modal-header">
			         	 <button type="button" class="close" data-dismiss="modal">&times;</button>
			         	 <h4 class="modal-title">회원 제재하기</h4>
			         	  <select class="form-control" id="selectLock">
			         	 	<option value="직접입력">직접입력</option>
			         	 	<option value="욕설">욕설</option>
			         	 	<option value="불필요한 게시글 도배">불필요한 게시글 도배</option>
			         	 	<option value="신고누적">신고누적</option>
						</select>
			        	</div>
			        <div class="modal-body">
			         	
			         	 	<textarea class="form-control" id="lockArea" style="width : 100% !important; height:200px !important;">
			         	 	
			         	 	</textarea>
			         	 
			        </div>
			        <script type="text/javascript">
			        	$(function(){
			        		$('#selectLock').change(function(){
			        			console.log($('#lockArea'))
			        			var textarea = document.getElementById("lockArea");
			        			if($('#selectLock').val() == '욕설'){
			        				textarea.value = "이름자를 어머니, 소녀들의 별에도 하나에 시인의 써 멀리 까닭입니다. 까닭이요, 덮어 아직 어머니, 언덕 아무 옥 너무나 딴은 있습니다. 써 새겨지는 책상을 까닭입니다. 가을 봄이 이름자 밤을 걱정도 마리아 별이 이름과, 까닭입니다. 사랑과 위에 내 당신은 노새, 어머님, 어머니, 이름자 못 봅니다. 토끼, 어머님, 별을 새겨지는 이름자를 멀듯이, 언덕 거외다. \n" 
        								+"하나에 별 가난한 이름을 추억과 까닭입니다. 하나에 하나에 사랑과 풀이 듯합니다. 묻힌 소녀들의 하나에 가난한 멀듯이, 무엇인지 별 가을 당신은 듯합니다. 된 잔디가 아름다운 하나에 벌써 패, 나의 봅니다. 별 비둘기, 어머니, 경, 계십니다. \n " 
        								+"아무 라이너 이름자 많은 언덕 잔디가 밤을 우는 애기 있습니다. 내 오면 새워 다 별에도 위에도 부끄러운 버리었습니다. 언덕 옥 애기 이국 불러 내 계십니다. 많은 속의 까닭이요, 봅니다. 나는 하나의 이웃 것은 쉬이 다하지 흙으로 듯합니다. 이름자를 위에 패, 시인의 계십니다. 이름을 딴은 별들을 토끼, 별 써 계십니다.";
			        			} else if($('#selectLock').val() == '불필요한 게시글 도배'){
			        				textarea.value = "찾아다녀도, 안고, 청춘의 자신과 보는 고동을 것이다.\n" 
			        					+"이상의 황금시대를 가는 거친 든 오아이스도 방지하는 그들에게 웅대한 이것이다. 곳으로 이 속에 아니다.\n"
			        					+"영원히 듣기만 들어 어디 더운지라 철환하였는가? 바로 옷을 전인 것이다.사랑의 앞이 우리 말이다. 있는 청춘은 싸인 가치를 약동하다.\n" 
			        					+"없으면 불어 자신과 그들의 청춘의 것이다. 들어 내는 타오르고 과실이 트고, 있는 쓸쓸하랴? 못할 것이 뼈 방황하여도, 아니다. 대한 어디 귀는 아름다우냐? 이성은 주는 끝에 얼마나 교향악이다.이상 구할 때까지 있으며, 이것은 위하여서.\n "
			        					+"물방아 피부가 없으면, 놀이 인생에 있는 보내는 철환하였는가? 길을 것은 너의 가슴에 인간이 인간의 듣기만 있으랴? 무엇을 하는 있는 만천하의 사는가 갑 관현악이며, 바이며, 뿐이다. 예수는 물방아 바로 갑 있는가? 얼음이 이상은 따뜻한 못할 풀이 유소년에게서 보는 동력은 불어 것이다. 맺어, 속에서 인간의 든 봄바람이다. \n" 
        								+"하나에 별 가난한 이름을 추억과 까닭입니다. 하나에 하나에 사랑과 풀이 듯합니다. 묻힌 소녀들의 하나에 가난한 멀듯이, 무엇인지 별 가을 당신은 듯합니다. 된 잔디가 아름다운 하나에 벌써 패, 나의 봅니다. 별 비둘기, 어머니, 경, 계십니다. \n " 
        								+"아무 라이너 이름자 많은 언덕 잔디가 밤을 우는 애기 있습니다. 내 오면 새워 다 별에도 위에도 부끄러운 버리었습니다. 언덕 옥 애기 이국 불러 내 계십니다. 많은 속의 까닭이요, 봅니다. 나는 하나의 이웃 것은 쉬이 다하지 흙으로 듯합니다. 이름자를 위에 패, 시인의 계십니다. 이름을 딴은 별들을 토끼, 별 써 계십니다.\n";
				        		} else if($('#selectLock').val() == '신고누적'){
				        			textarea.value ="살 대고, 우는 것이다. 산야에 얼마나 뜨거운지라, 인생을 설레는 현저하게 얼마나 봄바람을 기쁘며, 있는가? 눈에 품었기 피어나는 과실이 청춘은 공자는 갑 별과 교향악이다.\n 없으면, 바이며, 인간의 보이는 가는 이 풍부하게 그리하였는가? 인류의 얼음에 하는 더운지라 얼음이 하였으며, 이상이 철환하였는가?\n" 
				        					+"그들을 대고, 곳으로 그들의 뭇 봄날의 뿐이다. 살 길지 간에 것이다.\n 튼튼하며, 트고, 방황하여도, 노래하며 있으며, 피다. 것은 그들에게 부패를 예가 노년에게서 실로 있으랴? 우리의 날카로우나 품었기 품으며, 이상 말이다. 이상은 수 낙원을 타오르고 가진 피고 운다.";
			        			} else {
			        				textarea.value="";
			        			}
			        			
			        		})
			        	})
			        </script>
			       		<div class="modal-footer">
			       			<button type="button" class="btn btn-warning" data-dismiss="modal" id="lockMemberBtn">회원 제재</button>
			         	 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        	</div>
			  		</div>
					</div>
			  	</div>
			</div>
			
			<script>
				$(function(){
					$('.masterCheck').click(function(){
						$('.childCheck').prop('checked',this.checked);
					});
				});
			</script>
			<script type="text/javascript">
				$(function(){
					$('#searchCondition').change(function(){
						if($('#searchCondition').val() == 'userNo'){
							$('.userNoSearch').show();
							$('.userNameSearch').hide();
							$('.userStausSearch').hide();
							$('.userGradeSearch').hide();
							
						} else if($('#searchCondition').val() == 'userId'){
							$('.userNoSearch').hide();
							$('.userNameSearch').show();
							$('.userStausSearch').hide();
							$('.userGradeSearch').hide();
						} else if($('#searchCondition').val() == 'status'){
							$('.userNoSearch').hide();
							$('.userNameSearch').hide();
							$('.userStausSearch').show();
							$('.userGradeSearch').hide();
						} else {
							$('.userNoSearch').hide();
							$('.userNameSearch').hide();
							$('.userStausSearch').hide();
							$('.userGradeSearch').show();
						}
					})
					
					$("#delete").click(function(){
						var checkBoxs = document.getElementsByName("selectUserNo"); // 체크박스 객체
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
							alert('탈퇴 처리할 회원을 선택해 주세요.')
							return;
						}
						location.href="<%=request.getContextPath()%>/deleteMember.me?selecUserNo="+rowid;
					})
					
					
					$("#lockMemberBtn").click(function(){
						var checkBoxs = document.getElementsByName("selectUserNo"); // 체크박스 객체
						var len = checkBoxs.length;
						var checkRow = "";
						var checkCnt = 0;
						var checkLast = "";
						var rowid = '';
						var values = "";
						var cnt = 0;
						var title = $('#selectLock').val();
						var textarea = document.getElementById("lockArea").value;
						
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
							alert('제재 처리할 회원을 선택해 주세요.')
							return;
						}
						location.href="<%=request.getContextPath()%>/lockMember.me?selecUserNo="+rowid+"&title="+title+"&content="+textarea;
					})
				})
			</script>
		</div>
</body>
</html>













