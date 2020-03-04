<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
	margin: 0;
	padding: 0;
	background: #FFFFFF repeat-x left top;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #19130D;
	height: 100%;
	
}

html {
	height: 100%;
	
}



p, ul, ol {
	margin-top: 0;
	line-height: 180%;
}

ul, ol {
}

a {
	text-decoration: none;
	color: #000000;
}


.wrapper {
	position: absolute;
	width: 100%;
	top: 0;
	margin: 0 auto;
	padding: 0; 
	z-index:1;
	background-color:#FFFFFF;
	min-width:800px;

}

/* Header */

.header {
	width: 100%;
	height: 95px;
	margin: 0 auto;
	min-width:800px;
	
	
}

/* Logo */

.logo {
	float: left;
	height: 95px;
	margin: 0;
}

.logo a img{
	position: absolute;
    top: 20px;
	width: 350px;
	height: 95px;

}


/* Search */

.menu-right {
	float: right;
	width: 400px;
	height: 110px;
	margin-top: 50px;
}

.menu-right form {
	height: 40px;
	margin: 0;
	padding: 10px 0 0 20px;
	float: left;
}

.menu-right fieldset {
	margin: 0;
	padding: 0;
	border: none;	
}


#search-text {
	width: 150px;
	padding: 8px 0px 4px 0px;
	border: 1px solid #DEDEDE;
	background: #FFFFFF;
	text-transform: lowercase;
	font: normal 12px Arial, Helvetica, sans-serif;
	color: #000000;
}

#search-submit {
	width: 50px;
	height: 28px;
	background: #0B6623;
	color: #FFFFFF;
	text-decoration: none;
	font-size: 15px;
	border: none;
}

.login{
	height: 40px;
	margin: 0;
	padding: 13px 0 0 20px;
	float: left;
}
.login a:hover{
text-decoration: none; border-bottom: 3px solid #0B6623; padding-bottom: 1px;
}


.join{
	height: 40px;
	margin: 0;
	padding: 13px 0 0 20px;
	float: left;
}
.join a:hover{
text-decoration: none; border-bottom: 3px solid #0B6623; padding-bottom: 1px;
}



/* Menu */

.menu {
	float: left;
	width: 100%;
	height: 50px;
	margin: 0 auto;
	padding: 0px;
	text-align: center;
	min-width:800px;
 	border-bottom: 1px solid gray;
 
	
}

.menu ul {
	display: table;
	padding: 0px;
	padding: 0px 0px 0px 0px;
	list-style: none;
	line-height: normal;
	margin: 0 auto;
}

.menu li {
	float: left;
	text-align: center;
	display:inline-block;
	
}

.menu ul ul{
	display:none;
}

.menu ul ul li{
	margin-top:1px;
	width:150px;
	height:30px;
	background-color:#FFFFFF;
	
	border-collapse:collapse;
	border: 1px solid #0B6623;	
	
}

.menu ul ul li a{
	margin-top:3px;
	font-size:10px;
}

.menu ul li:hover >ul{
display:block;
}

.menu a {
	display: block;
	margin-right: 0px;
	height: 35px;
	padding: 3px 40px 3px 40px;
	border: none;
	text-decoration: none;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	font-weight: normal;
	color: #211B15;
}
.menu a:hover {
	text-decoration: none; border-bottom: 3px solid #0B6623; padding-bottom: 1px;
}



</style>
<script type = "text/javascript">


function uploadCheck() {
	
	<c:if test="${empty login_id }">
		  if (confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')==false) {
			  return false;
		  };
		  location.href = "login.do";
	</c:if>
	
	<c:if test="${!empty login_id }">
		 location.href = "uploadrecipe_view.do";
	</c:if>
	
}
 
</script>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<div class="logo">
				<a href="index.do">
				<img src="${pageContext.request.contextPath}/resources/img/icon/Logo.svg"></a>
			</div>
			<div class="menu-right">
			<form method="get" action="">
				<fieldset>
					<input type="search" id="search-text" size="15" placeholder="레시피 검색" />
					<input type="submit" id="search-submit" value="검색" />	
				</fieldset>					
			</form>
			<c:if test="${empty login_id }">
				<div class="login">				   			
					<a href="login.do">로그인</a>				
				</div>
				<div class="join">
					<a href="join.do">회원가입</a>
				</div>
			</c:if>
			
			<c:if test="${not empty login_id }">
				<div class="login">				   			
					<a href="logout.do">로그아웃</a>				
				</div>
				<div class="join">
					<a href="Mypage_info.do">마이페이지</a>
				</div>
			</c:if>
		   	</div>
			
		</div>
		
			<div class="menu">
		<ul>
			<li><a href="tip_main.do">Tip코너</a></li>
			<li><a href="season_main.do">계절별 제철 음식</a></li>
			<li><a href="#">먹지들의 레시피</a>
	            <ul>
	               <li><a href="my_recipe_search.do">레시피 검색</a>
	              <li><a href='javascript:void(0);' onclick="uploadCheck();">레시피 등록</a>      
	            </ul>
	        </li>
			<li><a href="test.do">레시피 Book</a></li>
		</ul>
		</div>
			
	</div>

</body>
</html>