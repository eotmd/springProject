<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>

<link rel = "stylesheet" type = "text/css" href = "/jsphomme/resources/css/buttonCss.css">

<script type="text/javascript" 
	src="/jsphomme/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">

function goBack() {
	location.href = "/jsphomme/product/detail.do?productNo=${productVo.productNo}";
}

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
	
	<h1>상품 등록</h1>
	<div class="detailView">
		<form action="./update.do" method="post" enctype="multipart/form-data">
			<span class="image">
				<input type="file" name="file">
			</span>
		
			<table class="explanation">
				<tr>
					<td style="width: 150px; font-weight: bold;">상품 이름</td>
					<td><input type="text" name="name" value="${productVo.name}"></td>
				</tr>
				<tr>
					<td style="width: 150px; font-weight: bold;">가격</td>
					<td><input type="number" name="price" value="${productVo.price}"></td>
				</tr>
				<tr>
					<td style="width: 150px; font-weight: bold;">추가 물량 (현재 물량에 추가될 갯수를 적으면 됩니다.
						<br>현재: ${productVo.quantity} 개)</td>
					<td><input type="number" name="quantity" value="0"></td>
				</tr>
				<tr>
					<td style="width: 150px;"><input type="reset" value="취소"
						class="goUpdateBtn"></td>
					<td><input type="submit" value="수정 완료"
						class="goBuyBtn"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="뒤로가기" 
						class="goBackBtn" onclick="goBack();"></td>
				</tr>
			</table>
			<div style="clear: both;">	
				<textarea name="detail">${productVo.detail}</textarea>
			</div>
			<input type="hidden" name="productNo" value="${productVo.productNo}">
		</form>                                                                                                            
		
	</div>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>