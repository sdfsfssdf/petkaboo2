<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pkb.member.model.vo.*"%>
	<% User loginUser = (User)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}



</script>
<title>펫시팅예약신청서</title>
<% 
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
	String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
	String engAddr = request.getParameter("engAddr"); 
	String jibunAddr = request.getParameter("jibunAddr"); 
	String zipNo = request.getParameter("zipNo"); 
	String addrDetail = request.getParameter("addrDetail"); 
	String admCd    = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdMgtSn  = request.getParameter("bdMgtSn");
	/** API 서비스 제공항목 확대 (2017.02) **/
	String detBdNmList  = request.getParameter("detBdNmList");
	String bdNm  = request.getParameter("bdNm");
	String bdKdcd  = request.getParameter("bdKdcd");
	String siNm  = request.getParameter("siNm");
	String sggNm  = request.getParameter("sggNm");
	String emdNm  = request.getParameter("emdNm");
	String liNm  = request.getParameter("liNm");
	String rn  = request.getParameter("rn");
	String udrtYn  = request.getParameter("udrtYn");
	String buldMnnm  = request.getParameter("buldMnnm");
	String buldSlno  = request.getParameter("buldSlno");
	String mtYn  = request.getParameter("mtYn");
	String lnbrMnnm  = request.getParameter("lnbrMnnm");
	String lnbrSlno  = request.getParameter("lnbrSlno");
	String emdNo  = request.getParameter("emdNo");
