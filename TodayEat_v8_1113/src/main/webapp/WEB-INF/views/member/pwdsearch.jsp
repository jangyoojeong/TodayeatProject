<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../main/header.jsp" /> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

.search_wrap{
	display:block;
	margin:0 auto;
	margin-top: 210px;
	width: 600px;
	height:100%;
	min-height: 800px;
	text-align: center;
}

.search_name{
	margin:0 auto;
	margin-top:100px;
	float:left;

}

.search_name a{
	text-align:center;
}

.search_name a:hover{
	text-decoration: none; border-bottom: 3px solid #0B6623; padding-bottom: 1px;
}

.search_left{
	float: left;
	margin-left:150px;
	font-size:20px;
}

.search_left a:focus{
	text-decoration: none; border-bottom: 3px solid #0B6623; padding-bottom: 1px;
}

.search_right{
	float: left;
	margin-left: 20px;
	font-size:20px;
	
}

.search_form{
	margin:0 auto;
	text-align:center;
}

#search{
	margin-top:130px;
}

</style>
<body>
	<div class="search_wrap">
		<div class="search_name">
			<div class="search_left">
				<a href="idsearch.do">아이디 찾기</a>
			</div>
			<div class="search_right">
				<a href="pwdsearch.do">비밀번호 찾기</a>
			</div>
		</div>	<br><br>
		
		<div class="search_form">
		
			<form id="search" action="searchpwd" method="post">
				<input type="text" placeholder="아이디" name="id" required="required" style="width:300px; height:50px; font-size:20px;"><br><br>
				<input type="text" placeholder="이름" name="name" required="required" style="width:300px; height:50px; font-size:20px;"><br><br>
				<input type="email" placeholder="이메일" name="email" required="required" style="width:300px; height:50px; font-size:20px;"><br><br><br>
				<input type="submit" value="비밀번호 찾기" style="width:300px; height:55px; font-size:25px; background-color:#0B6623;
					color:#FFFFFF; border:0; border-radius:12px;">
			
			
			</form>
		</div>
		
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>