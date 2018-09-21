<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

   .leftWrapArea{
      display: inline-block;
      width:210px;
      height:800px;
      float:left;
      background:lightgray;
   }
   .myMenu_left{
      padding-left:40px;
   }
   .text:hover{
      color:white;
      font-weight:bold;
      cursor:pointer;
   }
  	.head{
    text-align:center;
   }
   
</style>
</head>
<body>
   <div class="leftWrapArea">
         <h2 class="head">기본설정</h2>
         <hr>
      <div class="myMenu_left">
         <br>
         <br>
            <div class="text"> <a href="<%=request.getContextPath()%>/caaList.caa">수수료 및 계좌설정</a></div>
            <br>
            <div class="text" ><a href="<%=request.getContextPath()%>/noticeList.no">공지사항 설정</a></div>
            <br>
            <div class="text" ><a href="#">관리자 설정</a></div>
      </div>
   </div>
</body>
</html>