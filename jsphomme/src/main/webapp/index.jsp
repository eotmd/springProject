<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome JSP HOMME</title>
<script type="text/javascript">
	function loginMoveFnc(){
		var formObj = document.getElementById('indexForm');
		
		formObj.submit();
	}
	
</script>

</head>
<body>
	
<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />
	
	<form action="auth/login.do"id='indexForm' method="get">
		<input type="button"  
			value="JSP HOMME 로그인 화면으로 이동" onclick="loginMoveFnc();">
	
	</form>

<jsp:include page="/WEB-INF/views/common/tail.jsp" />

</body>
</html>