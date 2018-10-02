<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.pkb.petsitterService.model.vo.*"%>
<% ArrayList<PetsitterService> list = (ArrayList<PetsitterService>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터찾기메인</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#header {
	float: left;
	width: 100%;
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
	height: 250px;
	_border: 1px solid blue;
}

#field-style {
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	height: 30%;
	background-color: rgb(207, 183, 175);
	display: block;
	align: center;
}

.page-label {
	align: center;
	font-size:
}

.input-style {
	width: 55%;
	height: 44px;
}

#PSlist {
	width: 200px;
	height: 90px;
}

.petsitter-list {
	margin-left: auto;
	margin-right: auto;
}

.PSList {
	width: 80%;
	height: 50%;
	margin-left: auto;
	margin-right: auto;
}

td {
	/* border:1px solid black; */
	padding-left: 1px;
	padding-right: 1px;
	margin-top: 1px;
	margin-bottom: 1px;
}

.PSphoto {
	width: 127px;
	height: 127px;
}

.map-style {
	height: 600px;
	width: 500px;
	padding-left: 100px;
}

td ul li {
	display: list-item;
}

nav ul {
	position: :relative;
	margin: 0px;
	padding: 0px;
}

nav ul li {
	display: inline;
	margin-bottom: 1%;
}

nav {
	margin-top: 3%;
	margin-bottom: 3%;
}

#nav-icon {
	width: 1%;
	height: 1%;
}
.new-ps-body{
	width:55%;
	margin-left:8%;
}
#map {
	position:absolute;
	right:10%;
	margin-top:2%;
}

#listArea{
	text-align:center;
}

table.listArea {
	display:inline-block;
    border-collapse: collapse;
    width:40%;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
    margin-top:4%;
    margin-left:5%;
}
table.listArea th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    text-align:center;
}
table.listArea td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

.SearchFormArea{
	
}

</style>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7fe9ccb116e5c90860fd1bde084cf5a1&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

</head>


