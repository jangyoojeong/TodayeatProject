<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 레시피</title>
<link type ="text/css" rel = "stylesheet" href= "${pageContext.request.contextPath}/resources/css/Interest.css">
<script type ="text/javascript" src ="${pageContext.request.contextPath}/resources/js/check.js"></script>

</head> 
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
<script type="text/javascript">
function selectDelete(){
	var a = document.chkForm;
	a.submit();
}
</script>

<div id ="page">

	<div id="jb-container">
	
		<div id="jb-content">
		
			<form name ="chkForm"  action ="deleteKeep.do" method ="post" > 
			<%-- <input name="login_nickname" type="hidden" value="${login_nickname }"/> --%>
				<div id ="mypage_logo">
					<img src = "${pageContext.request.contextPath }/resources/img/icon/MyPage.svg" style ="width:300px">
				</div>
				
				<div id ="menu_nav" >
					<ul>
						<li><a href="Mypage_info.do" >회원정보</a></li>
						<li><a href="listKeep.do?nickname=${login_nickname}" class = "current">관심 레시피</a></li>
						<li><a href="Mypage_my.do?nickname=${login_nickname}">나의 레시피</a></li>
						<li><a href="Mypage_membership.do">유료 회원전환</a></li>
					</ul>
				</div>
					<div class ="btn_styled">			
							<input class ="allCheck_btn" type ="button" value ="전체 선택" onclick = "this.value=check(this.form.keep_id_s)" >
							<input class ="selectDelete_btn" type ="button"  value ="삭제하기"  onclick="selectDelete()"> 
					</div>
		
		
	<div class = "a">	
		<c:if test="${!empty kList}">
		
			<table class ="rc_table" id="rc_table" style ="width: 815px;">
				<c:forEach var = "k1" items = "${kList}">
				
					<tr>
						<td>	
							<div class = "recipe1" id ="recipe1">
							
								<input type ="checkbox"  name ="keep_id_s" class= "chBox" value="${k1.keep_id }">
								<a href="searchOneRecipe.do?recipe_no=${k1.recipe_no}"><img src = "/img/${k1.complete_img}" style ="border-radius: 5px;
								width: 250px; height:180px;" ></a>
							</div>
							<div class = "ex_recipe1">
								<h3>${k1.nickname}의 ${k1.recipe_title}</h3>
								
								<p class ="x">사용재료</p>
								<p class ="e">${k1.material_food }</p>
							<div class ="ex_thumb">								
								<div class ="text">
									<strong class ="green">추천</strong>
									<strong class ="red">비추천</strong>
								</div>
								<img src ="${pageContext.request.contextPath }/resources/img/icon/good_icon.svg" style ="width:30px; padding:10px 5px 0px 0px;">
								<img src="${pageContext.request.contextPath }/resources/img/icon/bad_icon.svg" style ="width:30px; padding: 10px 10px 0px 0px;">
									<div class="count">
										<b style="margin-left:10px;" class="green">${k1.recipe_good }</b> <b style ="margin-left:27px;" class="red">${k1.recipe_bad }</b>  
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${empty kList}">
			  <span class ="em_recipe">-관심 레시피가 없습니다.-</span>
		</c:if>
	</div>
	</form>	
		</div>
	</div>
	
	
	<!--페이징 부분-->
<!--                 <nav class="d-flex justify-content-center wow fadeIn">
                    <ul class="pagination pg-b">
                        Arrow left
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>

                        <li class="page-item active">
                            <a class="page-link" href="#">1
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav> -->
     <!--페이징 부분-->
     
     <div id ="footer">
			<jsp:include page="../main/footer.jsp" />
		</div>
     
	</div>	 
			
		

</body>
			<jsp:include page ="../main/header.jsp" />

</html>