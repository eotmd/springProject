<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<link rel = "stylesheet" type = "text/css" href = "/jsphomme/resources/css/headerStyle.css">
<script type="text/javascript" src="/jsphomme/resources/js/Header.js">



</script>


<div id="headerContainer" >   

	<div class="shopName">
		<input type="button" value="JSP Homme" onclick="shopNameFnc();">
		
	</div>
	
	

	
	

	
<c:if test="${_memberVo_.authority == '0'}">	
	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="productRegiBtn" type="button" value="상품등록" onclick="productRegiFnc();">
		<input class="memberListBtn" type="button" value="숨김상품" onclick="goHideListFnc();">
		<input class="memberListBtn" type="button" value="회원목록" onclick="memberListFnc();">
		<input class="memberListBtn" type="button" value="결제내역" onclick="memberPurchaseListFnc();">
		<input class="logoutBtn" type="button" value="로그아웃" onclick="logoutFnc();">
	</div>

</c:if>
	

	
<c:if test="${_memberVo_.authority == '일반'}">	
	<div class="fncButton">	
		<span> ${_memberVo_.name} </span>
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc();">
		<input class="myPageBtn" type="button" value="장바구니"  onclick="basketFnc();" >
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc(${_memberVo_.memberNo});">
		<input class="logoutBtn" type="button" value="로그아웃"  onclick="logoutFnc();" >
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


