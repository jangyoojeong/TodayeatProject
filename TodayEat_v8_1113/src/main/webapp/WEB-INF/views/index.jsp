<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>오늘뭐먹지?</title>
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
  
  <!-- Material Design Bootstrap -->
  <link href="${pageContext.request.contextPath}/resources/css/mdb.min.css" rel="stylesheet">
  
  <!-- Your custom styles (optional) -->
  <link href="${pageContext.request.contextPath}/resources/css/style.min.css" rel="stylesheet">
  <!---------------------------------------------------------------------------------------------------------------->
<!-- 한글과 띄어쓰기만 입력 가능 -->
	<script
	  src="https://code.jquery.com/jquery-1.11.0.js"
	  integrity="sha256-zgND4db0iXaO7v4CLBIYHGoIIudWI5hRMQrPB20j0Qw="
	  crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	
	 $("input:text[name=query]").on("keyup", function() {
		    $(this).val($(this).val().replace( /[^가-힣\s]/g,""));
		});
	});
	</script>

<!---------------------------------------------------------------------------------------------------------------->
  
  <style type="text/css">
    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
        background: #1C2331 !important;
      }
    }
    
    @media (max-width: 720px) {
		.buscar-caja { width: 450px; }
		.buscar-txt { width: 400px; }
    	
	}

	@media (min-width: 720px) and (max-width: 990px) {
		.buscar-caja { width: 550px; }
    	.buscar-txt { width: 500px; }	
	}

	@media (min-width: 990px) {
		.buscar-caja { width: 650px; }
    	.buscar-txt { width: 600px; }	
	}
	
	
    .navbar-brand img{
	width: 350px;
	height: 95px;
	}
	
	.container-fluid{
  	padding-right: 100px;
  	padding-left: 30px;
  	/* margin-right: auto;
  	margin-left: auto; */
	}
    

  </style>
  
  <link href="${pageContext.request.contextPath}/resources/css/search.css" rel="stylesheet">
</head>

<body>


  
  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container-fluid">

      <!-- Brand -->
      <a class="navbar-brand" href="index.do">
        <img src="${pageContext.request.contextPath}/resources/img/icon/Logo_main.svg"/>
      </a>
<!----------------------------------------------------------------------------------------Login--------->
        <!-- Right -->
        <ul class="navbar-nav nav-flex-icons">
        
				<c:if test="${empty login_id }">
					<li class="nav-item"><a href="login.do"
						class="nav-link border border-light rounded"> <i
							class="fas fa-sign-in-alt mr-2"></i>Login
					</a></li> &nbsp; &nbsp;
<!----------------------------------------------------------------------------------------Login--------->
<!----------------------------------------------------------------------------------------Join--------->

					<li class="nav-item"><a href="join.do"
						class="nav-link border border-light rounded"> <i
							class="fas fa-user-plus mr-2"></i>Join
					</a></li>
					
<!----------------------------------------------------------------------------------------Join--------->
<!----------------------------------------------------------------------------------------Logout--------->
         		</c:if>
         		
				<c:if test="${not empty login_id }">
					<li class="nav-item"><a href="logout.do"
						class="nav-link border border-light rounded"> <i
							class="fas fa-sign-out-alt"></i>Logout
					</a></li> 	&nbsp; &nbsp; 
<!----------------------------------------------------------------------------------------Logout--------->
<!----------------------------------------------------------------------------------------MyPage--------->
					
         		<li class="nav-item"><a href="Mypage_info.do"
						class="nav-link border border-light rounded"> <i
							class="fas fa-male"></i>MyPage
					</a></li>
				</c:if>
<!----------------------------------------------------------------------------------------MyPage--------->


        </ul>

      </div>

    <!-- </div> -->
  </nav>
  <!-- Navbar -->
  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
	
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
 
 <!----------------------------------------------------------------------------------------Search----------->
 
    	<form action="test.do" id="search" class="carousel-content">
    		<div class="buscar-caja"> 
       			<input type="text" id="test" name="query"  class="buscar-txt" placeholder="검색 :   '한글' 과 '띄어쓰기'만 입력 가능 합니다" /> 
 				<a class="buscar-btn" onclick="document.getElementById('search').submit();">
        		<i class="fa fa-search"></i></a>
    		</div> 
    	</form>
