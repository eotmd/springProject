<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	#memberRegiBodyDiv{
		width: 1920px;
		height: 600px;
	}
	
	#memberRegiInfoContainer{
		width: 1550px;
		height:500px;
		margin: auto;
		margin-top: 30px;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
	}
	
	#memberRegiInfoDiv{
		width:1300px;
		height:320px;
		margin-left: 100px;
		font-weight: bold;		
	}
	
	#memberRegiInfo{
		font-weight: bold; 
		border: 0px; 
		background-color:#F6F6F6;
		color: #C3C3C3;
	}
	
	#memberRegiInput{
		border: 0px; 
		background-color:#F6F6F6;
		height: 25px;
		font-size: 18px;
		font-weight: 5px;
		margin-bottom: 5px;
		color: gray;
		width: 900px;
	}
	
	
</style>


<script type="text/javascript">
	function pageMoveMainFnc() {
		location.href = "/jsphomme/product/list.do";
	}

	function memberRegisterFnc() {

		var nameObj = document.getElementById("name");
		var idObj = document.getElementById("id");
		var pwdObj = document.getElementById("password");
		
		var pwdConfirmObj = document.getElementById("passwordConfirm");
		var memberRegiFormObj = document.getElementById("memberRegiForm");

		if (nameObj.value ="")  {
			
			alert("이름을 입력해주세요");
			nameObj.focus();
// 			return;
		}
		
		else if (idObj.value="" || idObj.value == null) {
			alert("아이디를 다시 입력해세요");
			idObj.fucous();
// 			ruturn false;
		}
		
		
		else if (pwdObj.value ="" || pwdObj.value == null) {
			alert("비민번호를 다시 입력해주세요")
			pwdObj.focus();
// 			return flase;
		}
		

		else if (pwdConfirmObj.value ="" || pwdConfirmObj.value == null) {
			alert("비민번호 확인란을 다시 입력해주세요");
// 			return flase;
		}
		
		else if (pwdObj.value != pwdConfirmObj.value) {
			alert("비밀번호와 비밀번호 확인란에 입력하신 것이 다릅니다. 다시 입력해주세요")
			pwdObj.focus();
// 			return false;
		}
		
		else {
			memberRegiFormObj.submit();
		}
		
		
	}
	
	
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<div id="memberRegiBodyDiv">

	<h1>회원 가입</h1>

	<form action="./addCtr.do" method="post" id="memberRegiForm">

	<div id="memberRegiInfoContainer">
		<div id="memberRegiInfoDiv">
			<input class="memberRegiInfo" type="text" value="이름" disabled="disabled"> 
			<input class="memberRegiInput" type="text" id="name" name='name'><br> 
			
			<input class="memberRegiInfo" type="text" value="아이디" disabled="disabled">
			<input class="memberRegiInput" type="text" id="id" name="id"><br> 
			
			<input class="memberRegiInfo" type="text" value="비밀번호" disabled="disabled">
			<input class="memberRegiInput" type="password" id="password" name="password"><br> 
			
			<input class="memberRegiInfo" type="text" value="비밀번호 확인" disabled="disabled">
			<input class="memberRegiInput" type="password" id="passwordConfirm" name="passwordConfirm"><br> 
			
			<input class="memberRegiInfo" type="text" value="주소" disabled="disabled">
			<input class="memberRegiInput" type="text" id="address" name="address"><br> 
			
			<input class="memberRegiInfo" type="text" value="연락처" disabled="disabled">
			<input class="memberRegiInput" type="number" id="hp" name="hp"><br>
	
			<input type="button" id="memberRegister" value="가입하기" onclick="memberRegisterFnc();"> 
			<input type="button" value="메인화면으로 이동" onclick="pageMoveMainFnc();">
		
		</div>
		
		<div style="height: 100px;">
			<br/>
			<hr>
		</div>
	</div>
	
	</form>


</div>

	<jsp:include page="/WEB-INF/views/common/tail.jsp" />
	
	
	
	
</body>
</html>