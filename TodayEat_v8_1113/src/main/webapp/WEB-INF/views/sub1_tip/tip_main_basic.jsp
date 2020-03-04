<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>tip_main</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="${pageContext.request.contextPath}/resources/css/style.min.css" rel="stylesheet">
    
    <style type="text/css">
    	
    	@media (max-width: 1366px) {
		    .container {
		  	padding-right: 5%;
		  	padding-left: 5%;
			}
    	}
    	@media (min-width: 768px) {
			.carousel-multi-item-2 .col-md-3 {
			float: left;
			width: 25%;
			max-width: 100%; } 
		}

		.carousel-multi-item-2 .card img {
			border-radius: 2px; 
		}
			
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
		
		
		.carousel-control-prev {
			margin-left: -10%;
		}
		
		.carousel-control-next {
			margin-right: -10%;
		}
		
		.recipe {
			margin-top: 30px;
    		width: 13.6%;
    		height: 13.6%;
    		margin-bottom: 50px;
    	}
    	
    	.recipe2 {
			margin-top: 80px;
    		width: 13.6%;
    		height: 13.6%;
    		margin-bottom: 50px;
    	}
    	
    	.img-fluid {
    		/* border: 1px solid #F6F6F6;
    		   width: 256px; */
    		height: 173px;
    	}
    </style>
</head>

<body>
<div class="page">
	<div class="contents_wrap">
		
    <!--Main layout-->
    <main class="mt-5 pt-5">
        <div class="container">
        
        <img class="recipe" style="vertical-align:-70px" src="${pageContext.request.contextPath}/resources/img/icon/Tip 1.svg" />&nbsp;&nbsp;&nbsp;&nbsp;
       	<span style="font-size:45px;font-weight: bold;">식재료 보관</span>
        
            <section>
                <!--Grid row-->
                <div class="row wow fadeIn">
					<!--Carousel Wrapper-->
	<div id="multi-item-example" class="carousel slide carousel-multi-item carousel-multi-item-2" data-ride="carousel">
	
  <!--Slides-->
  <div class="carousel-inner" role="listbox">

    <!--First slide-->
    <div class="carousel-item active">

      <div class="col-md-3 mb-3">
        <div class="card">
        	<div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/가지.png">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/감자.png">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/닭고기.jpg">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/고구마.png">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

    </div>
    <!--/.First slide-->

    <!--Second slide-->
    <div class="carousel-item">

      <div class="col-md-3 mb-3">
        <div class="card">
          <div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/고등어.png">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/고사리.png">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/고추.png">
          		<a href="tip_sub.do">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div>
          <div>
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/white.png">
          		
            </div>
        </div>
      </div>

    </div>
    <!--/.Second slide-->

  </div>
  <!--/.Slides-->
  
  <!--Controls-->
  
    <a class="carousel-control-prev" href="#multi-item-example" data-slide="prev">
    	<i class="fas fa-angle-left fa-3x pr-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
    
    <a class="carousel-control-next" href="#multi-item-example" data-slide="next">
    	<i class="fas fa-angle-right fa-3x pl-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
  
  <!--/.Controls-->

</div>
<!--/.Carousel Wrapper-->
</section>
<!--Section: Cards-->


<img class="recipe2" style="vertical-align:-70px" src="${pageContext.request.contextPath}/resources/img/icon/Tip 2.svg" />&nbsp;&nbsp;&nbsp;&nbsp;
       	<span style="font-size:45px;font-weight: bold;">식재료 별 유통기한</span>
        
            <section>
                <!--Grid row-->
                <div class="row wow fadeIn">
					<!--Carousel Wrapper-->
	<div id="multi-item-example2" class="carousel slide carousel-multi-item carousel-multi-item-2" data-ride="carousel">
	
  <!--Slides-->
  <div class="carousel-inner" role="listbox">

    <!--First slide-->
    <div class="carousel-item active">

      <div class="col-md-3 mb-3">
        <div class="card">
          	  <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/가지.png" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          	  <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/감자.png" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid"  src="${pageContext.request.contextPath}/resources/img/tip/달걀.jpg" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid"  src="${pageContext.request.contextPath}/resources/img/tip/고구마.png" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

    </div>
    <!--/.First slide-->

    <!--Second slide-->
    <div class="carousel-item">

      <div class="col-md-3 mb-3">
        <div class="card">
          <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid"  src="${pageContext.request.contextPath}/resources/img/tip/고사리.png" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid"  src="${pageContext.request.contextPath}/resources/img/tip/고추.png" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card">
          <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid"  src="${pageContext.request.contextPath}/resources/img/tip/굴.png" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title">채소류</h5>
                <!--Text-->
                <p class="card-text">냉동보관 8일<br>냉장보관 3일</p>
              </div>
        </div>
      </div>

      <%-- <div class="col-md-3 mb-3">
        <div class="card">
         
              <div>
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/white.png" class="card-img-top">
              </div>

        </div>
      </div> --%>
      
      <div class="col-md-3 mb-3">
        <div>
          <div>
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/white.png">
          		
            </div>
        </div>
      </div>

    </div>
    <!--/.Second slide-->

  </div>
  <!--/.Slides-->
  
  <!--Controls-->
  
    <a class="carousel-control-prev" href="#multi-item-example2" data-slide="prev">
    	<i class="fas fa-angle-left fa-3x pr-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
    
    <a class="carousel-control-next" href="#multi-item-example2" data-slide="next">
    	<i class="fas fa-angle-right fa-3x pl-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
  
  <!--/.Controls-->

</div>
<!--/.Carousel Wrapper-->

<div class="mb-5"></div>

</section>
<!--Section: Cards-->


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