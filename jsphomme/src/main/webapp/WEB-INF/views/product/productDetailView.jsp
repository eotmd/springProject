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
	src="/springHome/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">



</script>

<style type="text/css">
	
	div {
		margin: auto;
	}

	li {
		list-style-type: none;
	
	.image {
		width: 500px;
		height: 440px;
		border: 1px solid black;
		background: yellow;
	}
	
}
</style>

</head>
<body>

	<jsp:include page="/headerAdminAfterLogin.jsp"></jsp:include>
	
	<h1>${productVo.name}</h1>
	<div>
		<nav>
			<ul>
				<li>
					<span class="image">
						사진
					</span>
				</li>
				<li>
					<span>
						${productVo.productNo}
					</span>
				</li>
				<li>
					<span>${productVo.name}</span>
				</li>
				<li>
					<span>${productVo.quantity}</span>
				</li>
				<li>
					<span>${productVo.price}</span>
				</li>
				<li>
					<span>${productVo.detail}</span>
				</li>
			</ul>
		</nav>
	</div>
	
	<jsp:include page="/tail.jsp"></jsp:include>
	
</body>
</html>