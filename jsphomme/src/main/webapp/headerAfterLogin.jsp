<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	#headerContainer {
		width: 1904px;
	}
	
	
	.shopName {
		float: left;
		margin-left: 50px;
		margin-bottom: 20px;
	}
	
	.shopName input  {
		background-color: #636363; 
		text-align: center; 
		width: 250px; 
		height: 40px;
		color: #FFFFFF;
		font-size: 23px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		border-radius: 7px;
				
	}
	
	.fncButton {
		float: right;
		margin-top: 13px;
		margin-right: 50px;
	}
	
	.headerLine {
		clear: both;
		margin-top: 50px;
	}
	
	.headerLine hr {
		border: solid 1.5px #ABABAB;
	}
	
	.productRegiBtn {
		background-color: #DBDBDB; 
		text-align: center; 
		width:70px; 
		height: 25px;
		color: #939393;
		font-size: 11px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		border-radius: 5px;
	}
	
	
	
	
	.myPageBtn {
		background-color: #DBDBDB; 
		text-align: center; 
		width:70px; 
		height: 25px;
		color: #939393;
		font-size: 11px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		border-radius: 5px;
	}
	
	
	.memberListBtn {
		background-color: #DBDBDB; 
		text-align: center; 
		width:70px; 
		height: 25px;
		color: #939393;
		font-size: 11px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		border-radius: 5px;
	}
	
	.purchaseListBtn {
		background-color: #636363;
		text-align: center; 
		width:70px; 
		height: 25px;
		color: #FFFFFF;
		font-size: 11px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		border-radius: 5px;
	}
	
	.logoutBtn {
		background-color: #636363;
		text-align: center; 
		width:70px; 
		height: 25px;
		color: #FFFFFF;
		font-size: 11px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		border-radius: 5px;
	}
</style>

<title>JSP Homme</title>

<script type="text/javascript">
function productRegiFnc() {
	
}

function myPageFnc() {
	
}

function memberListFnc() {
	location.href ="/jsphomme/member/list.do";
}

function purchaseListFnc() {
	
}

function logoutFnc() {
	location.href = "/auth/logout.do";
}
</script>
</head>
<body>

<div id="headerContainer" >   

	<div class="shopName">
		<input type="button" value="JSP Homme">
		
	</div>
	
	

	
	
<!-- 관리자가 로그인 후 보일 버튼-->
	
<c:if test="${memberVo.authority == '0'}">	
	
	<div class="fncButton">	
		<span> ${memberVo.name} </span>
		<input class="productRegiBtn" type="button" value="상품등록" onclick="productRegiFnc();">
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc();">
		<input class="memberListBtn" type="button" value="회원목록" onclick="memberListFnc();">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc();">
		<input class="logoutBtn" type="button" value="로그아웃" onclick="logoutFnc();">
	</div>

</c:if>
	
<!-- 일반 회원 로그인 후 보일 버튼-->
	
<c:if test="${memberVo.authority == '일반'}">	
	<div class="fncButton">	
		<span> ${memberVo.name} </span>
		<input class="myPageBtn" type="button" value="마이페이지" onclick="myPageFnc();">
		<input class="purchaseListBtn" type="button" value="구매목록" onclick="purchaseListFnc();">
		<input class="logoutBtn" type="button" value="로그아웃"  onclick="logoutFnc();" >
	</div> n  
	
</c:if>	
	
	
	
	<div class="headerLine">
	<hr>
	<br>
	
	</div>
	
</div>
</body>
</html>