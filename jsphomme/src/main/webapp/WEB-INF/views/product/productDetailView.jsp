<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productVo.name}</title>

<script type="text/javascript" 
	src="/jsphomme/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">

</script>

<style type="text/css">
	
	.detailView {
		margin: auto;
		width: 1200px;
		overflow: hidden;
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
	
	<h1>${productVo.name}</h1>
	<div class="detailView">
		
		<form action="">
			<span>
				<img alt="${productVo.name}" src="<c:url value='/img/${productVo.storedFileName}'/>"/>
			</span>
	
			<table class="explanation">
				<tr>
					<td style="width: 150px;">번호</td>
					<td>${productVo.productNo}</td>
				</tr>
				<tr>
					<td style="width: 150px;">상품명</td>
					<td>${productVo.name}</td>
				</tr>
				<tr>
					<td style="width: 150px;">가격</td>
					<td>${productVo.price}</td>
				</tr>
				<c:if test="${productVo.quantity > 0}">
					<tr>
						<td style="width: 150px;">사이즈</td>
						<td><select>
							<option>S</option>
							<option>M</option>
							<option>L</option>
							<option>XL</option>
							<option>XXL</option>
							<option>XXXL</option>
						</select></td>
					</tr>
					<tr>
						<td style="width: 150px;">수량</td>
							<td><input type="number" value="1" max="${productVo.quantity}" min="1"></td>
					</tr>
				</c:if>
				<c:if test="${productVo.quantity == 0}">
					<tr>			
						<td colspan="2">품절</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="2"><input type="submit" value="즉시 구매"></td>
				</tr>
	<%-- 			<c:if test="${_memberVo_.authority == '0'}"> --%>
	<!-- 				<tr> -->
	<!-- 					<td colspan="2"><input type="button" value="제품 삭제" onclick="deleteFnc();"></td> -->
	<!-- 				</tr> -->
	<%-- 			</c:if> --%>
			</table>
		</form>
		
		<div style="clear: both;">			
			${productVo.detail}
		</div>
		
	</div>
		
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>