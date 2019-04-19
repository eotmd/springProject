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
		<span>
			<img alt="${productVo.name}" src="<c:url value='/img/${productVo.storedFileName}'/>"/>
		</span>

<!-- 		<nav class="detail"> -->
<!-- 			<ul> -->
<!-- 				<li> -->
<!-- 					<span></span> -->
<!-- 					<span> -->
<%-- 						${productVo.productNo} --%>
<!-- 					</span> -->
<!-- 				</li> -->
<!-- 				<li> -->
<%-- 					<span>${productVo.name}</span> --%>
<!-- 				</li> -->
<!-- 				<li> -->
<%-- 					<span>${productVo.quantity}</span> --%>
<!-- 				</li> -->
<!-- 				<li> -->
<%-- 					<span>${productVo.price}</span> --%>
<!-- 				</li> -->
<!-- 				<li> -->
<%-- 					<span>${productVo.detail}</span> --%>
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->
		
		
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
				<c:if test="${productVo.quantity > 0}">
					<td><input type="number" max="${productVo.quantity}"></td>
				</c:if>
				<c:if test="${productVo.quantity == 0}">
					<td>품절</td>
				</c:if>
			</tr>
		</table>
		<div style="clear: both;">			
			<textarea></textarea>
		</div>
		
	</div>
		
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>