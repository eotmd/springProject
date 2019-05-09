<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" 
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<style type="text/css">
	
	img{
		width: 300px; 
		height: 300px;
	}
	
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
		margin-right: 5px;
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
	
	.tableBt_name{
		vertical-align: middle;
		text-align:center;
		padding: 5px;
		color: black;
		text-decoration: none;
	}
	
	.tableBt_name:hover{
		text-decoration: underline;
		vertical-align: middle;
		text-align:center;
		padding: 5px;
		color: black;
	}
	
	.goUpdateBtn {
		border: 1px solid;
		border-radius: 7px;
		background: white;
		font-size: 20px;
		background: #939393;
		color: white;
		width: 98px;
	}
	
	.goUpdateBtn:hover{
		background: #F79F81;
	}
	
	.goBuyBtn {
		border: 1px solid;
		border-radius: 7px;
		background: white;
		font-size: 20px;
		background: #939393;
	/* 	background: #0080FF; */
		color: white;
		width: 140px;
	}
	
	.goBuyBtn:hover {
		background: #819FF7;
	}
	
</style>

<script type="text/javascript">

function goDeleteFnc(no) {
	
	var confirmVal = confirm("장바구니에서 삭제됩니다.\n삭제하시겠습니까?");
	
	if (confirmVal == true) {
		
		location.href = "/jsphomme/basket/delete.do?basketNo=" + no;
	} else {
		return;
	}
}

function goDeleteAllFnc() {
	
	var confirmVal = confirm("장바구니에 담은 모든 상품이 삭제됩니다.\n장바구니를 비우시겠습니까?");
	
	if (confirmVal == true) {
			
			location.href = "/jsphomme/basket/deleteAll.do";
		} else {
			
			return;
		}
}

function goBuyFnc() {
	
	var isChecked = false;
	var basketNoArrObj = document.getElementsByName('basketNoArr');
	var goBuyObj = document.getElementById('goBuy');
	
	for (var i = 0; i < basketNoArrObj.length; i++) {
		if (basketNoArrObj[i].checked == true) {
			isChecked = true;
			break;
		}
	}
	
	if (!isChecked) {
		alert("구매할 상품을 선택해주세요!");
	} else {
		goBuyObj.submit();
	}
	
}

$(document).ready(function() {
    //최상단 체크박스 클릭
    $("#checkAll").click(function(){
        //클릭되었으면
		var check = $("#checkAll").prop("checked");
		$("input[name=basketNoArr]").prop("checked", check);
    })
})

</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	
	<div id="tableCon">	
		
		<table class="tableId" style="margin-right: 21px;">
			<tr>
				<td class="tableTop" style="width: 40px;">
					<input type="checkbox" id="checkAll" checked="checked">
				</td>
				<td class="tableTop" style="width: 310px;">
					<input type="button" class="goBuyBtn" value="선택항목 구매" 
						onclick="goBuyFnc();">
				</td>
				<td class="tableTop" style="width: 300px;">상품 이름</td>
				<td class="tableTop" style="width: 190px;">가격</td>
				<td class="tableTop" style="width: 190px;">사이즈</td>
				<td class="tableTop" style="width: 190px;">수량</td>
				<td class="tableTop" style="width: 190px;">총 결제 금액</td>
				<td class="tableTop" style="width: 100px;">
					<input type="button" class="goUpdateBtn" value="모두 삭제" 
						onclick="goDeleteAllFnc();">
				</td>
			</tr>
		</table>
		<ins><hr></ins>
		<div id="tableCon2">
		<form action="/jsphomme/basket/buy.do" id="goBuy">
			<table class="tableId">
				<c:forEach var="basketVo" items="${basketList}">
					<tr>	
						<td class="tableBt" style="width: 40px;">
							<input type="checkbox" name="basketNoArr" 
								value="${basketVo.basketNo}" checked="checked">
						</td>
						<td class="tableBt" style="height: 310px">
							<a href="/jsphomme/product/detail.do?productNo=${basketVo.productNo}">
								<img alt="${basketVo.storedFileName}" 
								src="<c:url value='/img/${basketVo.storedFileName}'/>"></a>
						</td>		
						<td class="tableBt" style="font-weight: bold; width: 300px;">
							<a class="tableBt_name" 
								href="/jsphomme/product/detail.do?productNo=${basketVo.productNo}">
									${basketVo.name}
							</a>
						</td>
						<td class="tableBt" style="width: 190px;"><fmt:formatNumber value="${basketVo.price}" pattern="#,###"/></td>
						<td class="tableBt" style="width: 190px;">${basketVo.productSize}</td>
						<td class="tableBt" style="width: 190px;">${basketVo.purchaseQuantity}</td>
						<td class="tableBt" style="width: 190px;"><fmt:formatNumber value="${basketVo.price * basketVo.purchaseQuantity}" pattern="#,###"/></td>
						<td class="tableBt" style="width: 100px;">
							<input type="button" value="삭제" class="goUpdateBtn" 
								style="width: 56px;" onclick="goDeleteFnc(${basketVo.basketNo});">
						</td>
					</tr>
				</c:forEach>
			</table>
			</form>
			
			<c:if test="${empty basketList}">
				<p style="text-align: center;">장바구니에 담은 상품이 없습니다.</p>
			</c:if>
			
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>