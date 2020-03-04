<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.update_wrap {
	text-align:center;
}

table {
	margin-left:auto;
	margin-right:auto;
}
</style>
<body onload="begin()">
	<div class="update_wrap">
	<b><font size = "10" color="#0B6623">비밀번호 변경 </font></b><br /><br />
	<form name="updateform" action="updatePwd.do" method="post" onSubmit="return updatecheckIt('${mvo.password}')">
	
	<table border="3" bordercolor="#0B6623">
	<tr><td bgcolor="#0B6623"><font color="FFFFFF">현재 비밀번호</font></td>
		<td><input type="password" name="password" /></td></tr>
	<tr><td bgcolor="#0B6623"><font color="FFFFFF">변경할 비밀번호</font></td>
		<td><input type="password" id="password1" name="password1" /></td></tr>
	<tr><td	bgcolor="#0B6623"><font color="FFFFFF">변경할 비밀번호 확인</font></td>
		<td><input type="password" name="password2" /></td></tr>
	</table><br />
	
	<input type="submit" value="비밀번호 변경"  style="background-color:#0B6623; color:#FFFFFF; border:0; 
					width:100px; height:40px; "/>
	<input type="button" value="취소" onclick="self.close()" style="background-color:#0B6623; color:#FFFFFF; border:0; 
		width:100px; height:40px; " />
	</form>
	</div>
	</body>
	<script type="text/javascript">
	function begin(){
		document.updateform.password.focus();
	}
	
	function updatecheckIt(loginpwd){
		
		var re = /^[A-Za-z0-9]{6,15}$/ //아이디 비밀번호 유효성
		
		var frm = document.updateform;
		var f_pwd = frm.password.value;
		var f_pwd1 = frm.password1.value;
		var f_pwd2 = frm.password2.value;
		if(f_pwd == loginpwd){
			
			if(!f_pwd1 || !f_pwd2){
				alert("변경할 비밀번호를 입력하지 않으셨습니다.");
				document.updateform.password.focus();
				return false;			
			}		
			else if(f_pwd1 != f_pwd2){	
				alert("변경할 비밀번호가 일치하지 않습니다.");
				document.updateform.password1.focus();
				return false;
			}
			else if(f_pwd1 == loginpwd){
				alert("현재 비밀번호와 변경할 비밀번호가 같습니다. 다시 입력해주세요")
				document.updateform.password1.focus();
				return false;
			}
			else if(!re.test(f_pwd1)){
				alert("변경할 비밀번호는 영어 대소문자, 숫자만 사용가능합니다. \n6자 이상 15자 이하로입력해 주세요.");
				document.updateform.password1.focus();
				return false;
			}
			else{
				alert("변경이 완료되었습니다. 다시 로그인 하세요.")
				opener.location.replace("index.do");
				self.close();
			}
			
		}else if(f_pwd != loginpwd){
			alert("현재 비밀번호와 일치하지 않습니다.")
			return false;
		}
	}

	</script>
</html>