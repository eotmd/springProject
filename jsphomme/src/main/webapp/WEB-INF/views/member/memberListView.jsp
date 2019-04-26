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
	
}

table {
	width: 1698px;
	height: 400px;
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
}

#memberNo {
	text-align: right;
}

#status, #authority, #memberName , #id, #hp, #creDate, #modDate, #deleteFnc {
	text-align: center;
}

#address {
	text-align: left;
}

</style>
<title>회원 목록</title>
<script type="text/javascript">


</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp" />

<img alt="ConceptPhoto" src="../resources/images/concept2.jpg">

<div id="memberListViewBodyDiv">

	<h1>회원목록</h1>
	
	
	
	<table>
		<tr>
			<td class="category">회원 번호</td>
			<td class="category">활성화 상태</td>
			<td class="category">권한</td>
			<td class="category">이름</td>
			<td class="category">아이디</td>
			<td class="category">주소 </td>
			<td class="category">연락처	</td>
			<td class="category">가입 날짜 </td>
			<td class="category">수정 날짜 </td>
			<td class="category">삭제</td>
		</tr>
		<c:forEach var="memberVo" items="${memberList}">
			<tr>
				<td id="memberNo">${memberVo.memberNo}</td>
				<td id="status">${memberVo.status}</td>
				<td id="authority">${memberVo.authority}</td>
				<td id="memberName">${memberVo.name}</td>
				<td id="id">${memberVo.id}</td>
				<td id="address">${memberVo.address}</td>
				<td id="hp">${memberVo.hp}</td>
				<td id="creDate"><fmt:formatDate value="${memberVo.creDate}"
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
				<td id="modDate"><fmt:formatDate value="${memberVo.modDate}"
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
				<td>
				<a style="text-align: center;" id="deleteFnc" href='./deleteCtr.do?memberNo=${memberVo.memberNo}'>[삭제]</a>
<%-- 					<input type="button" value="삭제" onclick="deleteMemberFnc(${memberVo.memberNo});"> --%>
				</td>		
			</tr>
				
		
		</c:forEach>
	
	</table>

<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap" />
</jsp:include>


</div>
	
<jsp:include page="/WEB-INF/views/common/tail.jsp" />
</body>
</html>