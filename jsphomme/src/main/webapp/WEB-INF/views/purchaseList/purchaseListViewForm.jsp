<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainImg { 
 		width: 1698px;
      	height: 380px;
       	margin-left: 94px;
       	margin-right: 94px;
 	} 
	#tableCon{
		width: 1805px;
		margin: auto;
		
		
	}
	#tableCon > table, td{
		border: 1px solid;
		border-collapse: collapse;
		padding: 5px;
	}
	#tableCon > table{
		margin:auto;
		width: 1698px;
	}
	#tableCon > td{
		height: 32px;
	}
	
	.tableTop{
		text-align: center;
		background-color: #DBDBDB;
		font-weight: bold;
	}
	.productName > a:hover {
		font-weight: bold;
		
	}
	

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"/>
	
<div style="margin: auto;">	

		
			<img id="mainImg" alt="ConceptPhoto" src="../resources/images/concept2.jpg">
		
	
	
	<div id="tableCon">
	
	<table style="margin-top: 20px;">
		<tr>
			<td class="tableTop">상품 번호</td>
			<td class="tableTop">상품 이름</td>
			<td class="tableTop">사이즈</td>
			<td class="tableTop">수량</td>
			<td class="tableTop">개당 가격</td>
			<td class="tableTop">총 지불액</td>
			<td class="tableTop">배송지</td>
			<td class="tableTop">수령인</td>
			<td class="tableTop">구매 날짜</td>
			<td class="tableTop">요청사항</td>
		</tr>
		<c:forEach var="purchaseList" items="${purchaseList}">
		<tr>
			<td style="text-align: center; width: 100px;">${purchaseList.productNo}</td>
			<td class="productName" style="text-align: left; width: 242px;"><a style="text-decoration: none; color: black;" href="/jsphomme/product/detail.do?productNo=${purchaseList.productNo}">${purchaseList.productName}</a></td>
			<td style="text-align: center; width: 101px;">${purchaseList.productSize}</td>
			<td style="text-align: center; width: 101px;">${purchaseList.purchaseQuantity}</td>
			<td style="text-align: right; width: 101px;"><fmt:formatNumber value="${purchaseList.productPrice}" pattern="#,###"/></td>
			<td style="text-align: right; width: 101px;"><fmt:formatNumber value="${purchaseList.productPrice * purchaseList.purchaseQuantity}" pattern="#,###"/></td>
			<td style="text-align: left; width: 349px;">${purchaseList.address}</td>
			<td style="text-align: left; width: 101px;">${purchaseList.recipient}</td>
			<td style="text-align: center; width: 151px;"><fmt:formatDate value="${purchaseList.purchaseDate}" pattern="yyyy년 MM월 dd일  hh시mm분"/></td>
			<td style="text-align: left; width: 351px;">${purchaseList.requests}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	
	<form action="/jsphomme/purchase/list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage" value="${pagingMap.paging.curPage}">
	</form>
</div>
	<jsp:include page="/WEB-INF/views/common/tail.jsp"/>
</body>
</html>