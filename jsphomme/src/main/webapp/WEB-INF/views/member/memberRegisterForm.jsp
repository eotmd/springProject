<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

	#memberRegiBodyDiv{
		width: 1920px;
		height: 600px;
	}
	
	#memberRegiInfoContainer{
		width: 1250px;
		height:500px;
		margin: auto;
		margin-top: 30px;
		background-color: #F6F6F6;
		box-shadow:  7px 7px 20px -8px gray;
	}
	
	#memberRegiInfoDiv{
		width:1300px;
		height:320px;
		margin-left: 100px;
		font-weight: bold;		
	}
	
	.memberRegiInfo{
		font-weight: bold; 
		border: 0px; 
		background-color:#F6F6F6;
		color: #C3C3C3;
				
	}
	
	.memberRegiInput{
		border: 0px; 
		border-color: #747474;
		background-color:#F6F6F6;
		height: 35px;
		font-size: 16px;
		font-weight: 5px;
		margin-bottom: 5px;
		color: gray;
		width: 495px;
	}
	
	#hrDiv{
		margin-top: 80px;		
	}
	
	#memberRegisterBtn{
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
	
	#memberRegisterBtn:hover,  #moveToMainBtn:hover{
		color: #6EE3F7;
	}
	
	
	#moveToMainBtn{
		margin-left:180px;
		width: 270px; 
		height: 50px; 
		border: 0px; 
		background-color: #F6F6F6; 
		color: gray; 
		font-weight: bold; 
		font-size: 22px;
	}
	
		
	a {
		font-size: 14px;
	}
	
</style>

<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
   
</script>
<script type="text/javascript">

	window.onload = function name() {
		
	}

	function pageMoveMainFnc() {
		location.href = "../";
	}

