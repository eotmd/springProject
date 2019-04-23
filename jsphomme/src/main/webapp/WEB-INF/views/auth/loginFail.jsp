<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="2;url=${pageContext.request.contextPath}/auth/login.do">
<style type="text/css">
	#loginFailBodyDiv{
		width: 1920px;
		height: 620px;
	}
</style>

<title>로그인 실패</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<div id="loginFailBodyDiv">

	<p>
		로그인 실패입니다. 이메일 또는 암호가 맞지 않습니다.!
		<br>
		잠시 후에 다시 로그인 화면으로 이동합니다.
	</p>


</div>

<jsp:include page="/WEB-INF/views/common/tail.jsp" />

</body>
</html>