<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
<link type ="text/css" rel = "stylesheet" href="${pageContext.request.contextPath }/resources/css/Membership.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js" charset="utf-8"></script>

</head>
<body>

<div id ="page">
	<div id ="jb-container">
		<div id ="jb-content">
		
			<form action= "#" method ="post">
			
				<div id ="mypage_logo">
					<img src ="${pageContext.request.contextPath }/resources/img/icon/MyPage.svg" style ="width:300px">
				</div>
	
				<div id ="menu_nav">
					<ul>
						<li><a href="Mypage_info.do">회원정보</a></li>
						<li><a href="listKeep.do?nickname=${login_nickname}">관심 레시피</a></li>
						<li><a href="Mypage_my.do?nickname=${login_nickname}">나의 레시피</a></li>
						<li><a href="Mypage_membership.do"  class = "current">유료 회원전환</a></li>
					</ul>	
				</div>
	
	<p> '오늘 뭐 먹지'는 정보 이용료를 받고 있습니다. 이 점 참고해 주시기 바랍니다. </p>
	
			<div id ="payment_info">
				<h2>결제 정보</h2>
				<table class = "pay_table">
					<tr>
						<th>기한</th>
						<td>
							<input type="radio" name="chk_payment" checked ="checked" value= "3개월"> 3개월
							<input type="radio" name="chk_payment" value ="6개월"> 6개월
							<input type="radio" name="chk_payment" value ="12개월"> 12개월
						</td>
					</tr>
					<tr>
						<th>결제 금액</th><td>300원(선택시 값이 바뀜)</td>		
					</tr>
				</table>
			</div>
	
	<div id = "payment_select">
		<h2>결제 수단 선택</h2>
		
		<table class="select_table">
			<tr>
				<td>
					<!-- <button class ="btn_select1" > -->
					<div id = "credit" is_over = "0" is_click = "0" style = "cursor:pointer;">
						<div id = "credit_dis">
							<a><img src="${pageContext.request.contextPath }/resources/img/icon/credit_unclick.svg" id ="img1" style =" width: 170px;"></a>
					<!-- </button> -->
						</div>
					</div>
				</td>
				<td>
					<div id = "deposit" is_over = "0" is_click = "0" style = "cursor:pointer;">
						<div id = "deposit_dis">
							<a><img src="${pageContext.request.contextPath }/resources/img/icon/deposit_unclick.svg" id ="img2" style =" width: 170px;"></a>
						</div>
					</div>
				</td>
				<td>
					<div id = "account" is_over = "0" is_click = "0" style = "cursor:pointer;">
						<div id = "account_dis">
							<a><img src="${pageContext.request.contextPath }/resources/img/icon/account_unclick.svg" id ="img3" style =" width: 170px;"></a>
						</div>
					</div>
				</td>	
			</tr>	
		</table>
		
		<input type ="submit" value ="결제하기	" class ="btn_payment">
	</div>
</form>
</div>
</div>
<div id ="footer">
			<jsp:include page="../main/footer.jsp" />
		</div>
</div>
	
<script type = "text/javascript">

/* var state = 0;	

function changeImg1(){
	
	if(state == 0){
		state=1;
		document.getElementById('img1').src = "${pageContext.request.contextPath }/resources/img/icon/credit_click.svg";
		} 
	else{
		state =0;
		document.getElementById('img1').src = "img/credit_unclick.svg";	
		

} */


	$("#credit_dis").mouseover(function(){
		
	    $("#credit").attr('is_over', '1');
	    $("#img1").attr("src", "${pageContext.request.contextPath }/resources/img/icon/credit_click.svg");
	    
	    $("#credit_dis").click(function() {
	    	$("#credit").attr("is_click", '1');
	    	$("#deposit").attr("is_click", '0');
	    	$("#account").attr("is_click", '0');
	    	
	    	$("#img2").attr("src", "${pageContext.request.contextPath }/resources/img/icon/deposit_unclick.svg");
	    	$("#img3").attr("src", "${pageContext.request.contextPath }/resources/img/icon/account_unclick.svg");
	    })
	    
	}).mouseout(function(){
	    $("#credit").attr('is_over', '0');
	    
	    setTimeout(function(){
	        if ($("#credit").attr('is_over') == '0' && $("#credit").attr('is_click') == '0') {
	        	$("#img1").attr("src", "${pageContext.request.contextPath }/resources/img/icon/credit_unclick.svg");
	        }
	    })
	})	
	
		$("#deposit_dis").mouseover(function(){
		
	    $("#deposit").attr('is_over', '1');
	    $("#img2").attr("src", "${pageContext.request.contextPath }/resources/img/icon/deposit_click.svg");
	    
	    $("#deposit_dis").click(function() {
	    	$("#deposit").attr("is_click", '1');
	    	$("#credit").attr("is_click", '0');
	    	$("#account").attr("is_click", '0');
	    	
	    	$("#img1").attr("src", "${pageContext.request.contextPath }/resources/img/icon/credit_unclick.svg");
	    	$("#img3").attr("src", "${pageContext.request.contextPath }/resources/img/icon/account_unclick.svg");
	    })
	    
	}).mouseout(function(){
	    $("#deposit").attr('is_over', '0');
	    
	    setTimeout(function(){
	        if ($("#deposit").attr('is_over') == '0' && $("#deposit").attr('is_click') == '0') {
	        	$("#img2").attr("src", "${pageContext.request.contextPath }/resources/img/icon/deposit_unclick.svg");
	        }
	    })
	})	
	
		$("#account_dis").mouseover(function(){
		
	    $("#account").attr('is_over', '1');
	    $("#img3").attr("src", "${pageContext.request.contextPath }/resources/img/icon/account_click.svg");
	    
	    $("#account_dis").click(function() {
	    	$("#account").attr("is_click", '1');
	    	$("#credit").attr("is_click", '0');
	    	$("#deposit").attr("is_click", '0');	  
	    	
	    	$("#img1").attr("src", "${pageContext.request.contextPath }/resources/img/icon/credit_unclick.svg");
	    	$("#img2").attr("src", "${pageContext.request.contextPath }/resources/img/icon/deposit_unclick.svg");
	    })
	    
	}).mouseout(function(){
	    $("#account").attr('is_over', '0');
	    
	    setTimeout(function(){
	        if ($("#account").attr('is_over') == '0' && $("#accounts").attr('is_click') == '0') {
	        	$("#img3").attr("src", "${pageContext.request.contextPath }/resources/img/icon/account_unclick.svg");
	        }
	    })
	})	
	
	
</script>
	
		
</body>
			<jsp:include page ="../main/header.jsp" />

</html>