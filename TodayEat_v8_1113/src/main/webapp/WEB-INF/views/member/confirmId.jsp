<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Insert title here</title>
   <c:if test ="${check_id eq 1 }">     
	<b><font color="red" >${s_id} </font>는 이미  사용중인 아이디입니다.</b>
	<form name="checkForm" method="get" action="confirmId.do">
	<b>다른 아이디를 입력해주세요.</b> <br /> <br />
	<input type="text" name="id" />
	<input type="submit" value="ID중복확인" />
	</form>
	 </c:if>
	<c:if test ="${check_id eq -1 }">
	<center>
	<b>입력하신 <font color="red">${s_id} </font>는<br />
			사용하실수 있는 ID입니다.</b><br /><br />
	<input type="button" value="닫기" onclick="setId()"> </center>
	</c:if>

<script type="text/javascript">

	function setId(){
		opener.document.userinput.id.value="${s_id}";
		self.close();	
	}
</script>
	




