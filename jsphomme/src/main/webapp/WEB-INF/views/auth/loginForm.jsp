<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#loginDiv {
		
	}
	
	#loginH2 {
		text-align: center;
	}
	
	#loginTable {
		width: 400px;
		margin: auto;
		text-align: center;
	}
	
	tr {
		height: 30px;
	}
	
	
	#loginBtn {
		width: 200px;
		margin: auto;
	}
	
	#memberRegiBtn{
		width: 200px;
		margin: auto;
	}
</style>

<title>로그인</title>

<!-- 아이디 validation 체크 어떻게 할꺼야? -->
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
<body>
<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

	<h2 id="loginH2">사용자 로그인</h2>
	<div id="loginDiv">
		<form action="loginCtr.do" id="loginForm" method="post">
			<table id="loginTable">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="memberId"></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name='password' id="memberPassword"></td>
				</tr>
				<tr>
					<td colspan="2"> 
						<input type="button" value="로그인" id="loginBtn" onclick="loginFnc();">
					</td>
				</tr>
				
				<tr>	
					<td colspan="2">
						<input type="button" value="회원가입" id="memberRegiBtn" onclick="myRegisterFnc();">
					</td>
				</tr>
			</table>
		</form>
	</div>

<jsp:include page="/WEB-INF/views/common/tail.jsp" />

</body>
</html>