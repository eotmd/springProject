<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#tableId table{
		width: 1400px;
		margin: auto;
		border: 1px solid;
		border-collapse: collapse;
		
	}
	#tableId > tr > td{
		border: 1px solid;
		border-collapse: collapse;
	}
	.tableTop{
		font-weight: bold;
		text-align: center;
	}
</style>
</head>
<body>
	
	
	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"/>
	
	
	<div id="tableCon">	
		<table id="tableId">
			<tr>
				
					<td class="tableTop" colspan="1">상품 이름</td>
					<td class="tableTop">가격</td>
					<td class="tableTop">사이즈</td>
					<td class="tableTop">수량</td>
					<td class="tableTop">총 결제 금액</td>
				
			</tr>
		</table>
		<table>
			<tr>
			
				<td class="tableBt"><img style="width: 300px; height: 150px;" alt="dkdkdk" src="/jsphomme/test.jpg"></td>
				<td class="tableBt" style="font-weight: bold; vertical-align: top; width: 300px;">${purchaseView.productName}</td>
				<td class="tableBt" style="vertical-align: top;">${purchaseView.productPrice}</td>
				<td class="tableBt">${purchaseView.productSize}</td>
				<td class="tableBt">${purchaseView.purchaseQuantity}</td>
				<td class="tableBt">${purchaseView.productPrice * purchaseView.purchaseQuantity}</td>
				
				<ins><hr></ins>
			</tr>
		</table>
	</div>
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"/>
	
	
	
</body>
</html>