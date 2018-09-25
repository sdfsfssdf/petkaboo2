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
							<img data-toggle="modal" data-target="#myModal" id="titleImg" src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=img.getFile_name() %>" style="width:300px;height:300px; border-radius:150px">
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
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">대표 이미지</h4>
        </div>
        <div class="modal-body">
          <img data-toggle="modal" data-target="#myModal"  src="<%=request.getContextPath()%>/images/profileImagesUpload/<%=img.getFile_name() %>" style="width:200px;height:200px; border-radius:150px">
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
						<td colspan="2" rowspan="5" style="width:20%">
							<img id="petImage" src="<%=request.getContextPath()%>/images/profileImagesUpload/tempPetImage.jpg %>" style="width:100%;height:100%; border-radius:100px">
						</td>
						<td colspan="2">반려동물 번호</td>
						<td colspan="2"><%=plist.get(i).getPetNo() %></td>
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