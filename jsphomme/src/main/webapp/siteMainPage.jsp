<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome JSP Homme!</title>

<script type="text/javascript">



</script>

<style type="text/css">
	
	* {
		margin: 0;
		padding: 0;
	}
	
	.mainImg{
		overflow: hidden;
		margin: auto;
		width: 1200px;
	}
	
	nav {
		
	}
	
	.mainImg ul{
		width: 400px;
		float: left;
	}
	
	li{
		list-style-type: none;
	}
	
	.mainImg ul li{
		text-align: center;
		
	}
	
	.mainImg img{
		width: 380px;
		height: 300px;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	.introduce{
		width: 800px;
		margin: auto;
		margin-top: 50px;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/headerAfterLogin.jsp"></jsp:include>
	
	<h1>JSP Homme</h1>
	<div class="mainImg">
		<nav>
			<ul>
				<li>
					<span>
						<a href='#' onclick="goProductList();">
							<img alt="1" src="/jsphomme/resources/images/main_1.jpg">
						</a>
					</span>
				</li>
			</ul>
			<ul>
				<li>
					<span>
						<a href='#' onclick="goProductList();">
							<img alt="2" src="/jsphomme/resources/images/main_2.jpg">
						</a>
					</span>
				</li>
			</ul>
			<ul>
				<li>
					<span>
						<a href='#' onclick="goProductList();">
							<img alt="3" src="/jsphomme/resources/images/main_3.jpg">
						</a>
					</span>
				</li>
			</ul>
		</nav>
	</div>
	<div class="introduce">
		저희 JSP Homme는 영국에서 최초로 시작되어 저희의 옷을 입는 모든 사람에게 행운을 주었고
		바로 지금! 당신에게 행운의 기회가 찾아왔습니다. 당신은 4일안에 저희의 옷을 당신곁의 모든 사람에게 추천해 주어야 합니다. 
		이 문구를 포함해서 총 7명의 행운이 필요한 사람에게 보내 주셔야 합니다.
		복사를 해도 좋습니다. 흑 미신이라 하실지 모르지만 사실입니다. 
		영국에서 HGXWCH라는 사람은 1930년에 저희의 옷을 추천 받았습니다. 
		그는 비서에게 시켜 당장 JSP Homme의 옷을 사고 주변인들에게 추천하라고 했습니다. 
		며칠뒤에 복권이 당첨되어 20억을 받았습니다. 이떤이는 이 편지를 받았으나 
		96시간 이내에 자신의 주변 사람들에게 추천해야 한다는 사실을 잊었습니다. 
		그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7명의 사람에게 JSP Homme의 옷을 추천했는데
		다시 좋은 직장을 얻었습니다.
		기억해 주세요. 저희의 옷을 구매하지 않으면 행운은 찾아오지 않습니다. 
		하지만 저희의 옷을 구매하고 다른 사람들에게 추천한다면 행운이 있을 것입니다. 
		당신과 저희의 옷을 사는 모든 사람들은 7년의 행운이 있을 것이고,
		이 문구를 무시하거나 옷을 구매하지 않는 사람들은 3년의 불행이 있을 것입니다.
		아디오스..
		
	</div>
	
	<jsp:include page="/WEB-INF/views/common/tail.jsp"></jsp:include>
	
</body>
</html>