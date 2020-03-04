<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<jsp:include page="../main/header.jsp" />
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.login_wrap{
	
	margin: 0 auto;
	margin-top: 210px;
	width: 600px;
	height:100%;
	min-height: 800px;
	text-align: center;
}

.login_logo{
		margin: 0 auto;
		width: 300px;
		height: 70px;
}

.login_logo img{
		margin-top:80px;
		width: 300px;
		height: 70px;
}

.login_form{
		margin-top:100px;

}


.login_input{
		width: 300px;
		height: 25px;
}

.id_chk{
		margin-left:150px;
		text-align:left;
}

.search_wrap{
		margin-left:150px;
		text-align:left;
		
}

.search_wrap a:hover{
		text-decoration: none; border-bottom: 2px solid #0B6623; padding-bottom: 2px;
}

.id_search{
		margin-right:5px;
}

.pwd_search{
		margin-right:65px;
}

.login_join{

}

</style>
</head>
<body>

	<div class="login_wrap">
		<div class="login_logo">
			<img src="${pageContext.request.contextPath}/resources/img/icon/Login.svg">
		</div><br>
		<div class="login_form">
			<form id="login" action="login-post" method="post">
				
      			<input class="login_input" type="text"  name="id" placeholder="ID" required="required" autofocus="autofocus"><br><br>
     	 		<input class="login_input" type="password"  name="password" placeholder="PASSWORD" required="required"><br><br>
     	 		
				<div class="id_chk">
					<input type = "checkbox" id ="id_chk">
					<label for ="id_chk">아이디 기억하기</label>
				</div><br>

				<div class="btn_wrap">
					<input type="submit" value="로그인"
						style="background-color: #0B6623; color: #FFFFFF; border: 0; width: 300px; height: 40px;">
				</div>
				<br>
				<div class="search_wrap">
				
					<a href="idsearch.do" class="id_search">아이디 찾기</a>
				
					<a href="pwdsearch.do" class="pwd_search">비밀번호 찾기</a>
				
					<a href="join.do" class="login_join">회원가입</a>
				
			</div>
				
			</form>
		
		</div>
		
	</div>
               <!-- 이부분 변수들 수정해야댐 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
/* 로그인 실패 */
	$('#login_fail').hide();
	if ('${login_fail}' === 'fail') {
		$('#login_fail').show();
		<%session.removeAttribute("login_fail");%> /* 로그인 실패 에러 세션 지우기 */
	}

	var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#id_chk").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
    
    $("#id_chk").change(function(){ // 체크박스에 변화가 발생시
   		if($("#id_chk").is(":checked")){ // ID 저장하기 체크했을 때,
        	var userInputId = $("input[name='id']").val();
        	setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
    	}else{ // ID 저장하기 체크 해제 시,
       		deleteCookie("userInputId");
    	}
    
		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    	$("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        	if($("#id_chk").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            	var userInputId = $("input[name='id']").val();
            	setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        	}
    	});
    });
});

 function setCookie(cookieName, value, exdays){
	 var exdate = new Date();
     exdate.setDate(exdate.getDate() + exdays);
     var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
     document.cookie = cookieName + "=" + cookieValue;
 }
     
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>


		
</body>
<jsp:include page="../main/footer.jsp" />
</html>