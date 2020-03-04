<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.footer {
    position:static;
    bottom:0;
    width:100%;
    height:90px;     
    background-color:#0B6623;
    min-width:800px;
    /* margin-top: 110px; */
    
}
.footer:after{content:'';display:block;float:none;clear:both;}

.footer-left{
		
		width: 150px;
        float: left;
        padding-top:9px;
        background-color: #0B6623;
}

.footer-left img{
background-color: #0B6623;
}



.footer-right{

	float: left;
	padding:20px 0 0 20px;
	background-color: #0B6623;
	text-align:left;
	bottom:0;
}



</style>


</head>
<body>

</body>
<!--푸터  -->
<div class="footer">
	<div class="footer_inner" style="max-width:800px; margin: 0 auto;">
		<div class="footer-left">
			<img src="${pageContext.request.contextPath}/resources/img/icon/Logo_foot-13.svg">
		</div>

		<div class="footer-right" style="font-size: 12px; color: #FFFFFF;">
			오늘뭐먹지? | 서울시 종로구 돈화문로 26 4층(묘동,단성사) | 070-7475-4857 | 등록번호: 서울오7777<br>
			등록·발행일: 2019.10.18 | 발행·편집인: KG itbank | 대표이사: 김윤동 황주원 장유정 안수민 박준상<br>
			&copy; TWE.  All Right Reserves
		</div>
	</div>
	<!-- <div id="footer_copy" style="color: #FFFFFF;">
			&copy; <span class="copyright_name">TWE</span> All Right Reserved.

		</div> -->
		
		<!-- <div class="footer_inner" style="
		    max-width: 800px;
		   	margin: 0 auto;
			">	푸터 가운데 정렬 -->
			
</div> 
</html>