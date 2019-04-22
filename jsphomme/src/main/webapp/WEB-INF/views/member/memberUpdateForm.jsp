<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 수정</title>
<script type="text/javascript">
	


	function pageMoveBeforeFnc(memberNo){
		
		var url = 'detail.do?memberNo=' + memberNo;
		location.href = url;	
		
	}
</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />
	
	<h1>회원 정보 수정페이지</h1>
	
	<form action="./updateCtr.do" method="post">
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
			<input type="hidden" name="status" value="${memberVo.status}">
			<input type="hidden" name="authority" value="${memberVo.authority}">
			
		이름: <input type="text" name='name' id='memberName' value='${memberVo.name}'><br>
		아이디: <input type="text" name="id" value="${memberVo.id}" readonly="readonly"><br>
		비밀번호:	<input type="password" name="password" value="${memberVo.password}"><br>
		주소: <input type="text" name="address" value="${memberVo.address}"><br>
		연락처: <input type="number" name="hp" value="${memberVo.hp}"><br>
		
		
		
		<input type="button" value="이전페이지" 
				onclick="pageMoveBeforeFnc(${memberVo.memberNo});">
		<input type="submit" value="수정완료">

	</form>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />	
	
</body>
</html>