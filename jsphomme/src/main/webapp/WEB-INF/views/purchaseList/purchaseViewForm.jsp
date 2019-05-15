<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>...구매</title>
<script type="text/javascript">
	window.onload = function() {
		var nameIdObj = document.getElementById("nameId");
		
		nameIdObj.focus();
	}
	
	function backFnc1() {
		var productNoObj = document.getElementById("productNo");
		location.href ="/jsphomme/product/detail.do?productNo="+productNoObj.value;
	}
	function backFnc2() {
		
		location.href ="/jsphomme/basket/list.do";
	}
	
	function finshFnc() {
		var formIdObj = document.getElementById("formId");
		var nameIdObj = document.getElementById("nameId");
		var addressIdObj = document.getElementById("addressId");
		var hpIdObj = document.getElementById("hpId");
		
		if(nameIdObj.value ==""){
			alert("수령인을 입력해 주세요");
			return;
		}
		
		if(addressIdObj.value ==""){
			alert("주소를 입력해 주세요");
			return;
		}
		
		if(hpIdObj.value ==""){
			alert("연락처를 입력해 주세요");
			return;
		}
		var confirmVal = confirm("정말 구매하시겠습니까?");
		
		if(confirmVal == true){
			
			formIdObj.submit();
		}else{
			return;
		}
		
	}
</script>
<style type="text/css">
#tableCon {
	width: 1550px;
	height: 460px;
	margin: auto;
	background-color: #F6F6F6;
	box-shadow: 7px 7px 20px -8px gray;
	margin-top: 20px;
}

#tableCon2 {
	overflow: scroll;
	overflow-x: hidden;
}

.tableId {
	width: 1500px;
	margin: auto;
	border-collapse: collapse;
}

.tableId td {
	border-collapse: collapse;
}

.tableTop {
	font-weight: bold;
	text-align: center;
}

.tableBt {
	vertical-align: middle;
	text-align: center;
	padding: 5px;
}

#memberInfoCon {
	width: 1550px;
	height: 500px;
	margin: auto;
	margin-top: 30px;
	background-color: #F6F6F6;
	box-shadow: 7px 7px 20px -8px gray;
}

#memberInfoId {
	width: 1300px;
	height: 350px;
	margin-left: 100px;
	font-weight: bold;
}

.memberInfoSample {
	font-weight: bold;
	border: 0px;
	background-color: #F6F6F6;
	color: #C3C3C3;
}

.memberInfoInput {
	border: 0px;
	background-color: #F6F6F6;
	height: 35px;
	font-size: 18px;
	font-weight: 5px;
	margin-bottom: 5px;
	color: gray;
	width: 900px;
}

.resultBt {
	margin-left: 200px;
	width: 270px;
	height: 50px;
	border: 0px;
	background-color: #F6F6F6;
	color: gray;
	font-weight: bold;
	font-size: 22px;
}

.resultBt:hover {
	color: #6EE3F7;
}
</style>

</head>
<body>


	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />


	<form id="formId" action="/jsphomme/purchase/finish.do" method="post">
		<div id="tableCon">
			<table class="tableId" style="margin-right: 34px;">
				<tr>

					<td class="tableTop" style="width: 310px;"></td>
					<td class="tableTop" style="width: 300px;">상품 이름</td>
					<td class="tableTop" style="width: 223px;">가격</td>
					<td class="tableTop" style="width: 223px;">사이즈</td>
					<td class="tableTop" style="width: 222px;">수량</td>
					<td class="tableTop" style="width: 222px;">총 결제 금액</td>

				</tr>
			</table>
			<ins>
				<hr>
			</ins>
			<div id="tableCon2" style="height: 400px;">
				<table class="tableId" style="height: ">

					<c:forEach var="purchaseListVo" items="${purchaseListVo}" varStatus="i">
						<input type="hidden" name="memberNo"
							value="${_memberVo_.memberNo}">
						<input type="hidden" id="productNo" name="productNoArr"
							value="${purchaseListVo.productNo}">
						<input type="hidden" name="productSizeArr"
							value="${purchaseListVo.productSize}">
						<input type="hidden" name="purchaseQuantityArr"
							value="${purchaseListVo.purchaseQuantity}">
					<c:if test="${basketNo != null}">
						<input type="hidden" name="basketNo"
							value="${basketNo[i.index]}">
					</c:if>
						<tr>
							<td class="tableBt" style="">
								<img style="width: 300px; height: 399.89px;"
								alt="${purchaseListVo.storedFileName}"
								src="<c:url value='/img/${purchaseListVo.storedFileName}'/>"></td>
							<td class="tableBt" style="font-weight: bold; width: 300px;">${purchaseListVo.productName}</td>
							<td class="tableBt" style="width: 223px;"><fmt:formatNumber
									value="${purchaseListVo.productPrice}" pattern="#,###" /></td>
							<td class="tableBt" style="width: 223px;">${purchaseListVo.productSize}</td>
							<td class="tableBt" style="width: 222px;">${purchaseListVo.purchaseQuantity}</td>
							<td class="tableBt" style="width: 222px;"><fmt:formatNumber
									value="${purchaseListVo.productPrice * purchaseListVo.purchaseQuantity}"
									pattern="#,###" /></td>
						</tr>
						
					</c:forEach>

				</table>
			</div>
		</div>

		<div id="memberInfoCon">
			<br /> <br />
			<div id="memberInfoId">

				<input class="memberInfoSample" type="text" disabled="disabled"
					value="받는 사람"><br /> <input id="nameId"
					class="memberInfoInput" type="text" placeholder="이름"
					name="recipient" value="${_memberVo_.name}"><br /> <input
					class="memberInfoSample" type="text" disabled="disabled" value="주소"><br />
				<input id="addressId" class="memberInfoInput" type="text"
					placeholder="주소" name="address" value="${_memberVo_.address}"><br />
				<input class="memberInfoSample" type="text" disabled="disabled"
					value="연락처"><br /> <input id="hpId" class="memberInfoInput"
					type="text" placeholder="연락처" value="${_memberVo_.hp}"><br />
				<input class="memberInfoSample" type="text" disabled="disabled"
					style="color: #6EE3F7;" value="요청사항"><br /> <input
					class="memberInfoInput" type="text" style="color: #6EE3F7;"
					name="requests" placeholder="요청사항"><br />
				<ins>
					<hr style="border: solid 1px #6EE3F7; margin-top: 1px;">
				</ins>
				<span>기본적인 배송 정보는 회원님의 정보를 기본으로 하고 있으나 <br />자유롭게 변경 가능하오니
					받으실 분의 정보를 입력해주시면 감사하겠습니다.
				</span>
			</div>

			<div style="height: 150px;">
				<br>
				<hr />
				<c:if test="${basketNo == null}">
				<input class="resultBt" type="button" value="뒤로가기"
					onclick="backFnc1();">
					</c:if> 
				<c:if test="${basketNo != null}">
				<input class="resultBt" type="button" value="뒤로가기"
					onclick="backFnc2();">
					</c:if> 
					<input
					class="resultBt" style="margin-left: 500px;" type="button"
					value="결제 완료" onclick="finshFnc();">
			</div>

		</div>
	</form>
	





	<jsp:include page="/WEB-INF/views/common/tail.jsp" />



</body>
</html>