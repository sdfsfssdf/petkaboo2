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
         <h2 class="head">회원관리</h2>
         <hr>
      <div class="myMenu_left">
         <br>
         <br>
            <div class="text"><a href="<%=request.getContextPath()%>/selectList.me">회원목록</a></div>
            <br>
            <div class="text">인증요청목록</div>
            <br>
           	<div class="text"><a href="<%=request.getContextPath()%>/selectPenaltyList.me">제재/탈퇴 회원관리</a></div>
            <br> 
           	<div class="text"><a href="<%=request.getContextPath()%>/diapauseList.me">휴면회원관리</a></div>
           	<br>
           	<div class="text"><a href="<%=request.getContextPath()%>/petsitterRequest.me">펫시터신청관리</a></div>
      </div>
   </div>
</body>
</html>