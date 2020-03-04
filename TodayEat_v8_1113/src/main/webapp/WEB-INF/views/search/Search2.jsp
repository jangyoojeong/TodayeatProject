<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 BOOK</title>

	<style type="text/css">
/*---------------------------------------------------------------------------------*/
/* 검색창 */
		.div1{							/* body & div */		
			width: 400px;				/* width랑 margin이랑 같이 설정해야, 창크기가 달라지면서 같이 움직임 */
		    margin: auto;
		    //padding: 100px auto;
		    //position: relative;
		    //background-color: #F7CAC9;
		    outline: 0;
		   
		}	
		.div11{
			margin: -80px 0px 100px 0px;
			 //background-color: #F7CAC9;
		}
		.search1{						/* div & text */
			margin:10px 0px auto;
			padding: 12px 24px;
			border-radius:50px;			/* 외관 둥굴게 만들기 */
			border:1px solid #575756;
			outline: 0;					/* 클릭시 파란색으로 생기는것을 없애는 것 */
			width:300px;
		
		}
		.search3{						/* div & text */
			margin:10px 0px auto;
			padding: 12px 24px;
			border-radius:50px;			/* 외관 둥굴게 만들기 */
			border:1px solid #575756;
			outline: 0;					/* 클릭시 파란색으로 생기는것을 없애는 것 */
			width:200px;
		
		}
		.img11{
			outline:0;
			width:20px;
			margin:-30px 200px 30px 290px;
		}
		.img1{							/* 검색 이모티콘 크기 & 위치 */
			outline:0;
			width:20px;
			margin:-30px 20px 30px 310px;
		}
/*---------------------------------------------------------------------------------*/
/* 필터 이미지 */
		.div2{
			width:100px;
			margin:20px auto;
			//position: relative;
			//background-color: #F7CAC9; 
		} 
		.img2{
			width:200px;
		}
/*---------------------------------------------------------------------------------*/
/* 체크 박스 */
		.div3{
			width:510px;
			margin:20px auto; 
			//position: relative;
			//background-color: #F7CAC9;
		}
		.button1{
			margin:0px 30px;
			font-size:25px; 
			font-weight:550;
			background-color:white;
			border:0;
			outline:0;
		}
		.input1{
			margin:0px 30px;
		}

				.switch1{					/* The switch - the box around the slider */
					position: relative;
					display: inline-block; 
					width: 60px;
					height: 34px;
				}
				.slider {
				  position: absolute;
				  cursor: pointer;
				  top: 0;
				  left: 0;
				  right: 0;
				  bottom: 0;
				  background-color: #ccc;
				  -webkit-transition: .4s;
				  transition: .4s;
				}
				.slider:before {
				  position: absolute;
				  content: "";
				  height: 26px;
				  width: 26px;
				  left: 4px;
				  bottom: 4px;
				  background-color: white;
				  -webkit-transition: .4s;
				  transition: .4s;
				}
				.slider.round {
				  border-radius: 34px;
				}
				
				.slider.round:before {
				  border-radius: 50%;
				}
				.switch input {				/* 선택자 안에서 띄어쓰기는 해당 태그 안에 태그를 선택하게 됩니다. */ 
				  opacity: 0;
				  width: 0;
				  height: 0;
				}
				input:checked + .slider {
				  background-color: #0B6623;
				}
				
				input:focus + .slider {
				  box-shadow: 0 0 1px #0B6623;
				}
				
				input:checked + .slider:before {
				  -webkit-transform: translateX(26px);
				  -ms-transform: translateX(26px);
				  transform: translateX(26px);
				}
/*---------------------------------------------------------------------------------*/
/* 추가 검책창 */
		.div4{							/* body & div */		
			width: 300px;				/* width랑 margin이랑 같이 설정해야, 창크기가 달라지면서 같이 움직임 */
		    height: 50px;
		    margin: 0px auto; 
		    //position: relative;
		    //background-color: #F7CAC9; 

		}				
		.search2{						/* div & text */
			margin: 10px 0px 0px 10px;
			padding: 4.6px 5px;
			outline: 0;					/* 클릭시 파란색으로 생기는것을 없애는 것 */
			width:150px;
		} 

 		.img3{							/* 검색 이모티콘 크기 & 위치 */
			outline:0; 
			width:30px;
			margin:-28.5px 20px 30px 202px;
		}
