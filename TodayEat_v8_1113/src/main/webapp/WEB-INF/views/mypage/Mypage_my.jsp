<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel ="stylesheet" href="${pageContext.request.contextPath }/resources/css/My.css">
<link type ="text/css" rel = "stylesheet" href= "${pageContext.request.contextPath}/resources/css/Interest.css">
<script type ="text/javascript" src ="${pageContext.request.contextPath }/resources/js/check.js"></script>
</head>
<body>

<script type="text/javascript">
function selectDelete(){
	var a = document.chkForm;
	a.submit();
}
</script>

<div id ="page"  style="margin-top:210px; height: 100%; min-width: 800px;">

   <div id="jb-container">
   
      <div id="jb-content">

   <form name="chkForm" action="deleteRecipe.do" method ="post">


   <div id ="mypage_logo">
      <img src ="${pageContext.request.contextPath }/resources/img/icon/MyPage.svg" style ="width:300px">
   </div>
   
   <div id ="menu_nav" >
      <ul>
         <li><a href="Mypage_info.do" >회원정보</a></li>
         <li><a href="listKeep.do?nickname=${login_nickname}" >관심 레시피</a></li>
         <li><a href="Mypage_my.do?nickname=${login_nickname}" class = "current">나의 레시피</a></li>
         <li><a href="Mypage_membership.do">유료 회원전환</a></li>
      </ul>
   </div>
   
      <div id ="btn_location">
            <input class =btn_styled type ="button" value ="전체 선택" onclick = "this.value=check(this.form.recipe_no_s)">
            <input class =btn_styled  type ="button"  value ="삭제하기" onclick="selectDelete()">
      </div>
      
      
   <div id = "recipe_list">
      <c:if test="${!empty myRecipe}">
         <ul>
               <c:forEach var = "my" items = "${myRecipe }">
                  <li>
                     <input type ="checkbox" name ="recipe_no_s" value ="${my.recipe_no }">
                     <a href="updateRecipe_view.do?recipe_no=${my.recipe_no}"><img src ="/img/${my.complete_img}" style ="width:200px;"></a>
                     <h3>[${my.recipe_title}]</h3>
                  </li>
               </c:forEach>
         </ul>
      </c:if>
      <c:if test="${empty myRecipe}">
         
            <span class = "em_recipe">-등록한 레시피가 없습니다.-</span>
         
      </c:if>
   </div>
   
</form>   
   
   
      </div>
   </div>
   
   <div id ="footer">
      <jsp:include page="../main/footer.jsp" />
   </div>
   
</div>
   
</body>
      <jsp:include page ="../main/header.jsp" />
</html>