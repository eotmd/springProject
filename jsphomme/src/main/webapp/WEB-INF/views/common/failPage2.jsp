<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	alert('비밀번호가 틀렸습니다.');
	
	location.href = '/jsphomme/member/detail.do?memberNo='+${_memberVo_.memberNo};
</script>

</head>
<body>
	
</body>
</html>