/*---------------------------------------------------------------------------------*/
/* 체크박스 */
		.div5{							/* body & div */		
			width: 450px;				/* width랑 margin이랑 같이 설정해야, 창크기가 달라지면서 같이 움직임 */
		    margin: 20px auto;
		    //padding: 0px auto;
		    //position: relative;
		    //background-color: #F7CAC9; 
		}
		.aa{
			padding : 0 10px
		}

.checks {position: relative;}

.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 17px;  /* 체크박스의 너비를 지정 */
  height: 17px;  /* 체크박스의 높이를 지정 */
  line-height: 25px; /* 세로정렬을 위해 높이값과 일치 */
  margin: 1px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  background: #e9ecee;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}

.checks.small input[type="checkbox"] + label {
  font-size: 12px;
}

.checks.small input[type="checkbox"] + label:before {
  width: 17px;
  height: 17px;
  line-height: 20px;
  font-size: 11px;
}

.checks.etrans input[type="checkbox"] + label {
  padding-left: 30px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: 0;
  opacity: .6;
  box-shadow: none;
  border-color: #0B6623;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity:1; 
  background: transparent;
  border-color:transparent #0B6623 #0B6623 transparent;
  border-top-color:transparent;
  border-left-color:transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}
/*---------------------------------------------------------------------------------*/
		.div6{
			margin: 15px 0px 150px 0px;
		}
		
		.div7 {
		    //position: relative;
		    //background-color: #F7CAC9;
			width: 600px;
			margin:0px auto;
		}
	   
		.div8{
			margin:100px 0px 0px 0px;
		}
		.div10{
			margin:100px 0px 0px 0px;
		}

		.div9{
			margin:200px 0px 20px 0px;
		}
	   .btn1 {
       width: 75px;
       height: 30px;
       border-radius: 1em;
       border: solid 1px #0B6623;
       background: #0B6623;
       color: white;
       outline: 0;
      }
      
      .img4 {
      width: 150px;
      height: 150px;
      border-radius: 1em;
      outline:0;
      }   
      
      .highlight{
      background-color:  #ddda6d;
      /* rgb(47,163,127) */
      /* #ffb7b0 */
      /* #ffcccc */
      }
      
      #float1 { float: left; padding:10px; outline: 0;}
      
      #fontstyle1 {
      font-size:12px;
      //background-color:yellow;
      }

 	  #fontstyle0 {
 	  
      font-size:12px;
      
      }
      
      input.good-btn {
      background: url("${pageContext.request.contextPath}/resources/img/icon/good_icon_black.svg") no-repeat;
      background-size: 20px 20px;
      border: none;
      width: 20px;
      height: 20px;
      cursor: pointer;
      outline:0;
      }
      
      input.bad-btn {
      background: url("${pageContext.request.contextPath}/resources/img/icon/bad_icon_black.svg") no-repeat;
      background-size: 20px 20px;
      border: none;
      width: 20px;
      height: 20px;
      cursor: pointer;
      outline:0;
      }
      
      #dd {
      
      padding:5px;
      }
  
  	  .table01 {
  	  	margin-bottom:100px;
  	  	width:350px ;
  	  	//background-color: #F7CAC9;
  	  }
  	.label2{
  			font-size:25px; 
			font-weight:550;
			color: #ddda6d;
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

</style>					
	
</head>
<!-------------------------------------------------------------------------------------------->
<!-------------------------------------------------------------------------------------------->
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
	
<!-- 국가 checkboxChecked -->
<!-------------------------------------------------------------------------------------------->
<!-- 국가 checkboxChecked -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
	
	<script type="text/javascript">


	
		 <c:forEach items="${list_country}" var="country">
		 	//console.log("${country}");
		 
		 if("${country}"=="한식"){
			$(document).ready(function() {
				$("input:checkbox[id=H]").prop("checked",true);
			});
		}
		 if("${country}"=="중식"){
				$(document).ready(function() {
					$("input:checkbox[id=C]").prop("checked",true);
				});
			}
		 if("${country}"=="일식"){
				$(document).ready(function() {
					$("input:checkbox[id=J]").prop("checked",true);
				});
			}
		 if("${country}"=="양식"){
				$(document).ready(function() {
					$("input:checkbox[id=A]").prop("checked",true);
				});
			}
		 
		</c:forEach> 
		/*이벤트처리*/
		$(document).ready(function(){
			//1
		    $(".check1").change(function(){
		        if($(".check1").is(":checked")){
			    		$( window ).one("scroll",function() {
			    			
			    			var a = document.research;
		    				a.submit();
			    				
			    		});
		        }else{
		        	$( window ).one("scroll",function() {
		    			
		    			var a = document.research;
	    				a.submit();
		    				
		    		});
		        }
		    });
		    //2
		    $(".check2").change(function(){
		        if($(".check2").is(":checked")){
			    		$( window ).one("scroll",function() {
			    			
			    			var a = document.research;
		    				a.submit();
			    				
			    		});
		        }else{
		        	$( window ).one("scroll",function() {
		    			
		    			var a = document.research;
	    				a.submit();
		    				
		    		});
		        }
		    });
		    //3
		    $(".check3").change(function(){
		        if($(".check3").is(":checked")){
			    		$( window ).one("scroll",function() {
			    			
			    			var a = document.research;
		    				a.submit();
		    				
			    		});
		        }else{
		        	$( window ).one("scroll",function() {
		    			
		    			var a = document.research;
	    				a.submit();
		    				
		    		});
		        }
		    });
		    //4
		    $(".check4").change(function(){
		        if($(".check4").is(":checked")){
			    		$( window ).one("scroll",function() {
			    			
			    			var a = document.research;
		    				a.submit();
			    				
			    		});
		        }else{
		        	$( window ).one("scroll",function() {
		    			
		    			var a = document.research;
	    				a.submit();
		    				
		    		});
		        }
		    });
		});
	</script>
<!-------------------------------------------------------------------------------------------->
<!-------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------------->

<body>
<div class="page">
<div class="contents_wrap">


	
	
<!-- 검색창 ------------------------------------------------------------------------------------->



	<form action="my_recipe_search.do" >
	<div class="div1" align="center">
		<br><br><br>
		<input class="search1" type="text" name="query" placeholder="토마토 감자" >
		<input class="img1" type="image" src="${pageContext.request.contextPath}/resources/img/icon/Search_main.svg" alt="검색이모티콘">
	</div>
	</form>
	

<!-- 검색창 ------------------------------------------------------------------------------------->
<!-- 식재료 추가 검색 ----------------------------------------------------------------------------------->


	<form action="my_recipe_search.do" method="post" name="research">	
	<div class="div1" align="center">
	
		<input class="search3" type="text" name="query" placeholder="추가검색" >
		<input class="img11" type="image" src="${pageContext.request.contextPath}/resources/img/icon/Search_main.svg" alt="검색이모티콘">
	</div>
	
	
<!-- 식재료 추가 검색 ----------------------------------------------------------------------------------->
<!-- 검색어 체크 박스 ----------------------------------------------------------------------------------->


	<div class="div5 checks etrans " align="center">
	<c:forEach items="${list_searchVO}" var="vo" > 
		<c:if test="${vo.query!=''}">
		<input type="checkbox" name="query" value="${vo.query}" id="ex_chk'${vo.i }'" checked="checked" class="check1"> <label for="ex_chk'${vo.i }'" class="aa" >${vo.query}</label>
  		</c:if>
   </c:forEach>
   </div>

   
<!-- 검색어 체크 박스 ----------------------------------------------------------------------------------->
<!-- 검색 버튼 ----------------------------------------------------------------------------------->

			
		   <div class="div6" align = "center">   
		      <input type="submit" class="btn1" value="검색" >
		   </div>
		   
		     	<c:if test="${no_recipe == 0 }">
					<label align="center" class="label2">해당 레시피 Coming Soon</label><br><br><br><br>
				</c:if>
			
		 </form>
		 </div>
 
 
<!-- 검색 버튼 ----------------------------------------------------------------------------------->
<!-- Recipe 로고 ----------------------------------------------------------------------------------->
<script type="text/javascript">

function a(){
	alert("로그인후 상세 레시피 볼수 있습니다.");
}
</script>

		
		<c:if test="${!empty list_recipeVO}">
		   <div class="div9" align="center" id="recipe_img">
		      <img  src="${pageContext.request.contextPath}/resources/img/icon/Recipe.svg" alt="필터이미지" class="img2">
		   </div>
   
   
<!-- Recipe 로고 ----------------------------------------------------------------------------------->
<!-- 하단 ReciepView ----------------------------------------------------------------------------------->


<c:forEach items="${list_recipeVO}" var="recipe" >

<input type="hidden" name="recipe_no" value="${recipe.recipe_no}">
   <div class = "div7">
	  	   <c:if test="${empty login_id }">
	      <input class="img2" id="float1" type="image" src="/img/${recipe.complete_img}" alt="필터이미지" onclick="a()">
		</c:if>
		<c:if test="${not empty login_id }">
	   <a href = "searchOneRecipe.do?recipe_no=${recipe.recipe_no}">
	      <input class="img2" id="float1" type="image" src="/img/${recipe.complete_img}" alt="필터이미지">
		</a>
		</c:if>
      <div>
	      <table class = "table01">
		      <tr>
			      <td colspan="${fn:length(list_recipeMaterialVO) }">
			      <c:if test="${empty login_id }">
			      <label onclick="a()">[ ${recipe.recipe_title} ]</label>
			      </c:if>
			      <c:if test="${not empty login_id }">
			      <a href = "searchOneRecipe.do?recipe_no=${recipe.recipe_no}">[ ${recipe.recipe_title} ]</a>  
			      </c:if>
			      </td>
			  </tr>
			  <tr>
			      <td colspan="4"> &nbsp </td><!-- 사용재료 -->
			  </tr>
			  <tr>
		
			  <c:forEach items="${list_recipeMaterialVO}" var="material" >
			  	<c:if test="${recipe.recipe_no==material.recipe_no }">
			  	<!--------------------------------------------------->
					<c:set var="n" value="1"/>
						<c:forEach items="${list_searchVO}" var="search">
							<c:if test="${n=='1' }">
								<c:set var="a" value="${material.material_food}"/>
								<c:set var="b" value="${search.query }"/>
						  			<c:if test="${fn:contains(a,b)}">				  			
							  				<td id="fontstyle0 " ><label class="highlight">${a }</label></td>
						  					<c:set var="n" value="0"/>
						  			</c:if>
				  			</c:if>
			  			</c:forEach>
					  			<c:if test="${!fn:contains(a,b)}">
					  				<td id="fontstyle1" >${material.material_food}</td>
								</c:if>
			  	<!--------------------------------------------------->
			    </c:if>
			  </c:forEach>
			  
			  </tr>
			  <tr>
			  	<td colspan="${fn:length(list_recipeMaterialVO)}">&nbsp</td>
			  </tr>
			  
			  <tr align="center">
			  		<td colspan="${fn:length(list_recipeMaterialVO)}" id="fontstyle1"> &nbsp&nbsp추천 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp비추천</td>
			  		<!-- <td colspan="" id="fontstyle1">비추천</td> -->
			  </tr>
			  <tr align="center">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<!-- 			      <td >													
			      	<input type="button" class="good-btn"></td> -->
			      <td colspan="${fn:length(list_recipeMaterialVO)}">&nbsp<input type="button" class="good-btn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			      	<input type="button" class="bad-btn"></td>
		      </tr>
		      <tr align="center">
			  		<%-- <td id="fontstyle1">${recipe.recipe_good }</td> --%>
			  		<td colspan="${fn:length(list_recipeMaterialVO)}" id="fontstyle1">&nbsp${recipe.recipe_good }&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${recipe.recipe_bad }</td>
			  </tr>
	      </table>
      </div>
      
   </div>
</c:forEach>
</c:if>



<!-- 하단 ReciepView ----------------------------------------------------------------------------------->




   <jsp:include page="../main/footer.jsp" /> <!-- 푸터부분 삽입 --> 

  </div>
</div>
<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->

</body>
</html>