%>
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
/* 바탕 배경 이미지 */
.pop-address-search .pop-address-search-inner { background-image: url(http://www.0000.com/img/backImg.png);}
/* 회사 로고 이미지 */
.pop-address-search .pop-address-search-inner .logo { background: url(http://www.0000.com/img/logo.png) no-repeat; background-position:center; }

/* 바탕 배경색상 */
.pop-address-search .pop-address-search-inner { background-color:#ECECEC; }
/* 검색창 색상 */
.pop-address-search .pop-address-search-inner .wrap input { background-color:#FFFFFF; }
/* 검색버튼 색상 */
.pop-address-search .pop-address-search-inner .wrap { background-color:#FFFFFF; }
/* 본문 배경색(홀수) */
.pop-address-search .pop-address-search-inner .result table.data-col tbody tr:nth-child(odd) td {background:#FFFFFF}
/* 본문 배경색(짝수) */
.pop-address-search .pop-address-search-inner .result table.data-col tbody tr:nth-child(even) td {background:#FFFFFF}
#container {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
}

#header {
	float: left;
	width: 100%;
	height: 250px;
	_border: 1px solid blue;
	background-color: rgb(207, 183, 175);
}

#ip-style {
	margin-left: 20%;
}

#body-div {
	margin-left: 20%;
	margin-right: 20%;
	width: 60%;
}

.div1 {
	background: lightgray;
	border-radius: 4px;
	margin-left: 2px;
	margin-right: 2px;
}

.PSphoto {
	width: 127px;
	height: 127px;
	display: inline;
}

.div2 {
	background: lightgray;
	border-radius: 4px;
	margin-left: 2px;
	margin-right: 2px;
}

.input-style {
	width: 55%;
}

table {
	margin-left: 2%;
	margin-bottom: 2%;
	margin-top: 1%;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header"></div>
		<%@include file="../common/menubar.jsp"%>

		<div>
			<h2 style="text-align: center; margin-top: 100px;">
				<span style="color: rgb(228, 100, 18);"> <strong>
						펫시터 예약 신청 </strong>
				</span>
			</h2>
		</div>
		<br /> <br /> <br /> <br /> <br />
		<div id="ip-style">
			맡기기<input type="radio" name="howToPS" /> 부르기 <input type="radio"
				name="howToPS" />
		</div>
		<br />
		<div id="body-div">
			<div class="div1">
				<br /> <br />
				<p>&nbsp;&nbsp;&nbsp;예약 전 확인 해주세요</p>
				<br /> <br />
				<p>
					&nbsp;&nbsp; 더이상 우리의 소중한 아이를 낯선곳에 맡기지 마세요. <br>
					&nbsp;&nbsp;평소와 똑같이 집에서 산책하고 놀아주는 펫카부가 있습니다.
				</p>
				<br />
			</div>
			<br />
			<div class="div2">
				<br />
				<h4>&nbsp;&nbsp;선택하신 펫시터입니다.</h4>
				<table style="display: inline-block">
					<tr>

						<td rowspan="2"><img
							src="http://momojeri.com/web/product/big/201607/33_shop1_658629.jpg"
							class="PSphoto img-circle img-responsive" alt="Responsive image" />
						</td>
						<td><label for="">이름 :</label></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="">주소 :</label></td>
						<td>입력란</td>
					</tr>

				</table>
			</div>
			<br />
			<div class="div1 div3">
				<br />
				<h4>&nbsp;&nbsp;1.지역을 알려주세요</h4>
				<br />
			<form name="form" id="form" method="post">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>


				&nbsp;&nbsp;&nbsp;<input type="checkbox" /> &nbsp;&nbsp;기본주소로 설정하기
				<br />
				<br />
				<br />

			</div>
			<br />
			<div class="div1 div4">
				<br />
				<h4>&nbsp;&nbsp;2.날짜를 알려주세요</h4>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="Date" placeholder="시작 날짜 입력"
					style="width: 200px;" /> - <input type="Date"
					placeholder="종료 날짜 입력" style="width: 200px;" /> <br /> <br />
				<br />
			</div>
			<br />
			<div class="div1 div5">
				<br />

				<h4>&nbsp;&nbsp;3.연락받을 휴대전화 번호를 알려주세요</h4>
				&nbsp;&nbsp;&nbsp;&nbsp;<select name="phoneNum" id="phoneNum">
					<option value="">010</option>
					<option value="">011</option>
					<option value="">017</option>
					<option value="">016</option>
					<option value="">019</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
					placeholder=" ' - , . / '를 제외한 나머지 번호 입력" style="width: 250px;" />&nbsp;&nbsp;
				<button class="btn btn-default" type="submit" onclick="">인증</button>
				<br /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
					placeholder="인증번호 입력" />&nbsp;&nbsp;
				<button class="btn btn-default" type="submit">확인</button>
				<br />
				<br />
			</div>
			<br />
			<!-- <div class="div1 div6">
			<br />
				<h4>&nbsp;&nbsp;4.추가 요청 사항을 기재해 주세요</h4>
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="msg" id="" cols="60" rows="6">내용을 입력해주세요</textarea>
				<br /><br /><br />
			</div> -->
			<br />
			<fieldset class="div1 f-style">
				<br /> &nbsp;&nbsp;<label for="">약관을 확인해 주세요</label> <br />
				<br /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" />모두 동의
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="checkbox" />서비스 이용약관
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="checkbox" />개인정보
				약관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="checkbox" />위치정보 활용약관 <br />
				<br />
				<br />
			</fieldset>
			<br />
			<br />
			<button class="btn btn-default" type="submit">제출</button>
			<button class="btn btn-default" type="reset">취소</button>
		</div>

		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

<script>
function init(){
	var url = location.href;
	var confmKey = "TESTJUSOGOKR";//승인키
	// resultType항목 추가(2016.10.06)
	var resultType = "4"; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType; // resultType항목 추가(2016.10.06)
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; // 인터넷망
		//document.form.action="http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		document.form.submit();
	}else{
		/** API 서비스 제공항목 확대 (2017.02) **/
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>", "<%=roadAddrPart2%>","<%=engAddr%>"
			, "<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=detBdNmList%>"
			, "<%=bdNm%>", "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>"
			, "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=emdNo%>");
		window.close();
	}
}
</script>
</body>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/> // resultType항목 추가(2016.10.06)
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START--> 
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>
