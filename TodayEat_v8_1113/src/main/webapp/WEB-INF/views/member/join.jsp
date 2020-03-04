<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../main/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css" >

body{
	min-width: 800px;
}

label{
	margin:5px 0 0 50px;
	float:left;
	width:100px;
	text-align:right;
}

input {
	width:250px;
	
	
}

.join_wrap{
		margin: 0 auto;
		margin-top: 210px;
		width: 700px;
		height:100%;
		min-height: 800px;
		text-align: center;
	
}

.join_logo{
		margin: 0 auto;
		width: 300px;
		height: 70px;
}

.join_logo img{
		margin-top:80px;
		width: 300px;
		height: 70px;
}

.join_form{
		margin-top:100px;
		
}



.join_input{
		width:250px;
		height:25px;
		float:left;
		margin-left:80px;
				
}

.join_input_1{
		width:100px;
		height:25px;
		float:left;
		margin-left:80px;
}

.join_input_2{
		width:100px;
		height:25px;
		margin-right:45px;
		
}

#id_check{
		width:120px;
		height:30px;
		margin-left:0px;
		padding:1px 0;
}

#nick_check{
		width:120px;
		height:30px;
		margin-left:0px;
		padding:1px 0;
}

#nick_success{
		width:150px;
		height:30px;
		float: right;
		margin-right:50px;
}

#nick_failed{
		width:150px;
		height:30px;
		float: right;
		margin-right:50px;
}
 
.join_pwd{
		
}

.join_btn{

}



</style>
<body>
	<div class="join_wrap">
		<div class="join_logo">
			<img src="${pageContext.request.contextPath}/resources/img/icon/Join.svg">
		</div><br>
		<div class="join_form">
			<form name="userinput" action="join.do" method="post" onSubmit="return checkIt()">
				<!-- 아이디 -->
			<div class="join_id">	
				<label>아이디</label>
				<input class="join_input" type="text" name="id" placeholder="아이디 입력"  autofocus="autofocus">
				<input id="id_check" type="button" value="아이디 중복 확인" name="confirm_id" onclick="openConfirmid(this.form)" 
				style="margin-left: -30px;background-color:#0B6623; color:#FFFFFF; border:0; border-radius:10px">
			</div><br>
			
				<!-- 비밀번호 -->
			<div class="join_pwd">
				<label>비밀번호</label>
				<input class="join_input" type="password" id="password" name="password" placeholder="비밀번호 입력"><br><br><br>
				<label>비밀번호 확인</label>
				<input class="join_input" type="password" id="password2" name="password2" placeholder="비밀번호 재입력" ><br><br>
			</div><br>
				<!-- 이름 -->
			<div class="join_name">
				<label>이 름</label>
				<input class="join_input" type="text" id="name" name="name" placeholder="이 름"><br><br>
			</div><br>
				<!-- 닉네임 -->
			<div class="join_nick">
				<label>닉네임</label>
				<input class="join_input" type="text" id="nickname" name="nickname" placeholder="닉네임">
				<div id="nick_success" style= "color: #00ad12; font-size:10px; margin-top:8px;">사용 가능한 닉네임 입니다.</div>
				<div id="nick_failed" style= "color: red; font-size:10px; margin-top:8px;">이미 사용중인 닉네임 입니다.</div><br><br>
			</div><br>
				<!-- 전화번호 -->
			<div class="join_number">
				<label>전화번호</label>
				<input class="join_input" type="text" id="phone" name="phone" placeholder="전 화 번 호"><br><br>
			</div><br>	
				<!-- 이메일 -->
			<div class="join_email">
				<label>이메일</label>
				<input class="join_input_1" name="email" id="email" type="text" placeholder="이메일명" />
				@ <input class="join_input_2" name="email02" id="email02" type="text" value ="naver.com" />
				
				<!-- 아래 이메일선택방식쪽 변수명 -->
			
				 			
				<select style="width:100px; height:30px; margin-right:45px;" name="selectEmail" id="selectEmail">
					<option value="naver.com" selected>naver.com</option> 
					<option value="hanmail.net">hanmail.net</option> 
					<option value="hotmail.com">hotmail.com</option> 
					<option value="nate.com">nate.com</option> 
					<option value="yahoo.co.kr">yahoo.co.kr</option> 
					<option value="empas.com">empas.com</option> 
					<option value="dreamwiz.com">dreamwiz.com</option> 
					<option value="freechal.com">freechal.com</option> 
					<option value="lycos.co.kr">lycos.co.kr</option> 
					<option value="korea.com">korea.com</option> 
					<option value="gmail.com">gmail.com</option> 
					<option value="hanmir.com">hanmir.com</option> 
					<option value="paran.com">paran.com</option>
					<option value="1">직접입력</option>

				</select><br>
				
				<!-- 이메일 선택방식 ($부분 변경하면 됨)-->
				<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script type="text/javascript">
				$('#selectEmail').change(function(){ $("#selectEmail option:selected").each(function () {
					if($(this).val()== '1'){//직접입력일 경우 
						$("#email02").val(''); //값 초기화
						$("#email02").attr("disabled",false); //활성화
						}else{ //직접입력이 아닐경우 
							$("#email02").val($(this).text()); //선택값 입력
							$("#email02").attr("disabled",false); //비활성화
						} 
					}); 
				});
				</script>
			</div><br>
				<!-- 주소 -->
			<div class="join_address">
				<label>주 소</label>
				<input class="join_input" type="text" id="address" name="address" placeholder="주 소"><br><br>
			</div><br>
			
			<div class="join_btn">
				<input type="submit" value="가입" style="background-color:#0B6623; color:#FFFFFF; border:0; width:90px; 
				height:30px; ">
				<input type="button" value="취소" style="background-color:#FFFFFF; color:#0B6623; border:1px solid; width:90px; height:30px; "
					onclick="location.href='login.do'">
			</div>
			
			</form>

