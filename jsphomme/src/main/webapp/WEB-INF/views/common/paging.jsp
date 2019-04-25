<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
.paging{
	margin-top: 20px;
}
.paging>ul {
	list-style-type: none;
	padding: 0px;
	overflow: hidden;
	display: table;
	margin-left: auto;
	margin-right: auto;
	border-radius: 7px;
}

.paging>ul>li {
	float: left;
	height: 35px;
	width: 35px;
	border-radius: 7px;
	margin-left: 10px;
	margin-right: 10px;
	background-color: #DBDBDB;
}

.paging>ul>li>a {
	display: block;
	color: white;
	text-align: center;
	padding: 7px 5px 7px 5px;
	text-decoration: none;
	border-radius: 7px;
	margin-top: auto;
	margin-bottom: auto;
}

.paging>ul>li>a:hover {
	background-color: #B2EBF4;
	font-weight: bold;
	border-radius: 7px;
}

.active {
	background-color: #B2EBF4;
	font-weight: bold;
	border-radius: 7px;
}
</style>

<script type="text/javascript"
	src="/jsphomme/resources/js/jquery-3.3.1.js">
	
  
   


</script>
<script type="text/javascript">
function goPageFnc(pageNumber) {
    var curPage = $("#curPage");  // = document.getElementById("curPage"); 동일함
    curPage.val(pageNumber);
    
    $("#pagingForm").submit();
 }
   $(document).ready(function(){
	   var curPageDoc = $('#curPage');
	      var id = '#pageButton'+curPageDoc.val();
	      
	      $(id).addClass('active');
   });
 
</script>
<nav class="paging">
	<ul>
		<li><a href="#"
			onclick="goPageFnc(${pagingMap.paging.prevPage});"><span>≪</span></a></li>

		<c:forEach var="num" begin="${pagingMap.paging.blockBegin}"
			end="${pagingMap.paging.blockEnd}">

			<li id="pageButton${num}"><a href="#"
				onclick="goPageFnc(${num});"><c:out value="${num}" /></a></li>

		</c:forEach>



		<li><a href="#"
			onclick="goPageFnc(${pagingMap.paging.nextPage});"><span>≫</span></a></li>
	</ul>
</nav>

