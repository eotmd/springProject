<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script type="text/javascript">

	function pageMoveListFnc(){
		location.href = "list.do";
	}
</script>

</head>
<body>
	
	<h1>회원 정보 상세페이지</h1>
	
	<form action="./update.do" method="get">
			<input type="hidden" name='no' value='${memberVo.no}'>
		이름: <input type="text" name='name' id='memberName' value='${memberVo.name}' 
				readonly="readonly"><br>
		아이디: <input type="text" name="id" value="${memberVo.id}"
				readonly="readonly"><br>
		비밀번호:	<input type="password" name="password" value="${memberVo.password}"
				readonly="readonly"><br>
		주소: <input type="text" name="adress" value="${memberVo.adress}"
			readonly="readonly"><br>
		연락처: <input type="number" name="hp" value="${memberVo.hp}"
			readonly="readonly"><br>
		
		<input type="submit" value="수정하기">
		<input type="button" value="이전페이지" 
				onclick="pageMoveListFnc();">

	</form>
</body>
</html>