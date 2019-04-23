<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#memberListOneBodyDiv{
	width: 1920px;
	height: 620px;
}

</style>
<title>마이페이지 보기</title>
<script type="text/javascript">
	window.onload = function(){
		var memberNameInputObj = 
			document.getElementById('memberName');
		
		memberNameInputObj.style.backgroundColor = '#E7E7E7';
	}



	function pageMoveListFnc(){
		location.href = "list.do";
	}
	
	function leaveFnc() {
		location.href = "./leaveCtr.do?memberNo=" + ${memberVo.memberNo};
	}
	
</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />	
	
<div id="memberListOneBodyDiv">	
	
	<h1>회원 정보 상세페이지</h1>
	
	<form action="./update.do" method="get">
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
		이름: <input type="text" name='name' id='memberName' value='${memberVo.name}' 
				readonly="readonly"><br>
		아이디: <input type="text" name="id" value="${memberVo.id}"
				readonly="readonly"><br>
		비밀번호:	<input type="password" name="password" value="${memberVo.password}"
				readonly="readonly"><br>
		주소: <input type="text" name="address" value="${memberVo.address}"
			readonly="readonly"><br>
		연락처: <input type="number" name="hp" value="${memberVo.hp}"
			readonly="readonly"><br>
		
		
		<input type="button" value="이전페이지" onclick="pageMoveListFnc();">
		<input type="button" value="탈퇴하기" onclick="leaveFnc(${memberVo.memberNo});">
		<input type="submit" value="수정하기" >


	</form>

</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>