// 포커스가 가도록

	function memberRegisterFnc() {

 		var nameObj = document.getElementById("name");
 		var idObj = document.getElementById("id");
 		var pwdObj = document.getElementById("password");
 		var addressObj = document.getElementById("address");
 		var hpObj = document.getElementById("hp");
 		var judgeNumberObj = document.getElementById("judgeNumber");
	
 		var pwdConfirmObj = document.getElementById("passwordConfirm");
		var memberRegiFormObj = document.getElementById("memberRegiForm");

 		if (nameObj.value == "" || nameObj.value == null)  {
 			alert("이름을 입력해주세요");
 			nameObj.focus();
 			return;
 		}
	
 		if (idObj.value == "" || idObj.value == null) {
 			alert("아이디를 다시 입력해세요");
 			idObj.focus();
 			return;
 		}
	
	
 		if (pwdObj.value == "" || pwdObj.value == null) {
 			alert("비민번호를 다시 입력해주세요")
 			pwdObj.focus();
 			return flase;
 		}
	

 		else if (pwdConfirmObj.value == "" || pwdConfirmObj.value == null) {
 			alert("비민번호 확인란을 다시 입력해주세요");
			pwdConfirmObj.focus();
 			return flase;
 		}
	
 		if (pwdObj.value != pwdConfirmObj.value) {
 			alert("비밀번호와 비밀번호 확인란에 입력하신 것이 다릅니다. 다시 입력해주세요")
 			pwdObj.focus();
 			return false;
 		}
	 
 		if (addressObj.value == "" || addressObj.value == null) {
 			alert("주소를 입력해세요");
 			addressObj.focus();
 			return;
 		}
 		if (hpObj.value == "" || hpObj.value == null) {
 			alert("연락처를 입력해세요");
 			hpObj.focus();
 			return;
 		}
 		if(hpObj.value ==/[a-z]/g){
 			alert("숫자만 입력해 주세요");
 			hpObj.focus();
 			return;
 		}
 		
 		if(judgeNumberObj.value == 1){
 			alert("아이디 중복체크를 해주세요");
 			return;
 		}
 		
			memberRegiFormObj.submit();
		
		
		
	}
	
	function overlapCheckFnc() {
		
		var idObj = document.getElementById("id");
		var nameObj = document.getElementById("name");
		var addressObj = document.getElementById("address");
		var hpObj = document.getElementById("hp");
		var hiddenFormObj = document.getElementById("hiddenForm");
		
		var str = "<input type='hidden' name='id' value="+idObj.value+">";
		str += "<input type='hidden' name='name' value="+nameObj.value+">";
		str += "<input type='hidden' name='address' value="+addressObj.value+">";
		str += "<input type='hidden' name='hp' value="+hpObj.value+">";
		
		
		
		if(idObj.value == ""){
			alert("아이디를 입력해 주세요");
			return;
		}
		
		hiddenFormObj.innerHTML = str;
		
		
		hiddenFormObj.submit();
		
	}
	
	 $(document).ready(function() {
	      $('#name').keydown(function() {
	         var nameObj = $('#name').val();
			 var failMsg = "이름을 입력해주세요";
	         var successMsg = "한글,영문 대소문자 가능/ 숫자,특수문자 사용불가 (공백없이 입력해주세요)";
			 
	         if (nameObj == "" || nameObj == null) {
	            $('#nameConfirmMsg').css('color', 'red');
		         $('#nameConfirmMsg').html(failMsg);
// 		         $('#name').focus();
	         }	else if (nameObj != "" && nameObj != null) {
	        	 $('#nameConfirmMsg').css('color', 'grey');
		         $('#nameConfirmMsg').html(successMsg);
	        	 
	         }
	      });
	   });

	 $(document).ready(function() {
	      $('#id').keydown(function() {
	        
			 var idObj = $('#id').val();
	         var failMsg = "아이디를 입력해주세요";
	         var successMsg = "숫자,영문 대소문자 가능/ 한글,특수문자 사용불가 (공백없이 입력해주세요)";
	         
	         if (idObj == "" || idObj == null) {
	            $('#idConfirmMsg').css('color', 'red');
		         $('#idConfirmMsg').html(failMsg);
	         }	else if (idObj != "" && idObj != null) {
	        	 $('#idConfirmMsg').css('color', 'grey');
		         $('#idConfirmMsg').html(successMsg);
	         }
	      });
	   });
	 
	 
	 $(document).ready(function() {
	      $('#password').keyup(function() {
	         var passwordObj = $('#password').val();
	         var passwordConfirmObj = $('#passwordConfirm').val();
	         
	         var successMsg1 = "비밀번호가 일치합니다.";
	         var successMsg2 = "비밀번호가 일치합니다.";
	         var failMsg1 = "비밀번호가 일치하지 않습니다. 비밀번호 입력칸을 다시 입력해주세요";
	         var failMsg2 = "비밀번호가 일치하지 않습니다. 비민번호 입력 확인칸을 다시 입력해주세요";
	        	 
	         if (passwordConfirmObj == passwordObj) {
	             $('#passwordConfirmMsg').css('color', 'grey');
		         $('#passwordConfirmMsg').html(successMsg1);
		         $('#passwordConfirmAgainMsg').css('color', 'grey');
		         $('#passwordConfirmAgainMsg').html(successMsg2);
	         } else if(passwordConfirmObj != passwordObj){
	             $('#passwordConfirmMsg').css('color', 'red');
		         $('#passwordConfirmMsg').html(failMsg1);
		         $('#passwordConfirmAgainMsg').css('color', 'red');
		         $('#passwordConfirmAgainMsg').html(failMsg2);
	         }
	      });
	   });	 
	 
	 
   $(document).ready(function() {
	      $('#passwordConfirm').keyup(function() {
	         var passwordObj = $('#password').val();
	         var passwordConfirmObj = $('#passwordConfirm').val();
	         
	         var successMsg1 = "비밀번호가 일치합니다.";
	         var successMsg2 = "비밀번호가 일치합니다.";
	         var failMsg1 = "비밀번호가 일치하지 않습니다. 비밀번호 입력칸을 다시 입력해주세요";
	         var failMsg2 = "비밀번호가 일치하지 않습니다. 비민번호 입력 확인칸을 다시 입력해주세요";
	        	 
	         if (passwordConfirmObj == passwordObj) {
	        	 $('#passwordConfirmMsg').css('color', 'grey');
		         $('#passwordConfirmMsg').html(successMsg1);
	             $('#passwordConfirmAgainMsg').css('color', 'grey');
		         $('#passwordConfirmAgainMsg').html(successMsg2);
	         } else if(passwordConfirmObj != passwordObj){
	        	 $('#passwordConfirmMsg').css('color', 'red');
		         $('#passwordConfirmMsg').html(failMsg1);
		         $('#passwordConfirmAgainMsg').css('color', 'red');
		         $('#passwordConfirmAgainMsg').html(failMsg2);
	         }
	      });
	   });
		
   $(document).ready(function() {
	      $('#address').change(function() {
	        
			 var addressObj = $('#address').val();
	         
	         var successMsg = "숫자,한글,영문 대소문자,특수문자,공백도 사용가능합니다.";
	         
	         	if (addressObj != "" && addressObj != null) {
	        	 $('#addressConfirmMsg').css('color', 'grey');
		         $('#addressConfirmMsg').html(successMsg);
	         }
	      });
	   });
   
		
   $(document).ready(function() {
	      $('#hp').keydown(function() {
	    	 
	    	  $('#hp').val($('#hp').val().replace(/[a-z]/g,""));
	    	 
	    	 var hpObj = $('#hp').val();
	         var failMsg = "(-) 제외 11 자리 숫자만 입력해주세요";
	        	 
	         if (hpObj == "" || hpObj == null) {
	            $('#hpConfirmMsg').css('color', 'grey');
		        $('#hpConfirmMsg').html(failMsg);
	         } else {
	        		 
	         }
	         
	      });
	   });
	
	
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">

