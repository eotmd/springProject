<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function pageMoveMainFnc() {
		location.href = "";
	}

</script>
<title>회원 가입</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />
	<h1>회원 가입</h1>

	<form action="./addCtr.do" method="post">
		
		이름: <input type="text" name='name' id='memberName'><br>
		아이디: <input type="text" name="id" ><br>
		비밀번호:	<input type="password" name="password" ><br>
		주소: <input type="text" name="address" ><br>
		연락처: <input type="number" name="hp" ><br>
		
		<input type="submit" value="가입하기">
		<input type="button" value="메인화면으로 이동" 
				onclick="pageMoveMainFnc();">
	</form>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>