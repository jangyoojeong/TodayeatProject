<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link type ="text/css" rel = "stylesheet" href="${pageContext.request.contextPath }/resources/css/Info.css">

<script type = "text/javascript" src="//code.jquery.com/jquery.min.js"></script>
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js" charset="utf-8"></script>
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.js" charset="utf-8"></script>
<script type = "text/javascript">

 function delprofilePhoto() {
	
	var id = "${mvo.id }";
	
    $.ajax({
        url: "del_profile.do",
        type: "post",
		data: {
			id: id,
		},
        success : function(result){
        	if(result==1) {
        		alert("프로필이 존재하지 않습니다.");
        		$("#profilePhotoHolder").attr("src", "/img_pro/pro_male.jpg");
        	} else {
            	alert("프로필 삭제 성공!");
            	$("#profilePhotoHolder").attr("src", "/img_pro/pro_male.jpg");       		
        	}
        },
        error : function(request, status, error){
           alert('예기치못한 에러가 발생하여 프로필 삭제가 미처리 되었습니다.');
        }
    });
} 

function profileUploadAction() {
	console.log("profileUploadAction");
	$("#input_img").trigger('click');

		$(document).ready(function() {
			$("#input_img").on("change", handleImgFileSelect);
		});
}

$(document).ready(function() {
	$("#divprofilePhotoHolder_1").mouseover(function(){
	    
	    $("#profilePhothHolderBox").attr('is_over', '1');
	    $("#btnDelprofilePhoto_1").show();
	}).mouseout(function(){
	    $("#profilePhothHolderBox").attr('is_over', '0');
	    setTimeout(function(){
	        if ($("#profilePhothHolderBox").attr('is_over') == '0') {
	        	 $("#btnDelprofilePhoto_1").hide(); 
	        }
	    })
	})
});

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	

    
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		} 

		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = new Image();
			var id = "${mvo.id }";
			console.log(id);
			img.src = reader.result;
			img.onload = function() {
				
				var finalFile = reader.result;
				$("#profilePhotoHolder").attr("src", e.target.result); 
				
				var form = $('#f2');
				form.ajaxForm ({
					url: "upload_profile.do",
					data: {
						id: id,
					},
					type: "POST",
					enctype: "multipart/form-data",
	                processData: false,
	                contentType: false,
	                success: function(result){
	                	$('.file').val('');
	                	alert("프로필 수정 성공!");

	                },
	                error: function(){
	                	alert("파일 업로드 error");
	                    console.log("오류발생");
	                }
				});   
				form.submit();
			}		
		}
		reader.readAsDataURL(f);
	});
}


