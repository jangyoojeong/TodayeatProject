<%@page import="com.todayeat.tip.vo.TipVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	int tipnum = (int) request.getAttribute("tipnum");
	
	ArrayList <TipVO> tarray = new ArrayList <TipVO>();
	tarray = (ArrayList <TipVO>) request.getAttribute("tipinfo");
	
	System.out.println("t리스트0 : " + tarray.get(0).getTimg());
	System.out.println("t리스트1 : " + tarray.get(1).getTimg());
	System.out.println("t리스트2 : " + tarray.get(2).getTimg());
	System.out.println("t리스트3 : " + tarray.get(3).getTimg());
	
	int slide_turn = tipnum/4; //슬라이드 회전수
	int slide_nam = tipnum%4; //슬라이드 갯수 묶음을 뺀 나머지
	int slide_num = 1; //슬라이드 순서
	int circle_cho = 0; //두번째 for문 초기치
	
	if(slide_nam != 0)
		slide_turn +=1;
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
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
    	
    	.card-text {   	
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
        
        <img class="recipe" style="vertical-align:-70px" src="${pageContext.request.contextPath}/resources/img/icon/Tip 1.svg" />&nbsp;&nbsp;&nbsp;&nbsp;
       	<span style="font-size:45px;font-weight: bold;">식재료 보관</span>
        
            <section>
                <!--Grid row-->
                <div class="row wow fadeIn">
					<!--Carousel Wrapper-->
	<div id="multi-item-example" class="carousel slide carousel-multi-item carousel-multi-item-2" data-ride="carousel">
	
  <!--Slides-->
  <div class="carousel-inner" role="listbox">
	
	<% for(int i=0; i<slide_turn; i++) { 
		if(slide_num == 1) {
	%>
	    <!--First slide-->
	    <div class="carousel-item active">
	<% } else { %>
		<div class="carousel-item">
	<% } %>
	<% for(int j=circle_cho; j<4+circle_cho; j++) { 
		if(tipnum > j) {
	%>
		
      <div class="col-md-3 mb-3">
        <div class="card">
        	<div class="view overlay rounded-0 z-depth-1">
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/<%=tarray.get(j).getTimg()%>">
          		<a href="tip_sub.do?tname=<%=tarray.get(j).getTname()%>">
				<div class="mask rgba-black-slight">
        		</div>
            	</a>
            </div>
        </div>
      </div>
      
    <% } else { %>
    	<div class="col-md-3 mb-3">
        <div>
        	<div>
          		<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/기본.png">
          		
            </div>
        </div>
      </div>
    <% } %>
	<% } 
	    slide_num++;
		circle_cho = circle_cho + 4;
	%>
	
    </div>
    <!--/.First slide-->
   <% } %>
  </div>
  <!--/.Slides-->
  
  <!--Controls-->
  	<% if(slide_num == 1) { 
  	} else { %>
    <a class="carousel-control-prev" href="#multi-item-example" data-slide="prev">
    	<i class="fas fa-angle-left fa-3x pr-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
    
    <a class="carousel-control-next" href="#multi-item-example" data-slide="next">
    	<i class="fas fa-angle-right fa-3x pl-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
   <% } %>
  <!--/.Controls-->
  
</div>
<!--/.Carousel Wrapper-->
</section>
<!--Section: Cards-->
<% slide_num = 1; 
   circle_cho = 0;
%>

<img class="recipe2" style="vertical-align:-70px" src="${pageContext.request.contextPath}/resources/img/icon/Tip 2.svg" />&nbsp;&nbsp;&nbsp;&nbsp;
       	<span style="font-size:45px;font-weight: bold;">식재료 별 유통기한</span>
        
            <section>
                <!--Grid row-->
                <div class="row wow fadeIn">
					<!--Carousel Wrapper-->
  <div id="multi-item-example2" class="carousel slide carousel-multi-item carousel-multi-item-2" data-ride="carousel">
	
  <!--Slides-->
  <div class="carousel-inner" role="listbox">

    <% for(int i=0; i<slide_turn; i++) { 
		if(slide_num == 1) {
	%>
	    <!--First slide-->
	    <div class="carousel-item active">
	<% } else { %>
		<div class="carousel-item">
	<% } %>
    <% for(int j=circle_cho; j<4+circle_cho; j++) { 
		if(tipnum > j) {
	%>
      <div class="col-md-3 mb-3">
        <div class="card" style="height:300px;" >
          	  <!--Card image-->
              <div class="view overlay">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/<%=tarray.get(j).getTimg()%>" class="card-img-top">
              </div>

              <!--Card content-->
              <div class="card-body">
                <!--Title-->
                <h5 class="card-title"><%=tarray.get(j).getTkinds()%></h5>
                <!--Text-->
                <p class="card-text"><%=tarray.get(j).getTdate()%></p>
              </div>
        </div>
      </div>
	  <% } else { %>
	  		<div class="col-md-3 mb-3">
        	<div>
          	  
              <div class="">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/tip/기본.png" class="card-img-top">
              </div>

        	</div>
      		</div>
	  <% } %>
      <% } 
        slide_num++;
		circle_cho = circle_cho + 4;
	%>

    </div> <!--/.First slide-->
    <% } %>
    
  </div>
  <!--/.Slides-->
  
  <!--Controls-->
  	<% if(slide_num == 1) { 
  	} else { %>
    <a class="carousel-control-prev" href="#multi-item-example2" data-slide="prev">
    	<i class="fas fa-angle-left fa-3x pr-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
    
    <a class="carousel-control-next" href="#multi-item-example2" data-slide="next">
    	<i class="fas fa-angle-right fa-3x pl-3" aria-hidden="true" style="color:#0b6623;"></i>
    </a>
   <% } %>
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