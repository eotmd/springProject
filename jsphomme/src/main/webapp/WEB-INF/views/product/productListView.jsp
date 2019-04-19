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
	
	.productList ul{
		float: left;
		width: 300px;
		margin: 50px;
	}
	
	li{
		list-style-type: none;
	}
	
	.productList ul li{
		text-align: center;
	}
	
	.productList img{
		width: 300px;
		height: 300px;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	<h1>상품 리스트</h1>
	<div class="productList">	
		<nav>
			<c:forEach var="productVo" items="${productList}">
				<ul>
					<li>
						<span>
							<a href='/jsphomme/product/detail.do?productNo=${productVo.productNo}'>
								<img alt="${productVo.name}" src="<c:url value='/img/${productVo.storedFileName}'/>"/>
							</a>
						</span>
					</li>
					<li>
						<a href="/jsphomme/product/detail.do?productNo=${productVo.productNo}">
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
		</nav>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	<form action="./list.do" id="pagingForm" method="get">
		<input type="hidden" id="curPage" name="curPage" 
			value="${pagingMap.paging.curPage}">
	</form>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>