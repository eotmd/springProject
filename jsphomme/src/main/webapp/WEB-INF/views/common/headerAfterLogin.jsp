<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel = "stylesheet" type = "text/css" href = "/jsphomme/resources/css/headerStyle.css">


<title>JSP Homme</title>

<script type="text/javascript">
function productRegiFnc() {
	location.href ="/jsphomme/product/insertMove.do";
}

function myPageFnc(memberNo) {
	location.href ="/jsphomme/member/detail.do?memberNo=" + memberNo;
	
// 	var url = '/detail.do?no=' + memberNo;
// 	location.href = url;
}

function memberListFnc() {
	location.href ="/jsphomme/member/list.do";
}

function purchaseListFnc() {
	
}

function logoutFnc() {
	location.href = "/jsphomme/auth/logout.do";
}
</script>
</head>
<body>

<div id="headerContainer" >   

	<div class="shopName">
		<input type="button" value="JSP Homme">
		
	</div>
	
	

	
	
<!-- 관리자가 로그인 후 보일 버튼-->
	
<c:if test="${_memberVo_.authority == '0'}">	
	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="productRegiBtn" type="button" value="상품등록" onclick="productRegiFnc();">
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc(${_memberVo_.memberNo});">
		<input class="memberListBtn" type="button" value="회원목록" onclick="memberListFnc();">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc();">
		<input class="logoutBtn" type="button" value="로그아웃" onclick="logoutFnc();">
	</div>

</c:if>
	
<!-- 일반 회원 로그인 후 보일 버튼-->
	
<c:if test="${_memberVo_.authority == '일반'}">	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc(${_memberVo_.memberNo});">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc();">
		<input class="logoutBtn" type="button" value="로그아웃"  onclick="logoutFnc();" >
	</div> 
	
</c:if>	
	
	
	
	<div class="headerLine">
	<hr>
	<br>
	
	</div>
	
	 <div>
      <input class="menu" type="button" value="Menswear">
      <input class="search" type="text" value="" placeholder="search">
   	</div>
	
</div>
</body>
</html>