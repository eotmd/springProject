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

function goInsert() {
	
	var fileObj = document.getElementById("file");
	var nameObj = document.getElementById("name");
	var priceObj = document.getElementById("price");
	var quantityObj = document.getElementById("quantity");
	var formTagObj = document.getElementById("formTag");
	
	if (fileObj.value == "") {
		alert("파일을 추가해주세요!");
		return false;
	}
	
	if (nameObj.value == "") {
		alert("상품 이름을 입력해주세요!");
		return false;
	}
	
	if (priceObj.value == "") {
		alert("가격을 입력해주세요!");
		return false;
	}
	
	if (quantityObj.value == "") {
		alert("입고 물량을 입력해주세요!");
		return false;
	}
	
	formTagObj.submit();
}

function goBack() {
	location.href = "/jsphomme/product/list.do"
}

</script>


<link rel = "stylesheet" type = "text/css" href = "/jsphomme/resources/css/buttonCss.css">
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
	
	.explanation > td{
		width: 150px;
	}
	
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	<div class="detailView">
		<form action="./insert.do" id="formTag" method="post" enctype="multipart/form-data">
			<table class="explanation">
				<tr>
					<td colspan="2"><input type="file" id="file" name="file"></td>
				</tr>
				<tr>
					<td>상품 이름</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" id="price" name="price"></td>
				</tr>
				<tr>
					<td>입고 물량</td>
					<td><input type="number" id="quantity" name="quantity"></td>
				</tr>
				<tr>
					<td><input type="reset" value="리셋" class="goUpdateBtn"></td>
					<td><input type="button" value="등록" onclick="goInsert();" class="goBuyBtn"></td>
				</tr>
			</table>
			<div style="clear: both;">			
			<input type="button" value="뒤로가기" onclick="goBack();" class="goBackBtn">
				<textarea name="detail"></textarea>
			</div>
		</form>
		
		
	</div>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>