<!-----------------------------------------------------------------------------------------Search----------->
    <!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-1z" data-slide-to="1"></li>
      <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
    	
      <!--First slide-->
      <div class="carousel-item active">
        <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/main/back1.jpg'); background-repeat: no-repeat; background-size: cover;">

          <!-- Mask & flexbox options-->
          <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

            <!-- Content -->
            <div class="text-center white-text mx-5 wow fadeIn">
              <br><br><br><br><br><br><br><br><br><br>
              <h3 class="mb-4">
                <strong>오늘 뭐 먹을지 못 고르시겠다구요?</strong>
              </h3>
			  <h4 class="mb-4">
			  	<strong>주부들의 고충! 이제 "오늘 뭐 먹지?"에게 맡겨주세요!</strong>
			  </h4>
              
              <a href="tip_main.do" class="btn btn-outline-white btn-lg">TIP코너</a>
              &nbsp; &nbsp; 
              <a href="season_main.do" class="btn btn-outline-white btn-lg">계절별 제철음식</a>
              &nbsp; &nbsp; 
              <a href="my_recipe_search.do" class="btn btn-outline-white btn-lg">먹지들의 레시피</a>
              &nbsp; &nbsp; 
              <a href="test.do" class="btn btn-outline-white btn-lg">레시피 BOOK</a>
              </div>	
           
            <!-- Content -->

          </div>
          <!-- Mask & flexbox options-->

        </div>
      </div>
      <!--/First slide-->

      <!--Second slide-->
      <div class="carousel-item">
        <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/main/back2.jpg'); background-repeat: no-repeat; background-size: cover;">

          <!-- Mask & flexbox options-->
          <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

            <!-- Content -->
            <div class="text-center white-text mx-5 wow fadeIn">
            <br><br><br><br><br><br><br><br><br><br>
              <h3 class="mb-4">
                <strong>오늘 뭐 먹을지 못 고르시겠다구요?</strong>
              </h3>
			  <h4 class="mb-4">
			  	<strong>주부들의 고충! 이제 "오늘 뭐 먹지?"에게 맡겨주세요!</strong>
			  </h4>

              <a href="tip_main.do" class="btn btn-outline-white btn-lg">TIP코너</a>
              &nbsp; &nbsp; 
              <a href="season_main.do" class="btn btn-outline-white btn-lg">계절별 제철음식</a>
              &nbsp; &nbsp; 
              <a href="my_recipe_search.do" class="btn btn-outline-white btn-lg">먹지들의 레시피</a>
              &nbsp; &nbsp; 
              <a href="test.do" class="btn btn-outline-white btn-lg">레시피 BOOK</a>
             </div>
            <!-- Content -->

          </div>
          <!-- Mask & flexbox options-->

        </div>
      </div>
      <!--/Second slide-->

      <!--Third slide-->
      <div class="carousel-item">
        <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/main/back3.jpg'); background-repeat: no-repeat; background-size: cover;">

          <!-- Mask & flexbox options-->
          <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

            <!-- Content -->
            <div class="text-center white-text mx-5 wow fadeIn">
            <br><br><br><br><br><br><br><br><br><br>
              <h3 class="mb-4">
                <strong>오늘 뭐 먹을지 못 고르시겠다구요?</strong>
              </h3>
			  <h4 class="mb-4">
			  	<strong>주부들의 고충! 이제 "오늘 뭐 먹지?"에게 맡겨주세요!</strong>
			  </h4>

              <a href="tip_main.do" class="btn btn-outline-white btn-lg">TIP코너</a>
              &nbsp; &nbsp; 
              <a href="season_main.do" class="btn btn-outline-white btn-lg">계절별 제철음식</a>
              &nbsp; &nbsp; 
              <a href="my_recipe_search.do" class="btn btn-outline-white btn-lg">먹지들의 레시피</a>
              &nbsp; &nbsp; 
              <a href="test.do" class="btn btn-outline-white btn-lg">레시피 BOOK</a>
             </div>
            <!-- Content -->

          </div>
          <!-- Mask & flexbox options-->

        </div>
      </div>
      <!--/Third slide-->

    </div>
    <!--/.Slides-->

    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->

  </div>
  <!--/.Carousel Wrapper-->

  <!--Main layout-->
  <main>
    <div class="container">

      <!--Section: Main info-->
      <section class="mt-5 wow fadeIn">
      </section>
    </div>
  </main>
  <!--Main layout-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
    
    $('.carousel').carousel({
    	interval:3500
    })

  </script>
</body>
</html>