<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.pkb.board.model.vo.*"%>

<%
	HashMap<String,Object> totalMap = (HashMap<String,Object>)request.getAttribute("info");
	ArrayList<HashMap<String,Object>> totalInfo = (ArrayList<HashMap<String,Object>>)totalMap.get("totalInfo");
	HashMap<String,Object> mMap = (HashMap<String,Object>)totalMap.get("mMap");
	ArrayList<HashMap<String,Object>> plist = (ArrayList<HashMap<String,Object>>)totalMap.get("plist");
	Date today = new Date();
	Calendar[] cal = new Calendar[6];
	String[] dates = new String[7]; 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	for(int i = 0 ; i <cal.length; i ++) {
		cal[i] = new GregorianCalendar();
		cal[i].add(Calendar.DATE, -i - 1);
		dates[i+1] = sdf.format(cal[i].getTime());
	}
	dates[0] = sdf.format(today);
	ArrayList<ArrayList<HashMap<String,String>>> transInfo = new ArrayList<ArrayList<HashMap<String,String>>>();
	ArrayList<HashMap<String,String>> middleInfo = null;
	
	// 차트에 필요한 데이터 초기화
	for(int i = 0; i < 7 ; i ++){
		middleInfo = new ArrayList<HashMap<String,String>>();
		for(int j = 0 ; j < 4 ; j ++){
			HashMap<String,String> temp = new HashMap<String,String>();
			temp.put("count", "0");
			if(j == 0){
				temp.put("type","D");
			} else if(j == 1){
				temp.put("type","M");
			} else if(j == 2){
				temp.put("type","L");
			} else if(j == 3) {
				temp.put("type","I");
			}
			temp.put("date",dates[i]);
			middleInfo.add(temp);
			System.out.print(temp + " / ");
		}
		transInfo.add(middleInfo);
	}
	
	
	System.out.println(transInfo);
	// DB에서 받아온 값 초기화된 데이터에 업데이트
	if(totalInfo != null && totalInfo.size() != 0) {
		for(int i = 0 ; i < totalInfo.size(); i++){
			
			String date = (totalInfo.get(i).get("date")).toString();
			String type = (totalInfo.get(i).get("type")).toString();
			String count = (totalInfo.get(i).get("count")).toString();
			if(date.equals(dates[0])){
				if(type.equals("D")){
					transInfo.get(0).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(0).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(0).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(0).get(3).put("count",count );
				}
			} else if(date.equals(dates[1])){
				if(type.equals("D")){
					transInfo.get(1).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(1).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(1).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(1).get(3).put("count",count );
				}
			} else if(date.equals(dates[2])){
				if(type.equals("D")){
					transInfo.get(2).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(2).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(2).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(2).get(3).put("count",count );
				}
			} else if(date.equals(dates[3])){
				if(type.equals("D")){
					transInfo.get(3).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(3).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(3).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(3).get(3).put("count",count );
				}
			} else if(date.equals(dates[4])){
				if(type.equals("D")){
					transInfo.get(4).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(4).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(4).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(4).get(3).put("count",count );
				}
			} else if(date.equals(dates[5])){
				if(type.equals("D")){
					transInfo.get(5).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(5).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(5).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(5).get(3).put("count",count );
				}
			} else if(date.equals(dates[6])) {
				if(type.equals("D")){
					transInfo.get(6).get(0).put("count",count );
				} else if (type.equals("M")) {
					transInfo.get(6).get(1).put("count",count );
				} else if( type.equals("L")){
					transInfo.get(6).get(2).put("count",count );
				} else if (type.equals("I")){
					transInfo.get(6).get(3).put("count",count );
				}
			}
		}
	}
	
	for(int i = 6 ; i >= 0 ; i --) {
		System.out.println(i);
	}
	System.out.println(transInfo);
	
	
	// 수입 통계에 필요한 데이터 초기화 
	HashMap<String,Object> tempMap = null;
	ArrayList<HashMap<String,Object>> tempList = new ArrayList<HashMap<String,Object>>();
	for(int i = 0; i < 5 ; i ++){
		for(int j = 0 ; j < 12 ; j ++){
			tempMap = new HashMap<String,Object>();
			tempMap.put("amount", 0);
			if(i == 0) {
				tempMap.put("method", "A");
			} else if ( i == 1){
				tempMap.put("method", "U");
			} else if ( i ==2) {
				tempMap.put("method", "R");
			} else if ( i == 3) {
				tempMap.put("method", "K");
			} else if ( i == 4) {
				tempMap.put("method", "C");
			}
			if(j < 9){
				tempMap.put("date", "0"+(j+1));
			} else {
				tempMap.put("date", (j+1));
			}
			tempList.add(tempMap);
		}
	}
	
	// 통계에 필요한 DB 값과 임시데이터 동기화
	for(int i = 0 ; i < tempList.size(); i ++) {
		for(int j = 0 ; j < plist.size(); j ++) {
			if(tempList.get(i).get("date").equals(plist.get(j).get("date"))
					&& tempList.get(i).get("method").equals(plist.get(j).get("method"))){
				tempList.get(i).put("amount", plist.get(j).get("amount"));
			}
		}
	}
	
	System.out.println(tempList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Nwagon.css" type="text/css">  
<script src="<%=request.getContextPath() %>/js/Nwagon.js"></script>  
<head>
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
		width:1200px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.head > th{
		background: #ddd;
		text-align:center;
	}
	
	.leftWrapArea{
      height:600px !important;      
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../main/header.jsp" %>
	<%@include file="leftMenu.jsp" %>
	<div class="outer">
		<div class="first-row">
			<div class="table1">
			<h3>펫카부 통계</h3>
			<p>회원관련 통계, 수입통계, 거래통게를 확인할 수 있습니다.</p>
		
<br>
<br>
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">회원통계</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="Nwagon" style="display:inline-block">
      <br><br>
<label>회원 상태 추이</label></div>
<script>
	var options = {
		'legend':{
			names: [<%=dates[6]%>,<%=dates[5]%>,<%=dates[4]%>,<%=dates[3]%>,<%=dates[2]%>,<%=dates[1]%>,<%=dates[0]%>],
			hrefs: []
		},
		'dataset':{
			title:'회원 통계',
			values: [
				<%
					for(int i = 6 ; i >= 0 ; i --) {
				%>
				[
				<%=
					Integer.parseInt(transInfo.get(i).get(0).get("count"))
				%> 
					, 
				<%=
				Integer.parseInt(transInfo.get(i).get(1).get("count"))
				%>
					, 
				<%=
				Integer.parseInt(transInfo.get(i).get(2).get("count"))
				%>
					, 
				<%=
				Integer.parseInt(transInfo.get(i).get(3).get("count"))
				%>
				]
				<%if (i !=0) { %>
				,
				<%}%>
				<%
				}
				%>
				
				/* [61, 66,30,21], 
				[76,66,40,18], 
				[49,45,1,0], 
				[58,76,2,1], 
				[48, 76,10,5], 
				[56, 83,5,1],
				[0, 83,5,1] */
				
				],
			colorset: ['#DC143C','#2EB400','#FE9A2E','#0040FF'],
			fields:['탈퇴', '가입','제재','휴면']
		},
		'chartDiv' : 'Nwagon',
		'chartType' : 'jira',
		'chartSize' : {width:700, height:300},
		'maxValue' : 50,
		'increment' : 5
	};
	Nwagon.chart(options);
</script>



<div id="Nwagon2" style="display:inline-block">
<label>전체 회원 현황</label></div>
<script>
	var options = {
		'dataset':{
			title: 'Web accessibility status',
			values:[<%=mMap.get("withdrawal")%>, <%=mMap.get("nomal")%> , <%=mMap.get("sanctions")%>, <%=mMap.get("rest")%>],
			colorset: ['#DC143C','#2EB400','#FE9A2E','#0040FF'],
			fields: ['탈퇴', '정상','제재','휴면'],
		},
		'donut_width' : 35,
		'core_circle_radius':50,
		'chartDiv': 'Nwagon2',
		'chartType': 'donut',
		'chartSize': {width:300, height:300}
	};
	Nwagon.chart(options);
</script>
    </div>
    <div id="menu1" class="tab-pane fade">
      <label>올해의 결제 현황</label>
      
      
      
     <div id="Nwagon3"></div>
<script>
	var options = {
		'legend': {
			names: ['01','02','03','04','05','06','07','08','09' , '10','11','12'],
			hrefs: [

			]
		},
		'dataset': {
			title: 'Playing time per day',
			values: [
				
				<% for(int i = 0 ; i < tempList.size(); i ++ ) {%>
					[
						<%if (i % 12 == 0 ) { %>
							<%if(i / 12 == 0) { %>
								<%= tempList.get(i).get("amount") %>
								,
							<%} else if ( i / 12 == 1 ) {%>
								<%= tempList.get(i).get("amount") %>
								,
							<%} else if ( i/ 12 == 2) {%>
								<%= tempList.get(i).get("amount") %>
								,
							<%} else if ( i / 12 == 3) { %>
								<%= tempList.get(i).get("amount") %>
								,
							<%} else if ( i / 12 == 4) { %>
								<%= tempList.get(i).get("amount") %>
							<%} %>
						<%}%>
					],
					
					[
						<%if (i % 12 == 1 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 2 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 3 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 4 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 5 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 6 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 7 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 8 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 9 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 10 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					],
					[
						<%if (i % 12 == 11 ) { %>
						<%if(i / 12 == 0) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 1 ) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i/ 12 == 2) {%>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 3) { %>
						<%= tempList.get(i).get("amount") %>
						,
					<%} else if ( i / 12 == 4) { %>
						<%= tempList.get(i).get("amount") %>
					<%} %>
						<%}%>
					]
				
				<%} %>
				
				
				//[5,7,2,2,4], [2,5,7], [7,2,3], [6,1,5], [5,3,8], [8,3,1], [6,3,9], [6,2,6], [8,2,4],[5,7,2,2,4],[5,7,2,2,4],[5,7,2,2,4]
			],
			colorset: ['#30a1ce', '#58FA82', "#DC143C","#FAAC58","#5882FA"],
			fields: ['총 거래 금액', '사용 금액', '환불 금액','출금 금액','충전 금액']
		},
		'chartDiv': 'Nwagon3',
		'chartType': 'multi_column',
		'chartSize': { width: 700, height: 300 },
		'maxValue': 10,
		'increment': 1
	};
	Nwagon.chart(options);
</script>
      
      
      
      
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>결제 / 거래 통계</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>



</div></div></div>
<%@include file="../../common/footer.jsp" %>
</body>
</html>