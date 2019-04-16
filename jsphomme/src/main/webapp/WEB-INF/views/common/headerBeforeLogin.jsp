<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function loginFnc() {
		location.href = "login.do";
	}

	
	function registerFnc() {
		location.href = "add.do"
	}
</script>
<title>JSP Homme</title>
</head>
<body>

<div>
	<div>
		<input type="button" value="JSP Homme">
		<input type="button" value="로그인" onclick="loginFnc()">
		<input type="button" value="회원가입" onclick="registerFnc()">
		<input type="button" value="구매목록">
		
		
		
	
	</div>
	
</div>	
</body>
</html>