<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	
</style>


<script type="text/javascript">
	function pageMoveMainFnc() {
		location.href = "/jsphomme/product/list.do";
	}

	function memberRegisterFnc() {

		var nameObj = document.getElementsByName("name");
		var idObj = document.getElementsByName("id");
		var pwdObj = document.getElementsByName("password");
		
		var pwdConfirmObj = document.getElementsByName("passwordConfirm");
		var memberRegiFormObj = document.getElementById("memberRegiForm");

		if (nameObj.value ="" || nameObj.value == null) {
			
			alert("이름을 입력해주세요");
			nameObj.focus();
// 			return false;
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
	<h1>회원 가입</h1>

	<form action="./addCtr.do" method="post" id="memberRegiForm">

		이름: <input type="text" name='name'><br> 
		아이디: <input type="text" name="id"><br> 
		비밀번호: <input type="password" name="password"><br> 
		비밀번호 확인: <input type="password" name="passwordConfirm"><br> 
		주소: <input type="text" name="address"><br> 
		연락처: <input type="number" name="hp"><br>

		<input type="button" id="memberRegister" value="가입하기" onclick="memberRegisterFnc();"> 
		<input type="button" value="메인화면으로 이동" onclick="pageMoveMainFnc();">
	</form>

	<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>