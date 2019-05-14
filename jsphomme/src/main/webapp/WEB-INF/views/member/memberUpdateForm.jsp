<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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


	#memberUpdateBodyDiv{
		width: 1920px;
		height: 620px;
	}
	
#memberInfoContainer{
		width: 1250px;
		height:580px;
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

a {
		font-size: 14px;
	}
	
#hrDiv{
		margin-top: 80px;		
	}	
	
h1{
	text-align: center;
}
</style>
<title>마이페이지 수정</title>

<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<script type="text/javascript">

	window.onload = function(){
		var focusObj = document.getElementById("name");
		
		focusObj.focus();
		

		    	  
		    	  if($('#judgeNumber').val() == 1){
			    	  
			    	  $('#transBt').attr('value','아이디 중복확인');
			    	  $('#transBt').attr('onclick','overlapCheckFnc()');
			    	  $('#id').removeAttr('readonly');
			    	  $('#id').focus();
			    	  
		    		  
		    	  }
		    	  
		     

	}
	

	
	function judgeNumberTranFnc() {
		var judgeNumberObj = document.getElementById("judgeNumber");
		
		judgeNumberObj.value = 1;
	}
	
	
	function pageMoveBeforeFnc(memberNo){
		
		var url = 'detail.do?memberNo=' + memberNo;
		location.href = url;	
	}
	
	
	function modifyFnc() {
		var nameObj = document.getElementById("name");
 		var idObj = document.getElementById("id");
 		var pwdObj = document.getElementById("password");
 		var judgeNumberObj = document.getElementById("judgeNumber");
 		var pwdConfirmObj = document.getElementById("passwordConfirm");
		var memberModifyFormObj = document.getElementById("memberModifyForm");

		if (nameObj.value == "" || nameObj.value == null)  {
			alert("이름을 입력해주세요");
			nameObj.focus();
			return;
		}

		if (idObj.value == "" || idObj.value == null) {
			alert("아이디를 다시 입력해세요");
			idObj.fucous();
			return;
		}

		 if(judgeNumberObj.value == 1){
			alert("아이디 중복체크를 해주세요");
			return;
		}
		
		
		if (pwdObj.value == "" || pwdObj.value == null) {
			alert("비민번호를 다시 입력해주세요")
			pwdObj.focus();
			return;
		}


		if (pwdConfirmObj.value == "" || pwdConfirmObj.value == null) {
			alert("비민번호 확인란을 입력해주세요");
			pwdConfirmObj.focus();
			return;
		}

		if (pwdObj.value != pwdConfirmObj.value) {
			alert("비밀번호와 비밀번호 확인란에 입력하신 것이 다릅니다. 다시 입력해주세요");
			pwdObj.focus();
			return;
		}
 		
		
		memberModifyFormObj.submit();
	
	
	}

	function overlapCheckFnc() {
		var idObj =document.getElementById("id");
		var formObj = document.getElementById("memberModifyForm");
		
		formObj.method = "post";
		formObj.action = "/jsphomme/member/overlapCheck.do";
		
		
		formObj.submit();
	}
	
	
	$(document).ready(function() {
	      $('#transBt').click(function() {
	    	  var confirmObj = confirm("아이디를 변경하시겠습니까?");
	    	  if(confirmObj == true || $('#judgeNumber').val == 1){
		    	  
		    	  $('#transBt').attr('value','아이디 중복확인');
		    	  $('#transBt').attr('onclick','overlapCheckFnc()');
		    	  $('#id').removeAttr('readonly');
		    	  $('#id').focus();
		    	  $('#transBt').off("click")
	    		  
	    	  }else{
	    		  return;
	    	  }
	    	  
	      });
	   });
	
	
	
	$(document).ready(function() {
	      $('#name').keydown(function() {
	         var nameObj = $('#name').val();
			 var failMsg = "이름을 입력해주세요";
	         var successMsg = "한글,영문 대소문자 가능/ 숫자,특수문자 사용불가 (공백없이 입력해주세요)";
			 
	         if (nameObj == "" || nameObj == null) {
	            $('#nameConfirmMsg').css('color', 'red');
		         $('#nameConfirmMsg').html(failMsg);
//		         $('#name').focus();
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

</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">

<div id="memberUpdateBodyDiv">
	
	<h1>회원 정보 수정페이지</h1>
	
	<form action="./updateCtr.do" method="post" id="memberModifyForm">
			
	<div id="memberInfoContainer">	
		
		<div id="memberInfoDiv">
			
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
			<input type="hidden" name="status" value="${memberVo.status}">
			<input type="hidden" name="authority" value="${memberVo.authority}">
			
			<input class="memberInfo" type="text" value="이름" disabled="disabled"><br/>
			<input class="memberInput" type="text" id="name"  name="name" value='${memberVo.name}'
				placeholder="한글,영문 대소문자 가능(공백없이 입력해주세요)" >
			<a id="nameConfirmMsg"></a><br/>

		
			<input class="memberInfo" type="text" value="아이디" disabled="disabled"><br/>
			<input class="memberInput" type="text" id="id" name="id" value="${memberVo.id}" onchange="judgeNumberTranFnc()"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)" readonly="readonly" style="width: 400px;">
			<input id="transBt" type="button" value="아이디 변경" style=" background-color:#DBDBDB;  border-radius: 4px;font-weight: bold; ">
			<input id="hiddenBtn" type="hidden">
			<a id="idConfirmMsg"></a><br/> 

		
			<input class="memberInfo" type="text" value="비밀번호" disabled="disabled"><br/>
			<input class="memberInput" type="password" id="password" name="password" value="${memberVo.password}"
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)" >
			<a id="passwordConfirmMsg"></a><br/>
	
			<input class="memberInfo" type="text" value="비밀번호 확인" disabled="disabled"><br/>
			<input class="memberInput" type="password" id="passwordConfirm" name="passwordConfirm" 
				placeholder="숫자,영문 대소문자만 가능(공백없이 입력해주세요)"><br/>
			
			<input class="memberInfo" type="text" value="주소" disabled="disabled"><br/>
			<input class="memberInput" type="text" id="address" name="address" value="${memberVo.address}"
				placeholder="숫자,한글,영문 대소문자 ,특수문자 가능">
			<a id="addressConfirmMsg"></a><br/> 
			
			<input class="memberInfo" type="text" value="연락처" disabled="disabled"><br/>
			<input class="memberInput" type="text" id="hp" name="hp" maxlength="11" value="${memberVo.hp}"
				placeholder="( - ) 제외한  11자리 숫자만 입력해주세요" >
			<a id="hpConfirmMsg"></a>
		
		</div>
		
		<div id="hrDiv">
			<br/>
			<hr>
		</div>
			
			<input type="button" value="이전페이지" id="previousPageBtn" onclick="pageMoveBeforeFnc(${memberVo.memberNo});">
			<input type="button" value="수정완료" id="modifyBtn" onclick="modifyFnc();">
	</div>
	</form>
<input type="hidden" id="judgeNumber" name="judgeNumber" value="${judgeNumber}">
</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />	
	
</body>
</html>