<script type="text/javascript">

	function checkIt(){
		
		var frm = document.userinput;
		
		var f_id = frm.id.value;
		var f_pwd = frm.password.value;
		var f_pwd2 = frm.password2.value;
		var f_name = frm.name.value;
		var f_nick = frm.nickname.value;
		var f_phone = frm.phone.value;
		var f_email = frm.email.value;
		var f_address = frm.address.value;
		
		var re = /^[A-Za-z0-9]{6,15}$/ //아이디 비밀번호 유효성
		var re1 = /^[가-힣]{2,4}$/ //이름 유효성
		var re2 = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})?[0-9]{7,8}$/; //전화번호 유효성
		var re3 = /^[가-힣\s]{2,60}$/ //주소 유효성
		var re4 = /^[A-Za-z0-9]{3,20}$/ //이메일 유효성
		var re5 = /[~!@#$%^&*()_,.+|<>?:{}]/;

		
	 	if(!f_id){
			alert("ID를 입력하세요");
			return false;
		}
		
		if(!re.test(f_id)){
			alert("아이디는 영어 대소문자, 숫자만 사용 가능합니다. \n6자 이상 15자 이하로 입력해 주세요.");
			return false;
		} 	 	
		
		if(!f_pwd){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
	 	if(!re.test(f_pwd))	{
	 		alert("비밀번호는 영어 대소문자, 숫자만 사용가능합니다. \n6자 이상 15자 이하로입력해 주세요.")
	 		return false;
	 	}	
		if(f_pwd != f_pwd2){
			alert("비밀번호를 동일하게 입력하세요")
			return false;
		}
		
		if(!f_name){
			alert("이름을 입력해주세요");
			return false;
		}
		
		if(!re1.test(f_name)){
			alert("이름은 한글만 사용 가능합니다. 2~4자로 입력해주세요.")
			return false;
		}
	
		if(!f_nick){
			alert("닉네임을 입력해주세요");
			return false;
		}
		
		if(f_nick.length<2){
			alert("닉네임은 2자이상 입력해주세요.")
			return false;
		}
		
		if(!f_phone){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		
		if(!re2.test(f_phone)){
			alert("전화번호는 숫자만 입력해주세요.\n(지역번호부터 입력해 주세요. 9~11자로 작성) ");
			return false;
		}
		
		if(!f_email){
			alert("이메일을 입력해주세요");
			return false;
		}
			
		if(!re4.test(f_email)){
			alert("이메일 아이디는 한글사용이 불가합니다. \n(이메일 아이디는 3자리 이상 입력해주세요.)");
			return false;
		}
		
		
		if(!f_address){
			alert("주소를 입력해주세요");
			return false;
		}
		
		if(!re3.test(f_address)){
			alert("주소는 한글만 사용 가능합니다. (형식에 맞게 입력해주세요.) \n주소는 2자 이상 입력해주세요. 특수문자는 사용 불가능  ")
			return false;
		}
		
		alert("회원가입이 완료되었습니다.")
		return true;
	}
	
	function openConfirmid(inputid){
		
		if(inputid.id.value == ""){
			alert("중복확인에러 : 아이디를 입력해주세요");
			return;
		}
		
		
		url = "confirmId.do?id=" + inputid.id.value;
	
		open(url , "confirm_id" , "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=310, height=180");
	}
	
	$(function(){
		$('#nick_success').hide();
		$('#nick_failed').hide();
		$('#nickname').keyup(function(){
			var nick = $('#nickname').val();
			console.log(nick);
			$.ajax({
				url : 'confirmNick.do',
				type : 'post',
				data : {'nickname' : nick},
				success : function(result) { 
					if (nick === "") {
						$('#nick_success').hide();
						$('#nick_failed').hide();
						
					} else if (result == 1) {
						$('#nick_success').hide();
						$('#nick_failed').show(); 
						
					} else if (result == 0) {
						$('#nick_success').show();
						$('#nick_failed').hide();
					}
				}
			});
		});
	});
	
	
</script>

		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>