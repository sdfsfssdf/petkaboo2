<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.pkb.member.model.vo.*,com.pkb.common.Paging"%>

<%
	ArrayList<ApplyHistory> alist = (ArrayList<ApplyHistory>) request.getAttribute("alist");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.outer {
	float: left;
	width: 1000px;
	height: 600px;
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
				<h3>펫시터 자격신청 목록</h3>
				<p>펫시터 자격신청 내역과, 펫시터 권한 설정/거절이 가능합니다.</p>
				<hr>
				<table id="memberList" class="table table-hover">
					<tr class="head">
						<th width="100px">신청번호</th>
						<th width="300px">유저번호</th>
						<th width="100px">아이디</th>
						<th width="200px">신청일</th>
						<th width="300px">상태</th>
					</tr>
					
					<%for(int i = 0; i < alist.size(); i ++ ){ %>
						<tr align="center">
							<td><%=alist.get(i).getApply_record_no() %></td>
							<td><%=alist.get(i).getUser_no() %></td>
							<td><%=alist.get(i).getEmail() %></td>
							<td><%=alist.get(i).getApply_rec_date() %></td>
							<td style="height:80px;">
								<%if (alist.get(i).getApply_rec_status().equals("A")){ %>
									<div style="width:110px;   background:green; color:white">승인</div>
								<%} else if(alist.get(i).getApply_rec_status().equals("W")) { %>
									<div style="width:110px; background:gray; color:white ">대기</div>
										<form action="approvalRequest.me" method="post">
									<div style="margin-top:5px">
										<input type="hidden" value="<%=alist.get(i).getApply_record_no() %>" name="record_no">
										<button class="btn btn-primary" type="submit">승인</button>
				
										<button input type="button" data-toggle="modal" data-target="#myModal<%=i%>"  class="btn btn-danger">거절</button></div>
										</form>
									<div class="modal fade" id="myModal<%=i%>" role="dialog">
				<form method="post" action="refusalPetsitter.me">
				<input type="hidden" value="<%=alist.get(i).getApply_record_no() %>" name="no">
				<div class="modal-dialog modal-lg">
			     	<div class="modal-content">
			        	<div class="modal-header">
			         	 <button type="button" class="close" data-dismiss="modal">&times;</button>
			         	 <h4 class="modal-title">펫시터 요청 거절하기</h4>
			         	  <select class="form-control" id="selectDelete">
			         	 	<option value="직접입력">직접입력</option>
			         	 	<option value="부적합한 대상">부적합한 대상</option>
			         	 	<option value="입력 내용 부족">입력 내용 부족</option>
			         	 	<option value="불량 회원">불량 회원</option>
						</select>
			        	</div>
			        <div class="modal-body">
			         	
			         	 	<textarea class="form-control" name="content" id="deleteArea" style="width : 100% !important; height:200px !important;">
			         	 	
			         	 	</textarea>
			         	 
			        </div>
			        <script type="text/javascript">
			        	$(function(){
			        		$('#selectDelete').change(function(){
			        			console.log($('#deleteArea'))
			        			var textarea = document.getElementById("deleteArea");
			        			if($('#selectDelete').val() == '부적합한 대상'){
			        				textarea.value = "이름자를 어머니, 소녀들의 별에도 하나에 시인의 써 멀리 까닭입니다. 까닭이요, 덮어 아직 어머니, 언덕 아무 옥 너무나 딴은 있습니다. 써 새겨지는 책상을 까닭입니다. 가을 봄이 이름자 밤을 걱정도 마리아 별이 이름과, 까닭입니다. 사랑과 위에 내 당신은 노새, 어머님, 어머니, 이름자 못 봅니다. 토끼, 어머님, 별을 새겨지는 이름자를 멀듯이, 언덕 거외다. \n" 
        								+"하나에 별 가난한 이름을 추억과 까닭입니다. 하나에 하나에 사랑과 풀이 듯합니다. 묻힌 소녀들의 하나에 가난한 멀듯이, 무엇인지 별 가을 당신은 듯합니다. 된 잔디가 아름다운 하나에 벌써 패, 나의 봅니다. 별 비둘기, 어머니, 경, 계십니다. \n " 
        								
			        			} else if($('#selectDelete').val() == '입력 내용 부족'){
			        				textarea.value = "찾아다녀도, 안고, 청춘의 자신과 보는 고동을 것이다.\n" 
			        					+"이상의 황금시대를 가는 거친 든 오아이스도 방지하는 그들에게 웅대한 이것이다. 곳으로 이 속에 아니다.\n"
			        					+"영원히 듣기만 들어 어디 더운지라 철환하였는가? 바로 옷을 전인 것이다.사랑의 앞이 우리 말이다. 있는 청춘은 싸인 가치를 약동하다.\n" 
			        					+"없으면 불어 자신과 그들의 청춘의 것이다. 들어 내는 타오르고 과실이 트고, 있는 쓸쓸하랴? 못할 것이 뼈 방황하여도, 아니다. 대한 어디 귀는 아름다우냐? 이성은 주는 끝에 얼마나 교향악이다.이상 구할 때까지 있으며, 이것은 위하여서.\n "
			        				
				        		} else if($('#selectDelete').val() == '불량 회원'){
				        			textarea.value ="살 대고, 우는 것이다. 산야에 얼마나 뜨거운지라, 인생을 설레는 현저하게 얼마나 봄바람을 기쁘며, 있는가? 눈에 품었기 피어나는 과실이 청춘은 공자는 갑 별과 교향악이다.\n 없으면, 바이며, 인간의 보이는 가는 이 풍부하게 그리하였는가? 인류의 얼음에 하는 더운지라 얼음이 하였으며, 이상이 철환하였는가?\n" 
				        					+"그들을 대고, 곳으로 그들의 뭇 봄날의 뿐이다. 살 길지 간에 것이다.\n 튼튼하며, 트고, 방황하여도, 노래하며 있으며, 피다. 것은 그들에게 부패를 예가 노년에게서 실로 있으랴? 우리의 날카로우나 품었기 품으며, 이상 말이다. 이상은 수 낙원을 타오르고 가진 피고 운다.";
			        			} else {
			        				textarea.value="";
			        			}
			        			
			        		})
			        	})
			        </script>
			       		<div class="modal-footer">
			       			<button type="submit" class="btn btn-danger" >거절하기</button>
			         	 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        	</div>
			  		</div>
					</div>
			  		</form>
			  </div>
										
								<%}  else {%>
									<div style="width:110px;   background:red; color:white">거절
									
									</div>
									<button style="margin-top:5px" class="btn btn-default showReason" onclick="showReason(<%=alist.get(i).getEmail()%>,<%=alist.get(i).getApply_refuse()%>);">사유 보기</button>
									<input type="hidden" value="<%=alist.get(i).getApply_record_no()%>">
								<%} %>
							</td>
						</tr>
					<%} %>
				</table>
			</div>
			<script>
			
				function approvalBtn(num){
					console.log(num);
				};
				
				function showReason(email, content){
					console.log(email);
					console.log(content);
				};
				
				$(function(){
					$('.showReason').click(function(){
						var num = $(this).parent().children("input[type=hidden]").val();
						console.log(num);
						 $.ajax({
							url:"selectOneApplyHistory.me",
							data : {
								selectNum : num
							},
							type : "get",
							success : function(data){
								console.log("전송 성공")
								$('#reasonArea').show();
								$('#targetUser').val("");
								$('#targetUser').val(data.email);

								$('#reasonTextArea').val("");
								$('#reasonTextArea').val(data.apply_refuse);
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
					onclick="location.href='<%=request.getContextPath()%>/petsitterRequest.me?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/petsitterRequest.me?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/petsitterRequest/me?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/petsitterRequest.me?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/petsitterRequest.me?currentPage=<%=maxPage%>'">>></button>
			</div>
		</div>
		<hr>
		<div id="reasonArea" style="display:none; width:100%; height:200px;">
			<hr>
			<h3>펫시터 신청 거절 대상</h3>
			<input type="text" class="form-control" id="targetUser" readonly/>
			<br>
			<p>세부 사유</p>
			<textarea class="form-control" id="reasonTextArea" rows="10" readonly></textarea>	
		</div>
	<%@include file="../../common/footer.jsp" %>
	</div>
</body>
</html>
