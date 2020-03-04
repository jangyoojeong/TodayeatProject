<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

	body{
	text-align:center;
	}
	
	.page{
	margin-top:210px;
	text-align:center;
	height: 100%;
	min-width: 800px;
	}
	.contents_wrap:after{content:''; display:block; clear:both; float:none;}
	.contents_left,
	.contents_right{width:50%;float:left;margin:0;padding:0;border:1px solid #000;box-sizing:border-box;}

</style>
<body>
		
		<div class="page">
		<div class="contents_wrap">
			
		</div>
	</div>
		
</body>
<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->
<jsp:include page="../main/footer.jsp" /> <!-- 푸터부분 삽입 -->

</html>