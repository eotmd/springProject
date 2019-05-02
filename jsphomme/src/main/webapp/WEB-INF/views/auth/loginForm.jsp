<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	img {
		margin-left: 93px;
    	margin-right: 93px;
    	margin-top: 30px;
	}
	
	.loginContainerDiv{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
		width: 400px;
		margin-top: 80px;
		background-color: rgba(0, 0, 0, 0.1);
		color: white;
		padding: 30px;
		box-shadow: 0px 2px 8px 2px #555;
		border-radius: 6px;
		box-sizing: border-box;
	}

	.loginContainerDiv h2{
		text-align: center;
		padding: 10px 15px;
		letter-spacing: 1px;
	}
	
	
	#loginBoxDiv label{
		text-transform: uppercase;
		font-size: 12px;
		letter-spacing: 1px;
	}
	
	#memberId, #memberPassword, #loginBtn ,#memberRegiBtn {
		width: 100%;
		padding: 8px 12px;
		margin: 8px 0px;
		display: inline-block;
		box-sizing: border-box;
		color: white;
		background-color: transparent;
		border: 1px solid white;
	}
	
	#memberId:focus, #memberPassword:focus {
		outline: none;
	}
	
	#loginBtn, #memberRegiBtn {
		padding: 12px 20px;
		cursor: pointer;
		font-family: Abel;
		font-size: 14px;
		letter-spacing: 1px;
	}
	
	#loginBtn:hover, #memberRegiBtn:hover {
		background: rgba(0, 0, 0, 0.5);
	}
			
	
	
	
	
	#loginBodyDiv {
		width: 1920px;
		height: 900px;
	}
	
</style>

<title>로그인</title>


<script type="text/javascript">
	function loginFnc1() {
		if(event.keyCode == 13){
			var idObj = document.getElementById("memberId");
			var passwordObj = document.getElementById("memberPassword");
	
			if (idObj.value == null || idObj.value == "") {
				alert("아이디를 입력해 주세요");
				idObj.focus();
				
			}
	
			if (passwordObj.value == null || passwordObj.value == "") {
				alert("비밀번호를 입력해 주세요")
				passwordObj.focus();
				
			}
			
			var formObj = document.getElementById("loginForm")
			formObj.submit();		
		}	
	}
	function loginFnc2() {
		var idObj = document.getElementById("memberId");
		var passwordObj = document.getElementById("memberPassword");

		if (idObj.value == null || idObj.value == "") {
			alert("아이디를 입력해 주세요");
			idObj.focus();
			
		}

		if (passwordObj.value == null || passwordObj.value == "") {
			alert("비밀번호를 입력해 주세요")
			passwordObj.focus();
			
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


	<img alt="ConceptPhoto" src="../resources/images/conceptPhotoTomFord.jpg" width="1700px;" height="700px;">

	<div class="loginContainerDiv">		
		
		<h2>LOGIN FORM</h2>
		<div id="loginBoxDiv">
			<form action="loginCtr.do" id="loginForm" method="post">
				
				
					<label><b>ID</b></label>
					<input type="text" name="id" id="memberId" placeholder="ID"><br/>
					<label><b>Password</b></label>
					<input type="password" name='password' id="memberPassword" placeholder="Password" required="required"onkeypress="loginFnc1();"><br/>
									
						
					<input type="button" value="로그인" id="loginBtn" onclick="loginFnc2();">
					<br>
					<input type="button" value="회원가입" id="memberRegiBtn" onclick="myRegisterFnc();">
							
			</form>
		</div>
	</div>

</div>

<jsp:include page="/WEB-INF/views/common/tail.jsp" />

</body>
</html>