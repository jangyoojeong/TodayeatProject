<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>season_sub</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="${pageContext.request.contextPath}/resources/css/style.min.css" rel="stylesheet">
    
    <style type="text/css">
      
      html,
       body,
       header,
       .carousel {
         height: 100vh;
       }
       
      .carousel-indicators{
         bottom: 10%;
      }
      
      .carousel-control-prev, .carousel-control-next{
         top: 3.5%;
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
      
      .pagination.pg-b .page-item.active .page-link {
           background-color: #0b6623; }
        .pagination.pg-b .page-item.active .page-link:hover {
          background-color: #0b6623; }
          
       .recipe {
          width: 30%;
          height: 30%;
       }
       
       .green-text {
           color: #0b6623 !important; }
        
        .red-text {
           color: #980000 !important; }
      
   </style>
</head>

<body>
<div class="page">
      <div class="contents_wrap">
      
    <!--Main layout-->
    <main class="mt-0 pt-0">
            <section>
            <!--Carousel Wrapper-->
            <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">

      <!--Indicators-->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-1z" data-slide-to="1"></li>
        <li data-target="#carousel-example-1z" data-slide-to="2"></li>
        <li data-target="#carousel-example-1z" data-slide-to="3"></li>
      </ol>
      <!--/.Indicators-->

      <!--Slides-->
      <div class="carousel-inner" role="listbox">
        <!--First slide-->
        <div class="carousel-item active">
          <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/sub/spring.jpg'); background-repeat: no-repeat; background-size: cover;">

            <!-- Mask & flexbox options-->
            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

              <!-- Content -->
              <div class="text-center white-text mx-5 wow fadeIn">
                 <h1 class="mb-4"><strong>“봄”</strong></h1>
                <h3 class="mb-2"><strong>한 해의 시작을 알리는 봄</strong></h3>
                <h3 class="mb-2"><strong>싱그러운 채소요리 어떠신가요?</strong></h3>
                <br><br>
                <a href="season_sub.do?season=봄&f1=딸기&f2=달래&f3=더덕" class="btn btn-outline-white btn-lg">딸기</a>
                &nbsp; &nbsp; 
              <a href="season_sub.do?season=봄&f1=딸기&f2=달래&f3=더덕" class="btn btn-outline-white btn-lg">달래</a>
                &nbsp; &nbsp; 
              <a href="season_sub.do?season=봄&f1=딸기&f2=달래&f3=더덕" class="btn btn-outline-white btn-lg">더덕</a>
                
              </div>
              <!-- Content -->

            </div>
            <!-- Mask & flexbox options-->

          </div>
        </div>
        <!--/First slide-->

        <!--Second slide-->
        <div class="carousel-item">
          <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/sub/summer.jpg'); background-repeat: no-repeat; background-size: cover;">

            <!-- Mask & flexbox options-->
            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

              <!-- Content -->
              <div class="text-center white-text mx-5 wow fadeIn">
                 <h1 class="mb-4"><strong>“여름”</strong></h1>
                <h3 class="mb-2"><strong>열대야가 기승을 부리는 무더운 여름</strong></h3>
                <h3 class="mb-2"><strong>무더위에 지친 이를 위한 요리 궁금하지 않나요?</strong></h3>
                <br><br>
                <a href="season_sub.do?season=여름&f1=전복&f2=도라지&f3=장어" class="btn btn-outline-white btn-lg">전복</a>
                &nbsp; &nbsp; 
              	<a href="season_sub.do?season=여름&f1=전복&f2=도라지&f3=장어" class="btn btn-outline-white btn-lg">도라지</a>
                &nbsp; &nbsp; 
              	<a href="season_sub.do?season=여름&f1=전복&f2=도라지&f3=장어" class="btn btn-outline-white btn-lg">장어</a>
              </div>
              <!-- Content -->

            </div>
            <!-- Mask & flexbox options-->

          </div>
        </div>
        <!--/Second slide-->

        <!--Third slide-->
        <div class="carousel-item">
          <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/sub/autom.jpg'); background-repeat: no-repeat; background-size: cover;">

            <!-- Mask & flexbox options-->
            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

              <!-- Content -->
              <div class="text-center white-text mx-5 wow fadeIn">
              <h1 class="mb-4"><strong>“가을”</strong></h1>
                <h3 class="mb-2"><strong>맛과 영양으로 무장한 가을</strong></h3>
                <h3 class="mb-2"><strong>맛과 건강까지 사로잡는 요리 어떠신가요?</strong></h3>
                <br><br>
                <a href="season_sub.do?season=가을&f1=무&f2=꽃게&f3=버섯" class="btn btn-outline-white btn-lg">무</a>
                &nbsp; &nbsp; 
              	<a href="season_sub.do?season=가을&f1=무&f2=꽃게&f3=버섯" class="btn btn-outline-white btn-lg">꽃게</a>
                &nbsp; &nbsp; 
              	<a href="season_sub.do?season=가을&f1=무&f2=꽃게&f3=버섯" class="btn btn-outline-white btn-lg">버섯</a>
              </div>
              <!-- Content -->

            </div>
            <!-- Mask & flexbox options-->

          </div>
        </div>
        <!--/Third slide-->
        
        <!--forth slide-->
        <div class="carousel-item">
          <div class="view" style="background-image: url('${pageContext.request.contextPath}/resources/img/sub/winter.jpg'); background-repeat: no-repeat; background-size: cover;">

            <!-- Mask & flexbox options-->
            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

              <!-- Content -->
              <div class="text-center white-text mx-5 wow fadeIn">
              <h1 class="mb-4"><strong>“겨울”</strong></h1>
                <h3 class="mb-2"><strong>몸도 마음도 추운 겨울</strong></h3>
                <h3 class="mb-2"><strong>우리의 마음까지도 따뜻하게 하는 요리 궁금하지 않나요?</strong></h3>
                <br><br>
                <a href="season_sub.do?season=겨울&f1=배추&f2=홍합&f3=굴" class="btn btn-outline-white btn-lg">배추</a>
                &nbsp; &nbsp; 
                <a href="season_sub.do?season=겨울&f1=배추&f2=홍합&f3=굴" class="btn btn-outline-white btn-lg">홍합</a>
                &nbsp; &nbsp; 
                <a href="season_sub.do?season=겨울&f1=배추&f2=홍합&f3=굴" class="btn btn-outline-white btn-lg">굴</a>
              </div>
              <!-- Content -->

            </div>
            <!-- Mask & flexbox options-->

          </div>
        </div>
        <!--/forth slide-->

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
            
            
            </section>
            <!-- /Section-->

        
    </main>
    <!--Main layout-->
      <jsp:include page="../main/footer.jsp" /> <!-- 푸터부분 삽입 -->
   
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
        
        $('.carousel').carousel({
           interval:3000
        })
    </script>
</body>
<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->

</html>