<div id="memberRegiBodyDiv">

	<h1 style="text-align: center;">회원 가입</h1>

	<form action="./addCtr.do" method="post" id="memberRegiForm">

	<div id="memberRegiInfoContainer">
		<div id="memberRegiInfoDiv">
			<br>
			<br>
			<input class="memberRegiInfo" type="text" value="이름" disabled="disabled"><br/> 
			<input class="memberRegiInput" type="text" id="name"  name="name"
				placeholder="한글,영문 대소문자 가능(공백없이 입력해주세요)" value="${MemberVo.name}">
			<a id="nameConfirmMsg"></a><br/>
			
			
			<input class="memberRegiInfo" type="text" value="아이디" disabled="disabled"><br/>
			<input class="memberRegiInput" type="text" id="id" name="id"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)" style="width: 380px;" value="${MemberVo.id}">
			<input type="button" value="아이디 중복체크" onclick="overlapCheckFnc()" style=" background-color:#DBDBDB;  border-radius: 4px;font-weight: bold; ">
			
			<a id="idConfirmMsg"></a><br/> 
			
			<input class="memberRegiInfo" type="text" value="비밀번호" disabled="disabled"><br/>
			<input class="memberRegiInput" type="password" id="password" name="password"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)" >
			<a id="passwordConfirmMsg"></a><br/>
			
			<input class="memberRegiInfo" type="text" value="비밀번호 확인" disabled="disabled"><br/>
			<input class="memberRegiInput" type="password" id="passwordConfirm" name="passwordConfirm"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)">
			<a id="passwordConfirmAgainMsg"></a><br/>
			
			<input class="memberRegiInfo" type="text" value="주소" disabled="disabled"><br/>
			<input class="memberRegiInput" type="text" id="address" name="address"
				placeholder="숫자,한글,영문 대소문자,특수문자,공백도 사용가능합니다." value="${MemberVo.address}">
			<a id="addressConfirmMsg"></a><br/> 
			
			<input class="memberRegiInfo" type="text" value="연락처" disabled="disabled"><br/>
			<input class="memberRegiInput" type="text" id="hp" name="hp" maxlength="11"
				placeholder="( - ) 제외한  11자리 숫자만 입력해주세요" value="${MemberVo.hp}">
			<a id="hpConfirmMsg"></a>
	
			
		</div>
		
		<div id="hrDiv">
			<br/>
			<hr>
		</div>
		
		<input type="button" id="memberRegisterBtn" value="가입하기" onclick="memberRegisterFnc();"> 
		<input type="button" id="moveToMainBtn" value="메인화면" onclick="pageMoveMainFnc();">
		
	</div>
	
	</form>
	<form id="hiddenForm" action="/jsphomme/member/overlapCheck.do" method="post">
		
	</form> 
	<input type="hidden" id="judgeNumber" name="judgeNumber" value="${judgeNumber}">
</div>

	<jsp:include page="/WEB-INF/views/common/tail.jsp" />
	
	
	
	
</body>
</html>