</script>
</head>
<style>
	input:disabled {
    	background-color:#ffffff;
	}
	
	.table1 th{
	font-size:14px;
</style>

<body>

<div id ="page">
	<div id ="jb-container">		
		
		<div id ="jb-content">
			<img src = "${pageContext.request.contextPath }/resources/img/icon/MyPage.svg" style ="width:300px">	
				<div id ="menu_nav">
					<ul>
						<li><a href="Mypage_info.do" class = "current">회원정보</a></li>
						<li><a href="listKeep.do?nickname=${login_nickname}">관심 레시피</a></li>
						<li><a href="Mypage_my.do?nickname=${login_nickname}">나의 레시피</a></li>
						<li><a href="Mypage_membership.do">유료 회원전환</a></li>
					</ul>	
				</div>
				
				
	
					<table class = "table1" align="center">
						<form action ="" method ="post" id = "f2" enctype="multipart/form-data">
							<tr>
								<td align = "left" colspan = "3" class = "profile">
									<div class = "profile_img" id = "profilePhothHolderBox" is_over = "0">
										<div id = "divprofilePhotoHolder_1" style = "position:relative;">
											<a id = "btnDelprofilePhoto_1" class = "pic_del" href="javascript:delprofilePhoto();" style = "display:none;"></a>
												<a href = "javascript:" onclick = "profileUploadAction();">
													<img id = "profilePhotoHolder" src = "/img_pro/${mvo.profile }" style = "cursor:pointer;"/>
												</a>
												<input type = "file" id = "input_img" name = "input_img"/>
										</div>	
									</div>	
								</td>				
							</tr>
						</form>
						<tr>
							<th >&nbsp아이디</th>
							<td id="td1">
								<input type="text" value="${mvo.id }" readonly="readonly" style="width:400px; height:50px; border:none; outline:none;"></td>
							<td id="td2">
								<input type="button" value="회원탈퇴" id="mem_withdrawal" name="delete_id" onclick="openDeleteid('${mvo.id}')" 
							style ="float:right; width:100px; height: 40px; background-color: #0B6623; border-radius: 5px; border: none; color:#fff; cursor: pointer;">
							</td>			
						</tr>
						<tr>
							<th>비밀번호</th><td id="td1"></td><td id="td2"><input type="button" id ="ps_change" onclick ="openUpdatepwd('${mvo.id}')" value="비밀번호변경"
							style ="float:right; width:100px; height: 40px; background-color: #0B6623; border-radius: 5px; border: none; color:#fff; cursor: pointer;"></td> 
						</tr>
						<tr>
							<th>&nbsp이름</th><td id="td1"><input type="text" value="${mvo.name }" readonly="readonly" style="width:400px; height:50px; border:none; outline:none;"></td><td id="td2"></td>
						</tr>	
						<tr>
							<th>&nbsp닉네임</th><td id="td1"><input id="input_nickname" type="text" value="${mvo.nickname }" style="width:400px; height:50px; border:none; " disabled></td><td id="td2"><button id="update_nickname" style ="float:right; width:100px; height: 40px; background-color: #0B6623; border-radius: 5px; border: none; color:#fff; cursor: pointer;" >수정하기</button></td>
						<tr>
						<tr>
							<th>전화번호</th><td id="td1" readonly="readonly">${mvo.phone }</td><td id="td2"></td>
						</tr>
						<tr>
							<th>&nbsp이메일</th><td id="td1"><input id="input_email" type="text" value="${mvo.email }" style="width:400px; height:50px; border:none; " disabled></td><td id="td2"><button id="update_email" style ="float:right; width:100px; height: 40px; background-color: #0B6623; border-radius: 5px; border: none; color:#fff; cursor: pointer;">수정하기</button></td>
						<tr>
						<tr>
							<th>&nbsp주소</th><td id="td1" readonly="readonly">${mvo.address }</td><td id="td2"></td>
						<tr>	
					</table>
					<button   id="complete" class = btn_sub data-toggle="modal" data-target="#myModal">수정 완료</button>
		</div>
	</div>
		<div id ="footer">
			<jsp:include page="../main/footer.jsp" />
		</div>
</div>

<%-- <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title" id="myModalLabel">정보 수정</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       
      </div>
      <div class="modal-body">
      
      
      	<b>닉네임</b><input id="input_nickname" type="text" value="${mvo.nickname }"  /><br><br>
      	
      	<b>이메일</b><input id="input_email" type="text" value="${mvo.email }" />
      	
      	
      	
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button id="complete" type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div> --%>


<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->

<script type="text/javascript">
function openDeleteid(loginid){
	url = "deleteId.do?id=" + loginid.value;
	open(url , "delete_id", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=200 " );
}

function openUpdatepwd(loginid){
	url = "updatePwd.do?id=" + loginid.value ;
	open(url , "update_pwd", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=250 " );
}




 $('#update_nickname').click(function(){
	$("#input_nickname").attr("disabled",false); //활성화
});
  
$('#update_email').click(function(){
	$("#input_email").attr("disabled",false); //활성화
}); 

$('#complete').click(function(){
 	$.ajax({
		url : 'updateMember.do',
		type : 'post',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		data : {'updateNickname' : $("#input_nickname").val(), 'updateEmail': $("#input_email").val()},
		datatype: 'json',
		success : function(result) { 
			
			alert("수정이 완료되었습니다.")
			$("#input_nickname").val();
			$("#input_email").val();  
			location.replace("Mypage_info.do");
			
		}
					//location.href="Mypage_info.do";
		
	});
	
	console.log($("#input_nickname").val());
	console.log($("#input_email").val());
});


</script>
	





	
</body>
			<jsp:include page ="../main/header.jsp" />



</html>




