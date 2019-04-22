<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
	#tableCon{
		width: 1550px;
		height:250px;
		margin: auto;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
		margin-top: 20px;
	}
	#tableCon2{
		overflow: scroll;
		overflow-x:hidden; 
	}
	.tableId{
		width: 1500px;
		margin: auto;
		
		border-collapse: collapse;
		
	}
	.tableId td{
		
		border-collapse: collapse;
	}
	.tableTop{
		font-weight: bold;
		text-align: center;
	}
	.tableBt{
		vertical-align: top;
		text-align: center;
		padding: 5px;
	}
	#memberInfoCon{
		
		width: 1550px;
		height:500px;
		margin: auto;
		margin-top: 30px;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
	}
	#memberInfoId{
		width:1300px;
		height:320px;
		margin-left: 100px;
		font-weight: bold;
	}
	.memberInfoSample{
		font-weight: bold; 
		border: 0px; 
		background-color:#F6F6F6;
		color: #C3C3C3;
	}
	
	.memberInfoInput{
		border: 0px; 
		background-color:#F6F6F6;
		height: 25px;
		font-size: 18px;
		font-weight: 5px;
		margin-bottom: 5px;
		color: gray;
		width: 900px;
	}
	
</style>
</head>
<body>
	
	
	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"/>
	
	
	<div id="tableCon">	
		<table class="tableId">
			<tr>
				
					<td class="tableTop" style="width: 310px;"></td>
					<td class="tableTop" style="width: 300px;">상품 이름</td>
					<td class="tableTop" style="width: 223px;">가격</td>
					<td class="tableTop" style="width: 223px;">사이즈</td>
					<td class="tableTop" style="width: 222px;">수량</td>
					<td class="tableTop" style="width: 222px;">총 결제 금액</td>
				
			</tr>
		</table>
		<ins><hr></ins>
		<div id="tableCon2" style="height: 200px;">
		<table class="tableId" style="height: 200px;">
			<tr>	
				<td class="tableBt" style="310px; height: 160px"><img style="width: 300px; height: 150px;" alt="${purchaseListVo.storedFileName}" src="<c:url value='/img/${purchaseListVo.storedFileName}'/>"></td>		
				<td class="tableBt" style="font-weight: bold; width: 300px; text-align: left;">${purchaseListVo.productName}</td>
				<td class="tableBt" style="width: 223px;">${purchaseListVo.productPrice}</td>
				<td class="tableBt" style="width: 223px;">${purchaseListVo.productSize}</td>
				<td class="tableBt" style="width: 222px;">${purchaseListVo.purchaseQuantity}</td>
				<td class="tableBt" style="width: 222px;">${purchaseListVo.productPrice * purchaseListVo.purchaseQuantity}</td>
			</tr>
			
		</table>
		</div>
	</div>
	
	<div id="memberInfoCon">
	<br/>
	<br/>
		<div id="memberInfoId">
		
		<input class="memberInfoSample" type="text" disabled="disabled" value="보내는 사람"><br/>
		<input class="memberInfoInput" type="text"  placeholder="이름"><br/>
		<input class="memberInfoSample" type="text" disabled="disabled" value="받는 사람"><br/>
		<input class="memberInfoInput" type="text"  placeholder="이름"><br/>
		<input class="memberInfoSample" type="text" disabled="disabled" value="주소"><br/>
		<input class="memberInfoInput" type="text"  placeholder="주소"><br/>
		<input class="memberInfoSample" type="text" disabled="disabled" value="연락처"><br/>
		<input class="memberInfoInput" type="text"  placeholder="연락처"><br/>
		<input class="memberInfoSample" type="text" disabled="disabled" style="color: #6EE3F7;" value="요청사항"><br/>
		<input class="memberInfoInput" type="text" style="color: #6EE3F7;" value="요청사항"><br/>
		<ins><hr style="border:solid 1px #6EE3F7; margin-top: 1px;"></ins>
		</div>
		
		<div style="height: 100px;">
		<br/>
			<hr>
		</div>
	
	</div>
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"/>
	
	
	
</body>
</html>