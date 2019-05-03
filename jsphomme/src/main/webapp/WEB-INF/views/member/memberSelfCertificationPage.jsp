<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
img {
		width: 1698px;
		height: 380px;
	    margin-left: 94px;
    	margin-right: 94px;
	}

#memberSelfCertificatioBodyDiv{
	width: 1920px;
	height: 620px;
}


</style>
<title>마이페이지 보기</title>
<script type="text/javascript">
	

	function MoveMainPageFnc(){
		location.href = "../";
	}
	
	function leaveFnc(no) {
		
		var confirmVal = confirm("회원 탈퇴하시겠습니까?")
		
		if(confirmVal == true){
			location.href = "./leaveCtr.do?memberNo=" + no;
			
		}else{
			return;
		}
		
	}
	
</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />	

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">
	
<div id="memberSelfCertificatioBodyDiv">	
	
	
	<form action="./update.do" method="get">
			
	
		
		
		

	</form>

</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>