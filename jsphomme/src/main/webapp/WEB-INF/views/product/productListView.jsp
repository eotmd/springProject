<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>

<script type="text/javascript">



</script>

<style type="text/css">
	
	* {
		margin: 0;
		padding: 0;
	}
	
	.productList{
		overflow: hidden;
		margin: auto;
		width: 1200px;
	}
	
	nav {
		
	}
	
	ul{
		float: left;
		width: 300px;
		margin: 50px;
	}
	
	li{
		list-style-type: none;
	}
	
	ul li{
		text-align: center;
	}
	
	img{
		width: 300px;
		height: 300px;
	}
	
</style>

</head>
<body>

	<jsp:include page="/headerAdminAfterLogin.jsp"></jsp:include>
	
	<h1>상품 리스트</h1>
	<div class="productList">	
		<nav>
			<c:forEach var="productVo" items="${productList}">
				<ul>
					<li>
						<span>
							<a href='/jsphomme/product/detail.do?productNo=${productVo.productNo}'>
								<img alt="미남" src="/jsphomme/resources/images/1400716.png">
							</a>
						</span>
					</li>
					<li>
						<a href="#">
							<span>${productVo.name}</span>
						</a>
					</li>
					
					<%-- <li>
						<span>${productVo.quantity}</span>
					</li>
					<li>
						<span>${productVo.price}</span>
					</li> --%>
				</ul>
			</c:forEach>
				<ul>
					<li>
						<span>
							<img alt="뽀글" src="/jsphomme/resources/images/2114068.png">
						</span>
					</li>
					<li><span>david luiz</span></li>
				</ul>
				<ul>
					<li>
						<span>
							<img alt="민호우" src="/jsphomme/resources/images/19068857.png">
						</span>
					</li>
					<li><span>roberto firmino</span></li>
				</ul>
			
			
			
		</nav>
	</div>
	
	<jsp:include page="/tail.jsp"></jsp:include>
	
</body>
</html>