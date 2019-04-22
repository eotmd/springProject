<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#tableCon{
		width: 1500px;
		height:185px;
		margin: auto;
		
	}
	.tableId table{
		width: 1400px;
		margin: auto;
		border: 1px solid;
		border-collapse: collapse;
		
	}
	.tableId td{
		border: 1px solid;
		border-collapse: collapse;
	}
	.tableTop{
		font-weight: bold;
		text-align: center;
	}
	.tableBt{
		vertical-align: top;
	}
</style>
</head>
<body>
	
	
	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"/>
	
	
	<div id="tableCon">	
		<table class="tableId">
			<tr>
				
					<td class="tableTop" colspan="1">상품 이름</td>
					<td class="tableTop">가격</td>
					<td class="tableTop">사이즈</td>
					<td class="tableTop">수량</td>
					<td class="tableTop">총 결제 금액</td>
				
			</tr>
		</table>
		<table class="tableId">
			<tr>
			
				<td class="tableBt"><img style="width: 300px; height: 150px;" alt="${purchaseListVo.storedFileName}" src="<c:url value='/img/${purchaseListVo.storedFileName}'/>"></td>
				
				
				
				<td class="tableBt" style="font-weight: bold; width: 300px;">${purchaseListVo.productName}</td>
				<td class="tableBt" style="vertical-align: top;">${purchaseListVo.productPrice}</td>
				<td class="tableBt">${purchaseListVo.productSize}</td>
				<td class="tableBt">${purchaseListVo.purchaseQuantity}</td>
				<td class="tableBt">${purchaseListVo.productPrice * purchaseListVo.purchaseQuantity}</td>
				
				<ins><hr></ins>
			</tr>
		</table>
	</div>
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"/>
	
	
	
</body>
</html>