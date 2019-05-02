<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		height:640px;
		margin: auto;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
		margin-top: 20px;
	}
	
	#tableCon2{
		overflow: scroll;
		overflow-x:hidden; 
		height: 560px;
	}
	
	.tableId{
		width: 1500px;
		margin: auto;
		height: 50px;
		
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
		vertical-align: middle;
		text-align:center;
		padding: 5px;
	}
	
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	
	
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
		<div id="tableCon2">
		<table class="tableId">
			<c:forEach var="basketVo" items="${basketList}">
				<tr>	
					<td class="tableBt" style="height: 310px"><img style="width: 300px; height: 300px;" alt="${basketVo.storedFileName}" src="<c:url value='/img/${basketVo.storedFileName}'/>"></td>		
					<td class="tableBt" style="font-weight: bold; width: 300px;">${basketVo.name}</td>
					<td class="tableBt" style="width: 223px;"><fmt:formatNumber value="${basketVo.price}" pattern="#,###"/></td>
					<td class="tableBt" style="width: 223px;">${basketVo.productSize}</td>
					<td class="tableBt" style="width: 222px;">${basketVo.shoppingBasketQuantity}</td>
					<td class="tableBt" style="width: 222px;"><fmt:formatNumber value="${basketVo.price * basketVo.shoppingBasketQuantity}" pattern="#,###"/></td>
				</tr>
			</c:forEach>
			
		</table>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>