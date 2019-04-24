<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

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
		width: 600px;
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
	
	#memberRegisterBtn:hover {
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
	
	#moveToMainBtn:hover {
		color: #6EE3F7;
	}	
	
	a {
		font-size: 14px;
	}
	
</style>

<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
   
</script>
<script type="text/javascript">

// 포커스가 가도록

	function memberRegisterFnc() {

 		var nameObj = document.getElementById("name");
 		var idObj = document.getElementById("id");
 		var pwdObj = document.getElementById("password");
	
 		var pwdConfirmObj = document.getElementById("passwordConfirm");
	var memberRegiFormObj = document.getElementById("memberRegiForm");

 		if (nameObj.value == "" || nameObj.value == null)  {
//  			alert("이름을 입력해주세요");
 			nameObj.focus();
 // 			return;
 		}
	
 		else if (idObj.value == "" || idObj.value == null) {
//  			alert("아이디를 다시 입력해세요");
 			idObj.fucous();
 // 			ruturn false;
 		}
	
	
 		else if (pwdObj.value == "" || pwdObj.value == null) {
//  			alert("비민번호를 다시 입력해주세요")
 			pwdObj.focus();
 // 			return flase;
 		}
	

 		else if (pwdConfirmObj.value == "" || pwdConfirmObj.value == null) {
//  			alert("비민번호 확인란을 다시 입력해주세요");
			pwdConfirmObj.focus();
 // 			return flase;
 		}
	
 		else if (pwdObj.value != pwdConfirmObj.value) {
//  			alert("비밀번호와 비밀번호 확인란에 입력하신 것이 다릅니다. 다시 입력해주세요")
 			pwdObj.focus();
 // 			return false;
 		}
	
 		else {
			memberRegiFormObj.submit();
		}
		
		
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
	      $('#address').keydown(function() {
	        
			 var addressObj = $('#address').val();
	         var failMsg = "주소를 입력해주세요";
	         var successMsg = "숫자,한글,영문 대소문자,특수문자 사용가능 (공백없이 입력해주세요)";
	         
	         if (addressObj == "" || addressObj == null) {
	            $('#addressConfirmMsg').css('color', 'red');
		         $('#addressConfirmMsg').html(failMsg);
	         }	else if (addressObj != "" && addressObj != null) {
	        	 $('#addressConfirmMsg').css('color', 'grey');
		         $('#addressConfirmMsg').html(successMsg);
	         }
	      });
	   });
   
		
   $(document).ready(function() {
	      $('#hp').keydown(function() {
	    	 
	    	  $('#hp').val($('#hp').val().replace(/[^0-9]/g,""));
	    	 
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

<div id="memberRegiBodyDiv">

	<h1 style="text-align: center;">회원 가입</h1>

	<form action="./addCtr.do" method="post" id="memberRegiForm">

	<div id="memberRegiInfoContainer">
		<div id="memberRegiInfoDiv">
			<br>
			<br>
			<input class="memberRegiInfo" type="text" value="이름" disabled="disabled"><br/> 
			<input class="memberRegiInput" type="text" id="name"  name="name"
				placeholder="한글,영문 대소문자 가능(공백없이 입력해주세요)" >
			<a id="nameConfirmMsg"></a><br/>
			
			<input class="memberRegiInfo" type="text" value="아이디" disabled="disabled"><br/>
			<input class="memberRegiInput" type="text" id="id" name="id"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)">
			<a id="idConfirmMsg"></a><br/> 
			
			<input class="memberRegiInfo" type="text" value="비밀번호" disabled="disabled"><br/>
			<input class="memberRegiInput" type="password" id="password" name="password"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)" >
			<a id="passwordConfirmMsg"></a><br/>
			
			<input class="memberRegiInfo" type="text" value="비밀번호 확인" disabled="disabled"><br/>
			<input class="memberRegiInput" type="password" id="passwordConfirm" name="passwordConfirm"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)">
			<a id="passwordConfirmAgainMsg"></a></br>
			
			<input class="memberRegiInfo" type="text" value="주소" disabled="disabled"><br/>
			<input class="memberRegiInput" type="text" id="address" name="address"
				placeholder="숫자,한글,영문 대소문자 ,특수문자 가능">
			<a id="addressConfirmMsg"></a><br/> 
			
			<input class="memberRegiInfo" type="text" value="연락처" disabled="disabled"><br/>
			<input class="memberRegiInput" type="text" id="hp" name="hp" maxlength="11"
				placeholder="( - ) 제외한  11자리 숫자만 입력해주세요" >
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


</div>

	<jsp:include page="/WEB-INF/views/common/tail.jsp" />
	
	
	
	
</body>
</html>