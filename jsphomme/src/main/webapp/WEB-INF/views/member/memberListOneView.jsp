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

#memberListOneBodyDiv{
	width: 1920px;
	height: 620px;
}

#memberInfoContainer{
		width: 1250px;
		height:450px;
		margin: auto;
		margin-top: 30px;
		margin-bottom: 30px;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
}

#memberInfoDiv{
		width:1300px;
		height:300px;
		margin-left: 200px;
		font-weight: bold;	
	    padding-top: 62px;
}

.memberInfo {
		font-weight: bold; 
		border: 0px; 
		background-color:#F6F6F6;
		color: #C3C3C3;
}

.memberInput {
		border: 0px; 
		border-color: #747474;
		background-color:#F6F6F6;
		height: 35px;
		font-size: 16px;
		font-weight: 5px;
		margin-bottom: 5px;
		color: gray;
		width: 600px;
}


	
#moveMainPageBtn:hover, #memberLeaveBtn:hover, #modifyBtn:hover, #backBtn:hover {
		color: #6EE3F7;
}

#moveMainPageBtn{
	    margin-left: 70px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
}

#memberLeaveBtn{
    	margin-left: 150px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
}

#modifyBtn {
		margin-left: 150px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
}
#backBtn{
	margin-left: 310px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
}
h1{
	text-align: center;
}
</style>
<title>마이페이지 보기</title>
<script type="text/javascript">
	

	function MoveMainPageFnc(){
		location.href = "/jsphomme";
	}
	
	function leaveFnc(no) {
		
		var confirmVal = confirm("회원 탈퇴하시겠습니까?")
		
		if(confirmVal == true){
			location.href = "./leaveCtr.do?memberNo=" + no;
			
		}else{
			return;
		}
		
	}
	function MoveCertificationFnc() {
		location.href = "/jsphomme/member/certificationMove.do"
	}
	function backFnc() {
		location.href = "/jsphomme/member/list.do"
	}
</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />	

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">
	
<div id="memberListOneBodyDiv">	
	
	<h1>회원 정보 상세페이지</h1>
	
	<form action="./update.do" method="get">
			
	<div id="memberInfoContainer"<c:if test="${_memberVo_.authority == '0'}">style="height: 530px;"</c:if>>
		
		<div id="memberInfoDiv" <c:if test="${_memberVo_.authority == '0'}">style="padding-top: 32px; padding-bottom: 32px;"</c:if>>	
			
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
			
			<input class="memberInfo" type="text" value="이름" disabled="disabled"><br/>
			<input class="memberInput" type="text" name='name' id='name' value='${memberVo.name}' disabled="disabled" ><br>
		
			<input class="memberInfo" type="text" value="아이디" disabled="disabled"><br/>
			<input class="memberInput" type="text" name="id" value="${memberVo.id}" disabled="disabled"><br>
		<c:if test="${_memberVo_.authority == '0'}">
			<input class="memberInfo" type="text" value="비밀번호" disabled="disabled"><br/>
			<input class="memberInput" type="text" name="password" value="${memberVo.password}" disabled="disabled"><br>
		</c:if>
		<c:if test="${_memberVo_.authority == '0'}">
			<input class="memberInfo" type="text" value="권한" disabled="disabled"><br/>
			<input class="memberInput" type="text" name="authority" value="${memberVo.authority}" disabled="disabled"><br>
		</c:if>
			<input class="memberInfo" type="text" value="주소" disabled="disabled"><br/>
			<input class="memberInput" type="text" name="address" value="${memberVo.address}" disabled="disabled"><br>
		
			<input class="memberInfo" type="text" value="연락처" disabled="disabled"><br/>
			<input class="memberInput" type="text" name="hp" value="${memberVo.hp}" disabled="disabled"><br>
			
			
		
		</div>
		
		
		<div id="hrDiv" <c:if test="${_memberVo_.authority == '0'}">style="margin-top: 90px;"</c:if>>
			
			<hr>
		</div>
			<input type="button" value="메인페이지" id="moveMainPageBtn" <c:if test="${_memberVo_.authority == '0'}">style="margin-left: 180px;"</c:if>onclick="MoveMainPageFnc();">
			<c:if test="${_memberVo_.authority != '0'}">
				<input type="button" value="탈퇴하기" id="memberLeaveBtn" onclick="leaveFnc('${memberVo.memberNo}');">
				<input type="button" value="수정하기" id="modifyBtn" onclick="MoveCertificationFnc()">
			</c:if>
			<c:if test="${_memberVo_.authority == '0'}">
				<input type="button" value="회원목록" id="backBtn" onclick="backFnc();">
			</c:if>
	</div>

	</form>

</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>