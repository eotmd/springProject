<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	.purchseListBtn {
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

</head>
<body>

<div id="headerContainer">

	<div class="shopName">
		<input type="button" value="JSP Homme">
		
	</div>
	
	<div class="fncButton">
		<input class="myPageBtn" type="button" value="마이페이지">
		<input class="purchseListBtn" type="button" value="구매목록">
		<input class="logoutBtn" type="button" value="로그아웃">
	</div>
	
	<div class="headerLine">
	<hr>
	<br>
	
</div>
</body>
</html>