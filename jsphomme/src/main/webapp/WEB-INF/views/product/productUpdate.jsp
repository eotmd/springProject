<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

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
	
	<h1>상품 등록</h1>
	<div class="detailView">
		<form action="./update.do" method="post" enctype="multipart/form-data">
			<span class="image">
				<input type="file" name="file">
			</span>
		
			<table class="explanation">
				<tr>
					<td style="width: 150px;">상품 이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td style="width: 150px;">가격</td>
					<td><input type="number" name="price"></td>
				</tr>
				<tr>
					<td style="width: 150px;">추가 물량</td>
					<td><input type="number" name="quantity"></td>
				</tr>
				<tr>
					<td style="width: 150px;"><input type="reset" value="취소"></td>
					<td><input type="submit" value="등록"></td>
				</tr>
			</table>
			<div style="clear: both;">			
				<textarea name="detail"></textarea>
			</div>
		</form>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>