<body>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
</script>	
	<%-- window.onload = function test1() {
		navigator.geolocation.getCurrentPosition(function(position) {
			/* 			alert("위도 : " + position.coords.latitude + "\n" + "경도 : "
			 + position.coords.longitude); */

			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(lat, lon), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			
			var geocoder = new daum.maps.services.Geocoder();
			
			
				var listData = [
					<%for(int i =0; i< list.size(); i++){%>
				    {
				        groupAddress: <%=list.get(i).getAddress()%>, 
				    }<%if(i<list.size()-1){%>,<%}%>
				    <%}%>
				];
			    
			for (var i=0; i < listData.length ; i++) {
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(listData[i].groupAddress, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {

			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: result[0].y + "," + result[0].x
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			})

			};    

	</script>
	 --%>
	<%@include file="/views/common/menubar.jsp"%>
	<div class="SearchFormArea">
		<%@ include file="petSitterSearchForm.jsp" %>
	</div>
	<div class="SearchBodyArea">
	
	<!-- 
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 넣으시면 됩니다.">
	</script>
	<script>
		var container = document.getElementById('map');
		var options = {
						center : new daum.maps.LatLng(33.450701, 126.570667), level : 3
					  };
		var map = new daum.maps.Map(container, options);
	</script>
	 -->
	  
	</div>	
	<!-- <button id="test">위도 경도 변환 사용해보기.</button>
	<script>
		$(function(){
			$('#test').click(function(){
				location.href="<%=request.getContextPath()%>/test.pe";
			})
		})

	</script>
	 -->
		<div class="new-ps-body">
				<% for(PetsitterService p : list){ %>
				<table id="listArea" class="listArea">
					<tr>
						<td colspan="2">
						<div id="profileImage">
						<input id="no" name="no" value="<%=p.getPet_service_regno() %>" type="hidden">
						<% 
							String profileImage = null;
						
							if(!p.getProfileImage().equals("/nullnull")){
								profileImage = p.getProfileImage();
							}else{
								profileImage = "/images/profileImagesUpload/profileBasicImage.png";
							}
						%>
						<img height="200px;" src="<%=request.getContextPath()%><%= profileImage %>">
						</div>
						</td>
					</tr>
					<tr>
						<th scope="row">닉네임</th>
						<td><%= p.getNickname() %></td>
					</tr>
					<tr>
						<th scope="row">성별</th>	
						<% if(p.getGender().equals("M")){ %>
						<td>남</td>
						<% } else { %>
						<td>여</td>
						<% } %>
					</tr>
					<tr>
						<th scope="row">동물</th>
						<% 
						switch(p.getPet_category()){ 
						case 1:%><td>강아지</td><%;break; 
						case 2:%><td>고양이</td><%;break;
						case 3:%><td>파충류</td><%;break;
						case 4:%><td>조류</td><%;break;
						case 5:%><td>어류</td><%;break;
						default:%><td>DB읽기에러</td><%;break;} %>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>
						<% 
							String maskedAddress = "";
							if(p.getAddress() != null){
							// 가져온 주소를 공백을 기준으로 잘라 동까지만 노출
							String[] splitAddress = null;
							splitAddress = p.getAddress().split("\\s");
								if(splitAddress.length > 3){
									for(int i = 0; i < 3; i++){
										maskedAddress += splitAddress[i] + " ";
									}
								}else{
									maskedAddress = "잘못된 주소";
								}
							}
						%>
						<%= maskedAddress %>
						</td>
					</tr>
					<tr>
						<th scope="row">서비스</th>
						<td>
						<% 
							String serviceDetail = null;
							if(p.getService_detail().length() > 15){
								serviceDetail = p.getService_detail().substring(0, 15) + "...";
							}else{
								serviceDetail = p.getService_detail();
							}
						%>
						<%= serviceDetail %>
						</td>
					</tr>
					<tr>
						<th scope="row">제한사항</th>
						<td>
						<% 
							String serviceRes = null;
							if(p.getService_restrict().length() > 15){
								serviceRes = p.getService_restrict().substring(0, 15) + "...";
							}else{
								serviceRes = p.getService_restrict();
							}
						%>
						<%= serviceRes %>
						</td>						
					</tr>
				</table>
				<% } %>
		<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled><</button>		
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=currentPage - 1 %>'"><</button>
			<% } %>
			<%
				for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
			%>
				<button disabled><%= p %></button>
			<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=p %>'"><%= p %></button>
			<% } %>			
			
			<% } %>
			
			<% if(currentPage >= maxPage){ %>
				<button disabled>></button>
			<% } else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/PetSitter.all?currentPage=<%=maxPage%>'">>></button>
			</div>
		</div>
</div>
	<script>
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus')
		})
		$(".listArea #profileImage").click(function(){
				// var num = $(this).parent().children("input").val();
				var num = $(this).children("input").val();
				location.href = "<%=request.getContextPath()%>/selectOne.do?no=" + num;
			});
	</script>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7fe9ccb116e5c90860fd1bde084cf5a1"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
	var listData = [
		<%-- <%for(int i =0; i< list.size(); i++){%>
	    {
	        groupAddress: '<%=list.get(i).getAddress()%>', 
	    },
	  
	    <%if(i<list.size()-1){%>,<%}%>
	    <%}%> --%>
	    <%for (int i = 0 ; i < list.size(); i ++ ) {%>
	   <%--  [<%=list.get(i).getAddress().substring(0, 5)%>,<%=list.get(i).getNickname()%>] --%>
	   {
		   address :"<%=list.get(i).getAddress() %>",
		   nickName : "<%=list.get(i).getNickname()%>"
	   }
	    <%if(i<list.size()-1){%>
	    	,
	    <%}%>
	    
	    <%}%>
	];
var tempNickName = '';
for (var i=0; i < listData.length ; i++) {
// 주소로 좌표를 검색합니다
tempNickName = listData[i].nickName;

geocoder.addressSearch(listData[i].address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
		
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        
        var infowindow = new daum.maps.InfoWindow({
            content: tempNickName
        });
        infowindow.open(map, marker);sfe

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
})


};    
	</script>
</body>
</html>