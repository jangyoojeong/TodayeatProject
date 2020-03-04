<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
          width: 25%;
          height: 25%;
       }
       
       .green-text {
           color: #0b6623 !important; }
        
        .red-text {
           color: #980000 !important; }
           
        .img-fluid {
           width: 100%;
           height: 237px;
           object-fit: cover;
        }
        
        .col-xs-1 img {
           display: block; 
           margin: 0px auto;
        }
        

   </style>
</head>

<body>
<div class="page">
      <div class="contents_wrap">
      
    <!--Main layout-->
    <!-- <main class="mt-5 pt-5"> -->
    <main class="mt-5 pt-5">
        <div class="container">
             <div class="mt-3">
         <h2 class="h1 text-center mb-3">“${seasoninfo.getSeason()}철 제철음식입니다”</h2>
            
            <br><br>
            <!--Grid row-->
                <div class="row mb-3 wow fadeIn">
                    <!--Grid column-->
                    <div class="col-lg-4 col-xs-1">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay rounded z-depth-1">
                            <img src="${pageContext.request.contextPath}/resources/img/season/${seasoninfo.getSeason_img1()}" class="img-fluid">
                            </div>
                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-4 col-xs-1">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay rounded z-depth-1">
                            <img src="${pageContext.request.contextPath}/resources/img/season/${seasoninfo.getSeason_img2()}" class="img-fluid">
                           </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-4 col-xs-1">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay rounded z-depth-1">
                            <img src="${pageContext.request.contextPath}/resources/img/season/${seasoninfo.getSeason_img3()}" class="img-fluid">
                           </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->
            </div>
            
            <div class="mt-3 pt-3 md-3 pd-3" style="color: #8C8C8C;">
                     출처 : 한국농수산식품유통공사
         </div>
            
           <br><br>
           <img src="${pageContext.request.contextPath}/resources/img/icon/Recipe.svg" class="recipe"/>
         
         <!-- 레시피 리스트 -->
            <section>
            <br><br>
            
                <c:choose>
                   
                   <c:when test="${fn:length(season_page.rvo) == 0}">
                   
                      <h3 class="mb-3 font-weight-bold">
                            <strong class="green-text">검색 결과가 없습니다.</strong>
                        </h3>
                       <br><br><br><br><br><br><br><br>
                   </c:when>
                   
                  <c:otherwise>
            
            
            <c:forEach var = "search" items = "${season_page.rvo}">
            
                <!--Grid row-->
                <div class="row wow fadeIn">
                
                    <!--Grid column-->
                    <div class="col-lg-5 col-xl-4 mb-2">
                        <!--Featured image-->
                        <div class="view overlay rounded z-depth-1">
                            <img src="/img/${search.complete_img}" class="img-fluid">
                               <a href="searchOneRecipe.do?recipe_no=${search.recipe_no}">
                     <div class="mask rgba-black-slight">
                       </div>
                        </a>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                   
                    <div class="col-lg-5 col-xl-4 mb-4">
                        <h3 class="mb-3 font-weight-bold green-text text-left" style="word-break: keep-all;">
                            <strong>${search.getRecipe_title()}</strong>
                        </h3>
                        <h5 class="mb-0 font-weight-bold text-left">
                            <strong>[사용재료]</strong>
                        </h5>
                        
                        <h6 class="mt-1" style="word-break: keep-all;">
                           <p class="text-left">${search.getMaterial_food()}</p>
                        </h6>
                        
                    </div>
                    <!--Grid column-->
                    
                    <!-- <div class="col-lg-3 col-xl-3 ml-xl-2 mb-2"> -->
                    <div class="col-lg-4 col-xl-4 mb-4">
                       <div style="width:170px; float: left;">
                          <h4 class="mb-3 font-weight-bold text-center">
                            <strong class="green-text">추천</strong>
                           </h4>
                       </div>
                       
                       <div style="width:170px; float: right;">
                          <h4 class="mb-3 font-weight-bold text-center">
                            <strong  class="red-text">비추천</strong>
                           </h4>
                       </div>
                       
                       <div style="width:170px; float: left;">
                            <i class="far fa-thumbs-up" aria-hidden="true" style="color:#0b6623;font-size:75px;"></i>
                       </div>
                       
                       <div style="width:170px; float: right;">
                          <i class="far fa-thumbs-down" aria-hidden="true" style="color:#980000;font-size:75px;"></i>
                       </div>
                       
                       <div style="width:170px; float: left;">
                            <h5 class="mt-3 font-weight-bold text-center">
                            <strong>${search.recipe_good}</strong>
                           </h5>
                       </div>
                       
                       <div style="width:170px; float: right;">
                            <h5 class="mt-3 font-weight-bold text-center">
                            <strong>${search.recipe_bad}</strong>
                           </h5>
                       </div>
                         
                    </div>
                    
                   
                </div>
                <!--Grid row-->
                
                <hr class="mb-4">
                 </c:forEach>
                 </c:otherwise>
                 </c:choose>
                
                <!--Pagination-->
                <nav class="d-flex justify-content-center wow fadeIn mb-4">
                   
                    <ul class="pagination pg-b">
                        
                        <c:if test="${season_page.hasArticles()}">
                        
                           <c:if test="${season_page.startPage > 5}">
                        
                              <li class="page-item">
                                  <a class="page-link" href="season_sub.do?pageNo=${season_page.startPage - 5 }&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                      <span class="sr-only">Previous</span>
                                  </a>
                              </li>
                              
                     </c:if>
                  
                        <c:forEach var = "pNo" begin = "${season_page.startPage}" end="${season_page.endPage }">
                        
                        <c:if test="${ pNo eq season_page.getCurrentPage() }">
                           <li class="page-item active">
                            <a class="page-link" href="season_sub.do?pageNo=${pNo}&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}">${pNo}
                                <span class="sr-only">(current)</span>
                            </a>
                           </li>
                  </c:if>
                        
                        <c:if test="${ pNo ne season_page.getCurrentPage() }">
                        <li class="page-item">
                            <a class="page-link" href="season_sub.do?pageNo=${pNo}&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}">${pNo}</a>
                        </li>
                        </c:if>
                        
                        </c:forEach>
                        
                        <c:if test="${season_page.endPage < season_page.totalPages }">

                           <li class="page-item">
                               <a class="page-link" href="season_sub.do?pageNo=${season_page.startPage + 5}&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}" aria-label="Next">
                                   <span aria-hidden="true">&raquo;</span>
                                   <span class="sr-only">Next</span>
                               </a>
                           </li>
                        
                        </c:if>
                        
                        </c:if>
                    </ul> 
                  
                       
                  
                  <%-- <c:if test="${season_page.hasArticles()}">
                  
                        <c:if test="${season_page.startPage > 5}">
                           <a href="season_sub.do?pageNo=${season_page.startPage - 5 }&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}">[이전]</a>
                           
                        </c:if>
                        <c:forEach var = "pNo" begin = "${season_page.startPage}" end="${season_page.endPage }">
                           <a href = "season_sub.do?pageNo=${pNo}&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}">[${pNo}]</a>   
                        </c:forEach>
                        
                        <c:if test="${season_page.endPage < season_page.totalPages }">
                           <a href = "season_sub.do?pageNo=${season_page.startPage + 5}&season=${season}&f1=${f1}&f2=${f2}&f3=${f3}">[다음]</a>
                        </c:if>
                     
                  </c:if> --%>
                    
                    
                    
                    
                    
                </nav>
                <!--Pagination-->
            
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
        
        $('.carousel').carousel({
           interval:3000
        })
    </script>
</body>
<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->

</html>