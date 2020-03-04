<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../main/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css" >

.search_wrap{
		margin: 0 auto;
		margin-top: 300px;
		width: 700px;
		height:100%;
		min-height: 600px;
		text-align: center;
	
}

</style>
<body>
	<div class="search_wrap">
		<h1> 회원님의 아이디는 ${s_id} 입니다.</h1><br><br>
			<div class="button_wrap">
				<input type="button" value="로그인하기" onClick="location.replace('login.do')" style="background-color:#0B6623; color:#FFFFFF; border:0; 
					width:200px; height:40px; "> 
				<input type="button" value="비밀번호찾기" onClick="location.replace('pwdsearch.do')" style="background-color:#0B6623; color:#FFFFFF; border:0; 
					width:200px; height:40px; ">
			</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>