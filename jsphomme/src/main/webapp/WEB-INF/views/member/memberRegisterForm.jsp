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

	<h1>회원 가입</h1>

	<form action="./addCtr.do" method="post" 
		enctype="multipart/form-data">
		
		이름: <input type="text" name='name' id='memberName'><br>
		아이디: <input type="text" name="id" value="${memberVo.id}"><br>
		비밀번호:	<input type="password" name="password" ><br>
		주소: <input type="text" name="address" ><br>
		연락처: <input type="number" name="hp" ><br>
		
		<input type="submit" value="가입하기">
		<input type="button" value="메인화면으로 이동" 
				onclick="pageMoveMainFnc();">
	</form>
</body>
</html>