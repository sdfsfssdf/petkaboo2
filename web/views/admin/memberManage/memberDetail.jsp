<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.pkb.member.model.vo.*"%>
    
<%
	HashMap<String,Object> loginInfo = (HashMap<String,Object>)request.getAttribute("userInfo");
	User u = (User)loginInfo.get("user");
	LoginHistory lh = (LoginHistory)loginInfo.get("loginHistory");
	ImgFile img = (ImgFile)loginInfo.get("profile");
	ArrayList<ImgFile> proHistory = (ArrayList<ImgFile>)loginInfo.get("profileHistory");
	CyberMoney money = (CyberMoney)loginInfo.get("money");
	ArrayList<Pet> plist = (ArrayList<Pet>)loginInfo.get("pet");
%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

.outer2 {
	float: left;
	width: 1000px;
	height: 300px;
	color: black;
	margin-left: 20px;
	margin-right: auto;
	margin-top: 20px;
}

.first-row {
	float: left;
	width: 100%;
}

.leftWrapArea{

      height:1500px !important;      

   }

.table1 {
	float: left;
	width: 1000px;
	height: 500px;
	margin-top: 20px;
	marign-left: auto;
	margin-right: auto;
	padding-left: 50px;
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
	<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
		<div class="">
			<hr>
			<div class="table1">
			<h2>회원정보 상세</h2>
			<p>회원의 상세정보를 확인할 수 있고, 수정이 가능합니다.</p>
			<table class="table">
				<tr align="center">
					<td rowspan="5" colspan="2" align="center"><div id="imageArea" style="height:90%;width:100%">
						<% if (img.getFile_name() == null || img.getFile_name().equals("")) {%>
							<img src="<%=request.getContextPath()%>/images/profileImagesUpload/profileBasicImage.png" style="width:300px;height:300px; border-radius:150px">
						<%} else { %>
							<img data-toggle="modal" data-target="#titleImageModal" id="titleImg" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=img.getFile_name() %>" style="width:300px;height:300px; border-radius:150px">
						<%} %>
						<input type="hidden" value="<%=img.getFile_no()%>"></div>	
	
	<div class='row' >
    <div class='col-md-8' style="margin-left:80px; margin-top:20px ">
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
          
          <%if(proHistory.size() <4){ %>
            <div class="item  active">
            	<div class="row">
          		<%for(int i = 0; i < proHistory.size(); i++){ %>
          			 <div class="col-md-4" >
          			 <input type="hidden" value="<%=proHistory.get(i).getFile_no() %>">
                	<a class="thumbnail" ><img class="subImage<%=i%>" data-toggle="modal" data-target="#myModal<%=i %>" alt="" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=proHistory.get(i).getFile_name() %>"></a>
              </div>
       
          		<%} %>
            	</div>
          	</div>
          <%} else {%>
          	<div class="item  active">
            	<div class="row">
          		<%for(int i = 0; i < 3; i++){ %>
          			 <div class="col-md-4" >
          			 <input type="hidden" value="<%=proHistory.get(i).getFile_no() %>">
                	<a class="thumbnail" ><img class="subImage<%=i%>" data-toggle="modal" data-target="#myModal<%=i %>" alt="" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=proHistory.get(i).getFile_name() %>"></a>
              </div>
              
          		<%} %>
            	</div>
          	</div>
          	
          	<%for(int i=3; i < proHistory.size(); i ++) {
          		if(i % 3 == 0) {%>
          			<div class="item">
           	 		<div class="row">
          		<%} %>
          			 <div class="col-md-4" >
          			 <input type="hidden" value="<%=proHistory.get(i).getFile_no() %>">
                	<a class="thumbnail"><img class="subImage<%=i%>" data-toggle="modal" data-target="#myModal<%=i %>" alt="" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=proHistory.get(i).getFile_name() %>"></a>
              </div>
          		<% if(i % 3 == 0) {%>
          			</div>
          			</div>
          		<%} %>

          	<%} %>
          <%} %>
      <!--   <script>
        	$(function(){
        		$('#titleImg').click(function(){
        			
        			console.log($(this).parent().children('input[type=hidden]').val());
        			console.log($(this).prop('src'));
		
  			
        		})
        		
        	})
        </script> -->
        <!-- Modal -->
  <div class="modal fade" id="titleImageModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">대표 이미지</h4>
        </div>
        <div class="modal-body">
          <img src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=img.getFile_name() %>" style="width:200px;height:200px; border-radius:150px">
        </div>
        <div class="modal-footer">
        	<button type="button" id="titleImgDeleteBtn" class="btn btn-danger" data-dismiss="modal">삭제하기</button>
          	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
  <%for(int i = 0 ; i < proHistory.size(); i ++) { %>
  <div class="modal fade" id="myModal<%=i%>" role="dialog">
			    <div class="modal-dialog modal-sm">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">프로필 History</h4>
			        </div>
			        <div class="modal-body">
			          <img data-toggle="modal" data-target="#myModal"  src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=proHistory.get(i).getFile_name() %>" style="width:200px;height:200px; border-radius:150px">
			        </div>
			        <div class="modal-footer">
			        	<input type="hidden" value="<%=i%>">
			        	<button type="button" class="btn btn-success updateTitleProfileBtn" data-dismiss="modal">대표 이미지로</button>
			        	<button type="button" class="btn btn-danger subImageDelete" data-dismiss="modal">삭제</button>
			          	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        </div>
			      </div>
			    </div>
			  </div>
			  
			  
			 
  <%} %>
  <script>
  	$(function(){
  		$('#titleImgDeleteBtn').click(function(){
  			var src = $('#titleImg').prop('src');
  			var fileNo = $('#titleImg').parent().children('input[type=hidden]').val();
			var userNo = $('#userNo').val();
  			location.href="<%=request.getContextPath()%>/deleteTitleProfile.me?src="+src+"&fileNo="+fileNo+"&userNo="+userNo;
  		})
  		
  		$('.subImageDelete').click(function(){
  			var selectNum = $(this).parent().children('input[type=hidden]').val();
  			var subImage = '.subImage'+selectNum;
  			var fileNo = $(subImage).parent().parent().children('input[type=hidden]').val();
  			var userNo = $('#userNo').val();
  			location.href="<%=request.getContextPath()%>/deleteSubProfile.me?fileNo="+fileNo+"&userNo="+userNo;
  		})
  		
  		$('.updateTitleProfileBtn').click(function(){
  			var selectNum = $(this).parent().children('input[type=hidden]').val();
  			var subImage = '.subImage'+selectNum;
  			var fileNo = $(subImage).parent().parent().children('input[type=hidden]').val();
  			var userNo = $('#userNo').val();
  			location.href="<%=request.getContextPath()%>/updateTitleProfile.me?fileNo="+fileNo+"&userNo="+userNo;
  		})
  		
  
  	})
  </script>
        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
        <a data-slide="next" href="#media" class="right carousel-control">›</a>
      </div>                          
    </div>
  </div>
														
					</td>
					<input type="hidden" id="userNo" value="<%=u.getUser_no()%>">
					<td width="25%" height="50" style="padding-top: 13px">회원번호</td>
					<td width="25%"	><%=u.getUser_no()%></td>
				</tr>
				<tr>
					<td width="25%" height="50"style="padding-top: 13px">아이디(이메일)</td>
					<td width="25%" ><%=u.getEmail() %></td>
				</tr>
				<tr>
					<td width="25%" height="50"style="padding-top: 13px">이름</td>
					<td><%=u.getUser_name()%></td>
				</tr>
				<tr>
					<td width="25%" height="50"style="padding-top: 13px">회원가입일시</td>
					<td><%=u.getEnrollDate() %></td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13x">최근접속일시</td>
					<td><%=lh.getLoginDate() %></td>
				</tr>
				<tr>
				
					<td width="25%" height="50" style="padding-top: 13px">전화번호</td>
					<td><%=u.getPhone() %></td>
					<td style="padding-top: 13px">메일수신여부</td>
					<td><%=u.getEmail_chk() %></td>
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">SMS수신여부</td>
					<td><%=u.getSms_chk() %></td>
					<td style="padding-top: 13px">인증여부</td>
					<%if(u.getUser_grade()==0){ %>
						<td>
							<img src="/pkb/images/adminImgs/check2.png">
							<img src="/pkb/images/adminImgs/check2.png">
							<img src="/pkb/images/adminImgs/check2.png">
						</td>
					<%} else if(u.getUser_grade() == 1){ %>
						<td>
							<img src="/pkb/images/adminImgs/check1.png">
							<img src="/pkb/images/adminImgs/check2.png">
							<img src="/pkb/images/adminImgs/check2.png">
						</td>
					<%} else if (u.getUser_grade() == 2) {%>
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
				</tr>
				<tr>
					<td width="25%" height="50" style="padding-top: 13px">사이버머니</td>
					<td><%=money.getMoney() %>P</td>
					<td height="50" style="padding-top: 13px">등급</td>
					<%if(u.getUser_grade()==0){ %>
						<td>미인증 회원</td>
					<%} else if(u.getUser_grade() == 1){ %>
						<td>기본 회원</td>
					<%} else if (u.getUser_grade() == 2) {%>
						<td>의뢰 가능 회원</td>
					<%} else { %>
						<td>펫시터</td>
					<%} %>
				</tr>
			</table>
			<div align="center">
				<button type="button" data-toggle="modal" data-target="#myModal2" class="btn btn-danger" style="display:inline-block">회원 탈퇴</button>
				<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning" style="display:inline-block">회원 제재</button>
			</div>
			</div>
			
			
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog modal-lg">
			     	<div class="modal-content">
			        	<div class="modal-header">
			         	 <button type="button" class="close" data-dismiss="modal">&times;</button>
			         	 <h4 class="modal-title">회원 탈퇴하기</h4>
			         	  <select class="form-control" id="selectDelete">
			         	 	<option value="직접입력">직접입력</option>
			         	 	<option value="타사이트 이용">타사이트 이용</option>
			         	 	<option value="서비스 이용 중단">서비스 이용 중단</option>
			         	 	<option value="서비스 불만족">서비스 불만족</option>
						</select>
			        	</div>
			        <div class="modal-body">
			         	
			         	 	<textarea class="form-control" id="deleteArea" style="width : 100% !important; height:200px !important;">
			         	 	
			         	 	</textarea>
			         	 
			        </div>
			        <script type="text/javascript">
			        	$(function(){
			        		$('#selectDelete').change(function(){
			        			console.log($('#deleteArea'))
			        			var textarea = document.getElementById("deleteArea");
			        			if($('#selectDelete').val() == '타사이트 이용'){
			        				textarea.value = "이름자를 어머니, 소녀들의 별에도 하나에 시인의 써 멀리 까닭입니다. 까닭이요, 덮어 아직 어머니, 언덕 아무 옥 너무나 딴은 있습니다. 써 새겨지는 책상을 까닭입니다. 가을 봄이 이름자 밤을 걱정도 마리아 별이 이름과, 까닭입니다. 사랑과 위에 내 당신은 노새, 어머님, 어머니, 이름자 못 봅니다. 토끼, 어머님, 별을 새겨지는 이름자를 멀듯이, 언덕 거외다. \n" 
        								+"하나에 별 가난한 이름을 추억과 까닭입니다. 하나에 하나에 사랑과 풀이 듯합니다. 묻힌 소녀들의 하나에 가난한 멀듯이, 무엇인지 별 가을 당신은 듯합니다. 된 잔디가 아름다운 하나에 벌써 패, 나의 봅니다. 별 비둘기, 어머니, 경, 계십니다. \n " 
        								+"아무 라이너 이름자 많은 언덕 잔디가 밤을 우는 애기 있습니다. 내 오면 새워 다 별에도 위에도 부끄러운 버리었습니다. 언덕 옥 애기 이국 불러 내 계십니다. 많은 속의 까닭이요, 봅니다. 나는 하나의 이웃 것은 쉬이 다하지 흙으로 듯합니다. 이름자를 위에 패, 시인의 계십니다. 이름을 딴은 별들을 토끼, 별 써 계십니다.";
			        			} else if($('#selectDelete').val() == '서비스 이용 중단'){
			        				textarea.value = "찾아다녀도, 안고, 청춘의 자신과 보는 고동을 것이다.\n" 
			        					+"이상의 황금시대를 가는 거친 든 오아이스도 방지하는 그들에게 웅대한 이것이다. 곳으로 이 속에 아니다.\n"
			        					+"영원히 듣기만 들어 어디 더운지라 철환하였는가? 바로 옷을 전인 것이다.사랑의 앞이 우리 말이다. 있는 청춘은 싸인 가치를 약동하다.\n" 
			        					+"없으면 불어 자신과 그들의 청춘의 것이다. 들어 내는 타오르고 과실이 트고, 있는 쓸쓸하랴? 못할 것이 뼈 방황하여도, 아니다. 대한 어디 귀는 아름다우냐? 이성은 주는 끝에 얼마나 교향악이다.이상 구할 때까지 있으며, 이것은 위하여서.\n "
			        					+"물방아 피부가 없으면, 놀이 인생에 있는 보내는 철환하였는가? 길을 것은 너의 가슴에 인간이 인간의 듣기만 있으랴? 무엇을 하는 있는 만천하의 사는가 갑 관현악이며, 바이며, 뿐이다. 예수는 물방아 바로 갑 있는가? 얼음이 이상은 따뜻한 못할 풀이 유소년에게서 보는 동력은 불어 것이다. 맺어, 속에서 인간의 든 봄바람이다. \n" 
        								+"하나에 별 가난한 이름을 추억과 까닭입니다. 하나에 하나에 사랑과 풀이 듯합니다. 묻힌 소녀들의 하나에 가난한 멀듯이, 무엇인지 별 가을 당신은 듯합니다. 된 잔디가 아름다운 하나에 벌써 패, 나의 봅니다. 별 비둘기, 어머니, 경, 계십니다. \n " 
        								+"아무 라이너 이름자 많은 언덕 잔디가 밤을 우는 애기 있습니다. 내 오면 새워 다 별에도 위에도 부끄러운 버리었습니다. 언덕 옥 애기 이국 불러 내 계십니다. 많은 속의 까닭이요, 봅니다. 나는 하나의 이웃 것은 쉬이 다하지 흙으로 듯합니다. 이름자를 위에 패, 시인의 계십니다. 이름을 딴은 별들을 토끼, 별 써 계십니다.\n";
				        		} else if($('#selectDelete').val() == '서비스 불만족'){
				        			textarea.value ="살 대고, 우는 것이다. 산야에 얼마나 뜨거운지라, 인생을 설레는 현저하게 얼마나 봄바람을 기쁘며, 있는가? 눈에 품었기 피어나는 과실이 청춘은 공자는 갑 별과 교향악이다.\n 없으면, 바이며, 인간의 보이는 가는 이 풍부하게 그리하였는가? 인류의 얼음에 하는 더운지라 얼음이 하였으며, 이상이 철환하였는가?\n" 
				        					+"그들을 대고, 곳으로 그들의 뭇 봄날의 뿐이다. 살 길지 간에 것이다.\n 튼튼하며, 트고, 방황하여도, 노래하며 있으며, 피다. 것은 그들에게 부패를 예가 노년에게서 실로 있으랴? 우리의 날카로우나 품었기 품으며, 이상 말이다. 이상은 수 낙원을 타오르고 가진 피고 운다.";
			        			} else {
			        				textarea.value="";
			        			}
			        			
			        		})
			        	})
			        </script>
			       		<div class="modal-footer">
			       			<button type="button" class="btn btn-danger" data-dismiss="modal" id="delete" name="delete">회원 탈퇴</button>
			         	 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        	</div>
			  		</div>
					</div>
			  </div>
		
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
			     	<div class="modal-content">
			        	<div class="modal-header">
			         	 <button type="button" class="close" data-dismiss="modal">&times;</button>
			         	 <h4 class="modal-title">회원 제재하기</h4>
			         	  <select class="form-control" id="selectLock" style="display:inline-block; width:60%">
			         	 	<option value="직접입력">직접입력</option>
			         	 	<option value="욕설">욕설</option>
			         	 	<option value="불필요한 게시글 도배">불필요한 게시글 도배</option>
			         	 	<option value="신고누적">신고누적</option>
						</select>
						<label>제재 날짜 선택 : </label><input class="form-control" type="date" id="lockDate" style="display:inline-block;width:25%">
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
			
			
		</div>
	<div style="height:100px"></div>
	</div>
	<div class="outer2"> 
	
		<div class="table1">
			<h2>회원 반려동물</h2>
			<p>회원이 등록한 반려동물의 정보를 확인, 수정이 가능합니다.</p>
			<hr>
			<%if(plist == null) { %>
				<h3>등록한 반려동물이 없습니다.</p>
			<%} else { %>
			<%for(int i = 0 ; i < plist.size(); i ++ ) { %>
				<table class="table">
					<tr>
						<td colspan="2" rowspan="5" style="width:30%">
							<img id="petImage" src="<%=request.getContextPath()%>/images/profileImagesUpload/tempPetImage.jpg" style="width:100%;height:100%; border-radius:50px">
						</td>
						<td >반려동물 번호    </td>
						<td><%=plist.get(i).getPetNo() %></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>대분류</td>
						<td><%=plist.get(i).getPetCategoryMajorName() %></td>
						<td>소분류</td>
						<td><%=plist.get(i).getPetCategoryMinorName() %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=plist.get(i).getPetName() %></td>
						<td>생일</td>
						<td><%=plist.get(i).getPetBirth() %></td>
					</tr>
					<tr>
						<td>성별</td>
						<%if(plist.get(i).getPetGender().equals("M")){ %>
							<td>수컷</td>
						<%} else { %>
							<td>암컷</td>
						<%} %>
						<td>중성화 여부 <%=plist.get(i).getNeutralChk() %></td>
						<td>무게 <%=plist.get(i).getPetWeight() %></td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="form-control">
								<%=plist.get(i).getPetMeno() %>
							</textarea>
						</td>
					</tr>
				</table>
				
				<br><br>
				<%} %>
			<%} %>
		</div>
	</div>
</body>
</html>