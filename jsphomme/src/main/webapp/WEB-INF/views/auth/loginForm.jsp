<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	img {
		margin: auto;
	}

	#loginBoxDiv {
		width: 550px;
		height: 350px;
		margin: auto;
		background-color: #EBF7FF;
	}
			
	#loginRegiDiv {
	
		
	}
	
	#loginForm{
		width: 400px;
		height: 400px;
/* 		margin-top: 50px; */
/* 		margin-left: 20px; */
/* 		margin-right: 20px; */
/* 		margin-bottom: 20px; */
		padding: 20px;
		background-color: #F6F6F6;
		
		box-shadow:  7px 7px 10px -8px gray;
	}
	
	#loginBtn {
		width: 200px;
		margin: auto;
	}
	
	#memberRegiBtn{
		width: 200px;
		margin: auto;
	}
	
	#loginBodyDiv {
		width: 1920px;
		height: 2010px;
	}
	
</style>

<title>로그인</title>


<script type="text/javascript">
	function loginFnc() {
		var idObj = document.getElementById("memberId");
		var passwordObj = document.getElementById("memberPassword");

		if (idObj.value == null || idObj.value == "") {
			alert("아이디를 입력해 주세요");
			idObj.focus();
			return false;
		}

		if (passwordObj.value == null || passwordObj.value == "") {
			alert("비밀번호를 입력해 주세요")
			passwordObj.focus();
			return false;
		}
		
		var formObj = document.getElementById("loginForm")
		formObj.submit();		
			
	}
	
	
	function myRegisterFnc() {
		location.href = "../member/add.do";
	}
</script>
</head>
<body >
<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<div id="loginBodyDiv">


	<img alt="ConceptPhoto" src="../resources/images/conceptPhoto.jpg" >

	
	<div id="loginBoxDiv">
		<form action="loginCtr.do" id="loginForm" method="post">
			
			
			
				<input type="text" name="id" id="memberId" placeholder="id"></br>
				
				<input type="password" name='password' id="memberPassword" placeholder="password"></br>
								
					
		<div id="loginRegiDiv">			
						<input type="button" value="로그인" id="loginBtn" onclick="loginFnc();">
						<br><br>
						<input type="button" value="회원가입" id="memberRegiBtn" onclick="myRegisterFnc();">
		</div>					
		</form>
	</div>


</div>

<jsp:include page="/WEB-INF/views/common/tail.jsp" />

</body>
</html>