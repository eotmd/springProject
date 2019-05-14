<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productVo.name}</title>

<link rel = "stylesheet" type = "text/css" href = "/jsphomme/resources/css/buttonCss.css">

<script type="text/javascript" 
	src="/jsphomme/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">
function goUpdate() {
	location.href = "/jsphomme/product/updateMove.do?productNo=${productVo.productNo}"
};

function goLogin() {
	alert("로그인을 하셔야 합니다!");
	
	location.href = "/jsphomme/auth/login.do";
}

function goBack() {
	location.href = "/jsphomme/product/list.do"
}

function goBuy() {
	var formBuyObj = document.getElementById("formBuy");
	
	formBuyObj.submit();
}

function soldOut() {
	alert("품절된 상품입니다.")
}

function getBasket() {
	var formBuyObj = document.getElementById("formBuy");
	var confirmVal = confirm("장바구니에 담으시겠습니까?");
	
	if (confirmVal == true) {

		formBuyObj.action = "../basket/insert.do";
		formBuyObj.submit();
	} else {
		return;
	}
}

function goDeleteFnc() {
	var formBuyObj = document.getElementById("formBuy");
	var confirmVal = confirm("상품과 관련된 모든 정보가 삭제됩니다.\n정말 삭제하시겠습니까?");
	
	if (confirmVal == true) {
		
		formBuyObj.action = "../product/delete.do";
		formBuyObj.method="post";
		formBuyObj.submit();
	} else {
		
		return;
	}
	
}

function goHideFnc() {
	
	var formBuyObj = document.getElementById("formBuy");
	var confirmVal = confirm("상품이 감춰져 유저들이 열람할 수 없는 상태가 됩니다.\n상품을 숨기겠습니까?");
	
	if (confirmVal == true) {
		
		formBuyObj.action = "../product/statusUpdate.do";
		formBuyObj.method="post";
		formBuyObj.submit();
	} else {
		
		return;
	}
	
}

function goUnhideFnc() {
	
	var formBuyObj = document.getElementById("formBuy");
	var confirmVal = confirm("상품의 숨기기 상태가 취소됩니다\n취소하시겠습니까?");
	
	if (confirmVal == true) {
		
		formBuyObj.action = "../product/statusUpdate.do";
		formBuyObj.method="post";
		formBuyObj.submit();
	} else {
		
		return;
	}
	
}

</script>

<style type="text/css">
	
	.detailView {
		margin: auto;
		width: 1200px;
		overflow: hidden;
		padding-top: 50px;
	}
	
	.explanation {
		float: right;
		width: 600px;
	}

	.detail > ul  {
		list-style-type: none;
		font-size: 20px;
		
	}
	
	img {
		width: 500px;
		height: 500px;
		float: left;
	}
	
	textarea {
		resize: none;
		width: 1190px;
		margin: auto;
		margin-top: 50px;
		height: 400px;
		border-radius: 7px;
	}
	
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	<div class="detailView">
		
		<form action="../purchase/view.do" id="formBuy">
			<input type="hidden" name = "productName" value="${productVo.name}">
			<input type="hidden" name = "storedFileName" value="${productVo.storedFileName}">
			<input type="hidden" name = "productPrice" value="${productVo.price}">
			<input type="hidden" name="productNo" value="${productVo.productNo}">
			<input type="hidden" name="status" value="${productVo.status}">	
			<span>
				<img alt="${productVo.name}" src="<c:url value='/img/${productVo.storedFileName}'/>"/>
			</span>
			<table class="explanation">
				<tr>
					<td colspan="2" style="font-size: 50px; font-weight: bold; height: 100px;">${productVo.name}</td>
				</tr>
				<tr>
					<td style="width: 150px; font-weight: bold;">가격</td>
					<td><fmt:formatNumber value="${productVo.price}" pattern="#,###"/></td>
				</tr>
				<c:if test="${productVo.quantity > 0}">
					<tr>
						<td style="width: 150px; font-weight: bold;">사이즈</td>
						<td><select name="productSize">
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="XL">XL</option>
							<option value="XXL">XXL</option>
							<option value="XXXL">XXXL</option>
						</select></td>
					</tr>
					<tr>
						<td style="width: 150px; font-weight: bold;">수량</td>
							<td><input type="number" name="purchaseQuantity" 
								value="1" max="${productVo.quantity}" min="1"></td>
					</tr>
				</c:if>
				<c:if test="${productVo.quantity == 0}">
					<tr>			
						<td colspan="2">품절</td>
					</tr>
				</c:if>
				<tr>
					<td style="width: 150px; font-weight: bold;">재고량</td>
					<td>${productVo.quantity}</td>
				</tr>
				<tr>
					<td><input type="button" value="뒤로가기" 
						class="goBackBtn" onclick="goBack();"></td>
				<c:if test="${_memberVo_ == null}">
						<td>
							<input type="button" value="즉시 구매" 
								class="goBuyBtn" onclick="goLogin();">
						</td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_ != null && productVo.quantity > 0 
					&& _memberVo_.authority != '0'}">
						<td colspan="2"><input type="submit" value="즉시 구매" 
							class="goBuyBtn"></td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_ != null && productVo.quantity <= 0
					&& _memberVo_.authority != '0'}">
						<td colspan="2"><input type="button" value="즉시 구매" 
							class="goBuyBtn" onclick="soldOut();"></td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_ != null && productVo.quantity > 0
					&& _memberVo_.authority != '0'}">
					<tr>
						<td colspan="2"><input type="button" value="장바구니에 담기"
							class="goBuyBtn" onclick="getBasket();"
							style="width: 294px;"></td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_ == null}">
					<tr>
						<td colspan="2"><input type="button" value="장바구니에 담기"
							class="goBuyBtn" onclick="goLogin();"
							style="width: 294px;"></td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_ != null && productVo.quantity <= 0
					&& _memberVo_.authority != '0'}">
						<td colspan="2"><input type="button" value="장바구니에 담기" 
							class="goBuyBtn" onclick="soldOut();"
							style="width: 294px;"></td>
				</c:if>
				<c:if test="${_memberVo_.authority == '0'}">
					<tr>
						<td colspan="2"><input type="button" value="수정하기"
							class="goUpdateBtn" onclick="goUpdate();"></td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_.authority == '0' && productVo.status == 1}">
					<tr>
						<td><input type="button" value="제품삭제"
							class="goUpdateBtn" onclick="goDeleteFnc();"></td>
						<td><input type="button" value="숨기기" 
							class="goUpdateBtn" onclick="goHideFnc()"></td>
					</tr>
				</c:if>
				<c:if test="${_memberVo_.authority == '0' && productVo.status == 0}">
					<tr>
						<td><input type="button" value="제품삭제" 
							class="goUpdateBtn" onclick="goDeleteFnc();"></td>
						<td><input type="button" value="숨기기 취소" 
							class="goUpdateBtn" onclick="goUnhideFnc()"></td>
					</tr>
				</c:if>
				
				
				
			</table>
		</form>
		<div style="clear: both; padding-top: 50px; white-space: pre;">${productVo.detail}</div>
		
	</div>

	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>