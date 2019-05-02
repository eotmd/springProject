<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<link rel = "stylesheet" type = "text/css" href = "/jsphomme/resources/css/headerStyle.css">



<script type="text/javascript">
function shopNameFnc() {
	
// 	location.href="/jsphomme/common/main.do";    // 이후 조회수를 구현하게되면 이를 사용하자
	location.href="/jsphomme";
	
}

function basketFnc() {
	location.href = "/jsphomme/basket/list.do";
}

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

function purchaseListFnc(memberNo) {
	location.href = "/jsphomme/purchase/list.do?memberNo=" + memberNo;
}

function logoutFnc() {
	location.href = "/jsphomme/auth/logout.do";
}

function LoginFnc() {
	location.href = "/jsphomme/auth/login.do";
}

function menswearFnc() {
	location.href ="/jsphomme/product/list.do";
}

function goProductList() {
	location.href = "/jsphomme/product/list.do";
}
function searchFnc() {
	var searchIdObj = document.getElementById("searchId")
	if(event.keyCode == 13){
		
		searchIdObj.submit();
	}
}
</script>


<div id="headerContainer" >   

	<div class="shopName">
		<input type="button" value="JSP Homme" onclick="shopNameFnc();">
		
	</div>
	
	

	
	
<!-- 관리자가 로그인 후 보일 버튼-->
	
<c:if test="${_memberVo_.authority == '0'}">	
	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="productRegiBtn" type="button" value="상품등록" onclick="productRegiFnc();">
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc(${_memberVo_.memberNo});">
		<input class="memberListBtn" type="button" value="회원목록" onclick="memberListFnc();">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc(${_memberVo_.memberNo});">
		<input class="logoutBtn" type="button" value="로그아웃" onclick="logoutFnc();">
		<input class="myPageBtn" type="button" value="장바구니"  onclick="basketFnc();" >
	</div>

</c:if>
	
<!-- 일반 회원 로그인 후 보일 버튼-->
	
<c:if test="${_memberVo_.authority == '일반'}">	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc(${_memberVo_.memberNo});">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc(${_memberVo_.memberNo});">
		<input class="logoutBtn" type="button" value="로그아웃"  onclick="logoutFnc();" >
		<input class="myPageBtn" type="button" value="장바구니"  onclick="basketFnc();" >
	</div> 
	
</c:if>	

<c:if test="${_memberVo_== null}">	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="myPageBtn" type="button" value="마이페이지" onclick="LoginFnc();">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="LoginFnc();">
		<input class="logoutBtn" type="button" value="로그인"  onclick="LoginFnc();" >
	</div> 
	
</c:if>	
	
	
	
	<div class="headerLine">
	<hr>
	<br>
	
	</div>
	
	 <div>
      <input class="menu" type="button" value="Menswear" onclick="menswearFnc();">
      <form style="display: inline;" id="searchId" action="/jsphomme/product/list.do" method="get">
      	<input class="search"  type="text" name="keyword" value="" placeholder="search" onkeydown="searchFnc();">
      </form>
   	</div>
	
</div>


