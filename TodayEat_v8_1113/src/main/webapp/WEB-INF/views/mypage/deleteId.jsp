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
.delete_wrap {
	text-align:center;
}

table {
	margin-left:auto;
	margin-right:auto;
}
</style>
<body onload="begin()">
	<div class="delete_wrap">
	<b><font size = "10" color="#0B6623">회원탈퇴 </font></b><br /><br />
	<form name="deleteform" action="deleteId.do" method="post" onSubmit="return deletecheckIt('${mvo.password}')">
	
	<table border="3" bordercolor="#0B6623">
	<tr><td bgcolor="#0B6623"><font color="FFFFFF">비밀번호</font></td>
		<td><input type="password" name="password" /></td></tr>
	</table><br />
	
	<input type="submit" value="회원탈퇴" onclick="goaction()" style="background-color:#0B6623; color:#FFFFFF; border:0; 
					width:100px; height:40px; "/>
	<input type="button" value="취소" onclick="self.close()" style="background-color:#0B6623; color:#FFFFFF; border:0; 
		width:100px; height:40px; " />
	</form>
	</div>
	</body>
	<script type="text/javascript">
	function begin(){
		document.deleteform.password.focus();
	}
	
	function deletecheckIt(loginpwd){
		if(!document.deleteform.password.value){
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.deleteform.password.focus();
			return false;			
		}else if(document.deleteform.password.value != loginpwd){
			alert("비밀번호가 일치하지 않습니다.");
			document.deleteform.password.focus();
			return false;
		}else{
			alert("회원탈퇴가 완료되었습니다.")
			opener.location.href="index.do";
			self.close();
		}				
	}

	</script>
</html>