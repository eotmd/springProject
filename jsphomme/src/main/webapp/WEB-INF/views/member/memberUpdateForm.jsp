<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
img {
		width: 1700px;
		height: 300px;
	    margin-left: 93px;
    	margin-right: 93px;
	}


	#memberUpdateBodyDiv{
		width: 1920px;
		height: 620px;
	}
	
#memberInfoContainer{
		width: 1250px;
		height:500px;
		margin: auto;
		margin-top: 30px;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
}

#memberInfoDiv{
		width:1300px;
		height:320px;
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


#previousPageBtn:hover, #modifyBtn:hover {
		color: #6EE3F7;
}

#previousPageBtn{
	    margin-left:150px; 
		margin-right: 230px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
}

#modifyBtn {
		margin-left:180px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
}
</style>
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

<img alt="ConceptPhoto" src="../resources/images/conceptPhotoCutTomFord.jpg">

<div id="memberUpdateBodyDiv">
	
	<h1 style="text-align: center;">회원 정보 수정페이지</h1>
	
	<form action="./updateCtr.do" method="post">
			
	<div id="memberInfoContainer">	
		
		<div id="memberInfoDiv">
			
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
			<input type="hidden" name="status" value="${memberVo.status}">
			<input type="hidden" name="authority" value="${memberVo.authority}">
			
			<input class="memberInfo" type="text" value="이름" disabled="disabled"><br/>
			<input class="memberInput" type="text" name='name' id='name' value='${memberVo.name}'><br>
		
			<input class="memberInfo" type="text" value="아이디" disabled="disabled"><br/>
			<input  class="memberInput" type="text" name="id" value="${memberVo.id}" readonly="readonly"><br>
		
			<input class="memberInfo" type="text" value="비밀번호" disabled="disabled"><br/>
			<input  class="memberInput" type="password" name="password" value="${memberVo.password}"><br>
	
			<input class="memberInfo" type="text" value="주소" disabled="disabled"><br/>
			<input class="memberInput" type="text" name="address" value="${memberVo.address}"><br>
			
			<input class="memberInfo" type="text" value="연락처" disabled="disabled"><br/>
			<input  class="memberInput" type="number" name="hp" value="${memberVo.hp}"><br>
		
		</div>
		
		<div id="hrDiv">
			<br/>
			<hr>
		</div>
			
			<input type="button" value="이전페이지" id="previousPageBtn" onclick="pageMoveBeforeFnc(${memberVo.memberNo});">
			<input type="submit" value="수정완료" id="modifyBtn">
	</div>
	</form>

</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />	
	
</body>
</html>