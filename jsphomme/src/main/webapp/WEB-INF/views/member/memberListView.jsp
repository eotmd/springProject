<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table , tr, td {
	border: solid 1px black;
	border-collapse: collapse;
	
}

#memberListViewBodyDiv {
	width: 1920px;
	height: 620px;
}

</style>
<title>회원 목록</title>
<script type="text/javascript">


</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<div id="memberListViewBodyDiv">

	<h1>회원목록</h1>
	
	
	
	<table>
		<tr>
			<td>회원 번호</td>
			<td>활성화 상태</td>
			<td>권한</td>
			<td>이름</td>
			<td>아이디</td>
			<td>주소 </td>
			<td>연락처	</td>
			<td>가입 날짜 </td>
			<td>수정 날짜 </td>
			<td>삭제</td>
		</tr>
		<c:forEach var="memberVo" items="${memberList}">
			<tr>
				<td>${memberVo.memberNo}</td>
				<td>${memberVo.status}</td>
				<td>${memberVo.authority}</td>
				<td>${memberVo.name}</td>
				<td>${memberVo.id}</td>
				<td>${memberVo.address}</td>
				<td>${memberVo.hp}</td>
				<td><fmt:formatDate value="${memberVo.creDate}"
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
				<td><fmt:formatDate value="${memberVo.modDate}"
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
				<td>
				<a href='./deleteCtr.do?memberNo=${memberVo.memberNo}'>[삭제]</a>
<%-- 					<input type="button" value="삭제" onclick="deleteMemberFnc(${memberVo.memberNo});"> --%>
				</td>		
			</tr>
				
		
		</c:forEach>
		
	
	</table>

</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>