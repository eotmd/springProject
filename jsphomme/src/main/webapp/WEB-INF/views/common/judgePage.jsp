<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	window.onload = function name() {
		var judgeNumberObj = document.getElementById("judgeNumber");
		var formIdObj = document.getElementById("formId");
		
		if(judgeNumberObj.value == 1){
			alert("이미 존재하는 아이디 입니다.");
		}else if(judgeNumberObj.value == 0){
			alert("사용할 수 있는 아이디 입니다.");
		
		}
		formIdObj.submit();
	}
	
	
	
</script>

</head>
<body>
<form id="formId" action="/jsphomme/member/add.do" method="post">
	<input type="hidden" name="judgeNumber" id="judgeNumber" value="${judgeNumber}" >
	<input type='hidden' name='id' value="${MemberVo.id}">";      
	<input type='hidden' name='name' value="${MemberVo.name}">";     
	<input type='hidden' name='address' value="${MemberVo.address}">"
	<input type='hidden' name='hp' value="${MemberVo.hp}">";         
</form>
</body>
</html>