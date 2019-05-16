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
	
table , tr, td {
	border: solid 1px black;
	border-collapse: collapse;
	height: 45px;
	padding: 5px;
}

table {
	width: 1698px;
	margin-left: 94px;
}

#memberListViewBodyDiv {
	width: 1920px;
	height: 620px;
}

h1{
	margin-left: 94px;
}

.category{
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	background-color: #DBDBDB;
	height: 32px;
}



#kickId:hover{
	font-size: 13px;
}

</style>
<title>회원 목록</title>
<script type="text/javascript">
function deleteMemberFnc(no) {
	var confirmVal = confirm(no+"번 회원을 삭제 하시겠습니까?");
	
	if(confirmVal == true){
		location.href = "./deleteCtr.do?memberNo="+no;
	}else{
		return;
	}
}

</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">

<div id="memberListViewBodyDiv">

	<h1 style="float: left; margin-right: 100px;">회원목록</h1>
	
	<form id="form1" action="/jsphomme/member/list.do" method="get" style="padding-top:50px; padding-right:130px; float: right;">
		<select name="searchOption">
			<option value="userId" <c:if test="${searchOption == 'userId'}">selected</c:if>>아이디</option>				<!-- 이메일  -->
			<option value="userName"<c:if test="${searchOption == 'userName'}">selected</c:if>>이름</option>					<!-- 이름  -->
			<option value="userAuthority"<c:if test="${searchOption == 'userAuthority'}">selected</c:if>>권한</option>					<!-- 이름  -->
			<option value="userNo"<c:if test="${searchOption == 'userNo'}">selected</c:if>>회원번호</option>					<!-- 이름  -->
							
		</select>
		<input type="text" name="keyword" value="${keyword}" style="clear: both;">			
		<input type="submit" value="검색">					
	</form>
	
	<table style="clear: both;">
		<tr>
			<td class="category" style="width: 100px;">회원 번호</td>
			<td class="category" style="width: 188px;">권한</td>
			<td class="category" style="width: 188px;">이름</td>
			<td class="category" style="width: 188px;">아이디</td>
			<td class="category" style="width: 194px;">주소 </td>
			<td class="category" style="width: 188px;">연락처	</td>
			<td class="category" style="width: 232px;">가입 날짜 </td>
			<td class="category" style="width: 232px;">수정 날짜 </td>
			<td class="category" style="width: 188px;">삭제</td>
		</tr>
		<c:forEach var="memberVo" items="${memberList}">
			<tr>
				<td id="memberNo">${memberVo.memberNo}</td>
				<td id="authority">${memberVo.authority}</td>
				<td id="memberName">${memberVo.name}</td>
				<td id="id"><a href="/jsphomme/member/detail.do?memberNo=${memberVo.memberNo}">${memberVo.id}</a></td>
				<td id="address">${memberVo.address}</td>
				<td id="hp">${memberVo.hp}</td>
				<td id="creDate"><fmt:formatDate value="${memberVo.creDate}"
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
				<td id="modDate"><fmt:formatDate value="${memberVo.modDate}"
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
				<td style="text-align: center;">
					<input id="kickId" type="button" value="[삭제]" onclick="deleteMemberFnc(${memberVo.memberNo});" style="border: 0px; background-color: #ffffff; color: red; font-weight: bold;">
				</td>		
			</tr>
		</c:forEach>
	</table>
		<c:if test="${empty memberList}">
			<div style="margin: auto; text-align: center; margin-top: 100px; margin-bottom: 80px;">
				회원정보가 없습니다.
			</div>
		</c:if>

<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap" />
</jsp:include>
	
	<form action="/jsphomme/member/list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage" value="${pagingMap.paging.curPage}">
		<input type="hidden" name="searchOption" value="${searchOption}">
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>