function shopNameFnc() {
	
// 	location.href="/jsphomme/common/main.do";    // 이후 조회수를 구현하게되면 이를 사용하자
	location.href="/jsphomme";
	
}

function basketFnc() {
	location.href = "/jsphomme/basket/list.do";
}

function productRegiFnc() {
	location.href ="/jsphomme/product/insertMove.do";
}

function myPageFnc() {
	location.href ="/jsphomme/member/certificationMove.do";
	

}

function memberListFnc() {
	location.href ="/jsphomme/member/list.do";
}

function purchaseListFnc(memberNo) {
	location.href = "/jsphomme/purchase/list.do?memberNo=" + memberNo;
}

function logoutFnc() {
	location.href = "/jsphomme/auth/logout.do";
}

function LoginFnc() {
	location.href = "/jsphomme/auth/login.do";
}

function menswearFnc() {
	location.href ="/jsphomme/product/list.do";
}

function goProductList() {
	location.href = "/jsphomme/product/list.do";
}

function searchFnc() {
	var searchIdObj = document.getElementById("searchId")
	if(event.keyCode == 13){
		
		searchIdObj.submit();
	}
}

function goHideListFnc() {
	location.href = "/jsphomme/product/hideList.do";
}
