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
	
 	#mainImg { 
 		width: 1698px;
      	height: 400px;
       	margin-left: 94px;
       	margin-right: 94px;
 	} 
	.productList{
		overflow: hidden;
		margin-top:50px;
		width: 1698px;
		margin-left: 93px; 
     	margin-right: 93px; 
	}
	
	
	.productList ul{
		float: left;
		width: 450px;
		margin-right: 174px;
		margin-bottom: 50px;
		
	}
	
	li{
		list-style-type: none;
	}
	
	.productList ul li{
		text-align: center;
	}
	
	.productList img{
		width: 450px;
		height: 450px;
		border-radius: 10px;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	<img id="mainImg" alt="ConceptPhoto" src="../resources/images/conceptPhotoCutTomFord.jpg">
	<div class="productList">	
		<nav>
			<c:forEach var="productVo" items="${productList}" varStatus="i">
				<c:choose>
					<c:when test="${i.count % 3 == 0}">
						<ul style="margin-right: 0px;">
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
						</ul>
					</c:when>
					<c:otherwise>
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
						</ul>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</nav>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	<form action="./list.do" id="pagingForm" method="get">
		<input type="hidden" id="curPage" name="curPage" 
			value="${pagingMap.paging.curPage}">
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>