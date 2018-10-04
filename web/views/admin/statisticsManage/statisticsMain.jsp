<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.pkb.board.model.vo.*"%>

<%
	HashMap<String,Object> totalMap = (HashMap<String,Object>)request.getAttribute("info");
	ArrayList<HashMap<String,Object>> totalInfo = (ArrayList<HashMap<String,Object>>)totalMap.get("totalInfo");
	HashMap<String,Object> mMap = (HashMap<String,Object>)totalMap.get("mMap");
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
		System.out.println("");
		System.out.println("-----------------------------------");
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
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Nwagon.css" type="text/css">  
<script src="<%=request.getContextPath() %>/js/Nwagon.js"></script>  
<head>
<style>
	.outer{
		float:left;
		width:1000px;
		height:1000px;
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
      height:1250px !important;      
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
			<h3>회원 통계</h3>
			<p>회원의 가입/탈퇴/제재/휴면의 추이를 확인할 수 있습니다.</p>
			<hr>
<div id="Nwagon" style="display:inline-block">
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
			colorset: ['#DC143C','#2EB400','#FE9A2E','#A4A4A4'],
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
			colorset: ['#DC143C','#2EB400','#FE9A2E','#A4A4A4'],
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




</div></div></div>
</body>
</html>