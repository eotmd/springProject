<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




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
	
	.menu {
		background-color: #636363; 
		text-align: center; 
		width: 250px; 
		height: 23px;
		color: #FFFFFF;
		font-size: 20px; 
		font-weight: bolder;
		font-style: normal;
		font-family: "Lucida Console", Monaco, monospace;
		margin-left: 340px;
		margin-top: 20px;
		margin-bottom: 5px;
		border-radius: 7px;
		
	}
</style>



<body>

<div id="headerContainer" >   

	<div class="shopName">
		<input type="button" value="JSP Homme">
		
	</div>
	
	
	<div class="fncButton">	
		<input class="productRegiBtn" type="button" value="제품등록">
		<input class="myPageBtn" type="button" value="마이페이지">
		<input class="purchseListBtn" type="button" value="구매목록">
		<input class="logoutBtn" type="button" value="로그아웃">
	</div>
	
	<div class="headerLine">
	<hr style="width: 1800px; margin: auto;">
	
	
	</div>
	
	<div>
		<input class="menu" type="button" value="Menswear">
		<input class="menu" style=" text-align: left; margin-left: 680px; height:20px; vertical-align: bottom; font-size: 17px;" type="text" value="" placeholder="search">
	</div>
	</div>

