<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>마이페이지 보기</title>

<style type="text/css">
img {
		width: 1698px;
		height: 380px;
	    margin-left: 94px;
    	margin-right: 94px;
	}

#memberSelfCertificationBodyDiv{
	width: 1920px;
	height: 620px;
}

#certificationForm{
	display:inline-block; 
	margin-top: 200px; 
	background-color: #F6F6F6;
	
}
#certificationIn{
	width:600px;
	height: 50px;
	font-size: 20px;
	margin-left: 25px;
	margin-right: 25px;
	margin-bottom: 35px;
	margin-top: 35px;
}
#certificationSb{
	border: 0px;
	width: 100px;
	height: 30px;
	font-size: 17px;
	border-radius: 4px;
	background-color: #B2EBF4;
}
#certificationSb:hover {
	font-weight: bold;
	background-color: #B2EBF4;
	box-shadow: 0px 0px 1px 1px #BCEBF4;
}
</style>

<script type="text/javascript">
	function MoveFnc() {
		var certificationFormObj = document.getElementById("certificationForm");
		
		certificationFormObj.submit();
	}
</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />	

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">
	
<div id="memberSelfCertificationBodyDiv">	
	
	
		<div style="height: 600px; width:1698px; margin-left: 94px; text-align: center;">
			<form id="certificationForm" action="/jsphomme/member/certificationCtr.do" method="post">
				<input id="certificationIn" type="password" name="password" placeholder="비밀번호 확인">
			
			</form>
				<p><input id="certificationSb" type="button" value="확인" onclick="MoveFnc();"></p>
		</div>

</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>