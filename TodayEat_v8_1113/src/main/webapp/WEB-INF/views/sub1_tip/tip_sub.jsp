<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>tip_sub</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href=".${pageContext.request.contextPath}/resources/css/style.min.css" rel="stylesheet">
    
    <style type="text/css">
    	
		body{
			text-align:center;
			word-break: break-all;
		}
		
		img{
			width: 70%;
			height: 70%;
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
		
		.recipe {
			margin-top: 30px;
    		width: 13.6%;
    		height: 13.6%;
    		margin-bottom: 50px;
    		vertical-align:-70px
    	}
    	
    	.food {
    		width: 620px;
    		height: 410px;
    	}
    	
    	.content {
    		padding-top: 60px;
    		padding-left: 100px;
    		padding-right: 100px;
    		padding-bottom: 50px;
    	}
    	
    	.name {
    		font-size:35px;
    		font-weight: bold;
    		color: #0b6623;
    	}
    	
    	.title {
    		font-size:18px;
    		font-weight: bold; 
    		color: #0b6623;
    	}
    	
    	.description {
    		font-size:18px;
    		font-weight: bold;
    		color: #8C8C8C;
    	}
    	
    	.title2 {
    		width:40px;
    		height:40px; 
    		vertical-align:-10px;
    	}
    	
    	.word {
    		word-break: keep-all;
    	}
    		
    </style>
</head>

<body>
<div class="page">
	<div class="contents_wrap">
		
    <!--Main layout-->
    <main class="mt-5 pt-5">
        <div class="container">
        		<img class="recipe" src="${pageContext.request.contextPath}/resources/img/icon/Tip 1.svg" />&nbsp;&nbsp;&nbsp;&nbsp;
       			<span style="font-size:45px;font-weight: bold;">식재료 보관</span>
        		
        		<section>
                <!--Grid row-->
       				<div class="name pb-3">[ ${tipinfo1.tname} ]</div>
        			
        			<span class="title">원산지 | </span>
        				<span class="description">${tipinfo1.torign}</span><br>
        			<span class="title">주요 생산지 | </span>
        				<span class="description">${tipinfo1.tproduction}</span><br>
        			<span class="title">열량 | </span>
        				<span class="description">${tipinfo1.tcol}</span>
        			
        			<div class="mt-3 pt-3">
                	<img class="food rounded" src="${pageContext.request.contextPath}/resources/img/tip/${tipinfo1.timg}">
                	</div>
                	
                	<!-- <div class="content" style="border:1px solid #ffc200;"> -->
                	<div class="content">
                		<img class="title2" src="${pageContext.request.contextPath}/resources/img/sub/tip_sub.png">	
                		&nbsp;&nbsp;&nbsp;
                		<span style="font-size:25px;font-weight: bold;">영양 손실 막아주는 보관방법</span>
                		
                		<hr class="hr1">
                		
                		<h5 class="word" style="line-height:30px;">
                		${tipinfo1.tkeep}
						</h5>
						
						<div class="mt-3 pt-3 md-3 pd-3" style="color: #8C8C8C;">
							출처 : ${tipinfo1.tsource}
						</div>
        			</div>
                
                
                
                </section>
		</div>
    </main>
    <!--Main layout-->
    
	<div class="pb-0 pt-3">
		<jsp:include page="../main/footer.jsp" /> <!-- 푸터부분 삽입 -->
	</div>
	
	</div>
</div>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mdb.min.js"></script>
<!-- Initializations -->
<script type="text/javascript">
	// Animations initialization
	new WOW().init();
</script>

</body>
<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->

</html>