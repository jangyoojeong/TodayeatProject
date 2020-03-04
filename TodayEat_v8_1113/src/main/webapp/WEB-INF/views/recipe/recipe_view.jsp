<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
<link href="${pageContext.request.contextPath}/resources/css/recipe_view.css" rel="stylesheet">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js" charset="utf-8"></script>
<script type = "text/javascript">


function check() {
	
	
	<c:if test="${empty login_id }">
		  if (confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')==false) {
			  return false;
		  };
		  location.href = "login.do";
	</c:if>
	
	<c:if test="${!empty login_id }">  
		if (good_sw == 0 && bad_sw == 0) {
			alert('추천여부를 선택해주세요.');
		} else if ($.trim($("#reply").val()) == '') {
			alert('내용을 입력해주세요.');
			$("#reply").focus();
		} else {
			if (confirm('댓글을 등록하시겠습니까?')==false) {
				return false;	
			}
			   
			   $.ajax({
				 	//url: "upload_recipe.do?step_arr=" + imsi_arr + "&complete_img=" + complete,
				 	url: "upload_reply.do?good_sw=" + good_sw + "&nickname=${login_nickname}",
				 	//data: imsi_arr,
				 	data: $('#f1').serialize(),
				 	//dataType    :   "json",
				 	contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
				 	//contentType :   "application/json; charset=UTF-8",
				 	type: "get",
				 	success : function(result){
				 		alert('댓글등록 성공!');
				 		location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
				 	},
				 	error : function(request, status, error){
				 		alert('예기치못한 에러가 발생하여 댓글 등록이 미처리되었습니다.');
				 		location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
				 	}
			   });
		}
	</c:if>
	 
}

function del_check(no) {
	
	if (confirm('댓글을 삭제하시겠습니까?')==false) {
		return false;	
	}
	
	   $.ajax({
		 	url: "delete_reply.do?reply_no=" + no,
		 	data: $('#f1').serialize(),
		 	//contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
		 	type: "get",
		 	success : function(result){
		 		alert('댓글삭제 성공!');
		 		location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
		 	},
		 	error : function(request, status, error){
		 		alert('예기치못한 에러가 발생하여 댓글 삭제가 미처리되었습니다.');
		 		location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
		 	}
	   });
	
}

function keep() {
	   
	   if (confirm('해당 레시피를 저장하시겠습니까?')==false) {
	      return false;   
	   }
	   
	      $.ajax({
	          url: "insertKeep.do?recipe_no=${mRecipe.recipe_no}&nickname=${login_nickname}",
	          type: "get",
	          data: $('#f1').serialize(),
	          success : function(result){
	             if(result == 1) {
	                alert('레시피 저장 성공!');
	                location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
	             } else {
	                alert('이미 저장되어 있는 레시피입니다.');
	                location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
	             }
	          },
	          error : function(request, status, error){
	             alert('예기치못한 에러가 발생하여 레시피 저장이 미처리되었습니다.');
	             location.href = "searchOneRecipe.do?recipe_no=${mRecipe.recipe_no }";
	          }
	      });
	}

 function reply_all() {
	
	 var sw = 0;
	 
 	   $.ajax({
		 	url: "searchOneReply_all.do",
		 	type: "get",
		 	data: $('#f1').serialize(),
		 	success : function(result){
		 		location.href = "searchOneReply_all.do?recipe_no=${mRecipe.recipe_no }";
		 		var sw = 1;
		 	},
		 	error : function(request, status, error){
		 		alert("댓글 전체보기 error!!");
		 		location.href = "searchOneReply_all.do?recipe_no=${mRecipe.recipe_no }";
		 	}
	   }); 
} 
 
 
$(function() {
	 $('#reply_all_id').click( function() {
		  if( $(this).val() == '줄여보기' ) {
		    $(this).val('전체보기');
		  }
	   else {
		    $(this).val('줄여보기');
		  }
		});
});
 
</script>
</head>




<style type="text/css">

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
<body>
<div class="page">
	<div class="contents_wrap">

		<div class = "view">
		   <div class = "view_title">
		      <h2>${mRecipe.nickname }님의 ${mRecipe.recipe_title }</h2>
		      <h3>-${mRecipe.nickname }님의 레시피-</h3>
		   </div>
		   
		   <table class = "top" align = "center">
		   <form method="get" id = "f1">
		      <tr>
		         <td rowspan = "2">
		            <div class = "main_img">
		          		<img src="/img/${mRecipe.complete_img }"/>
		            </div>
		         </td>
		         <td>
		            <div class = "main_text">
		             	 ${mRecipe.recipe_intro }
		            </div>
		         </td>
		      </tr>
		      <tr>
		         <td class = "btn" align="right">
		            <input type = "button" onclick = "keep();" value = "keep!">
		         </td>
		      </tr>
		   </table>
		   
		   <div class = "ready_class">
		      <div class = "icon_Ready" >
		            <img src="${pageContext.request.contextPath}/resources/img/icon/Ready.svg"/>
		       </div>
		      <div class = "ready">
		         <ul class = "case1">
		         	<c:forEach var = "m1" items = "${mRecipe_material }">
			            <li>
							<span class = "ingre_nuit1">${m1.material_food }</span>
			                <span class = "ingre_nuit2">${m1.material_amo }</span>
			            </li>
		            </c:forEach>

		         
		         </ul>
		      </div>
		   </div>
		   
		      <div class = "step_class">
		         <div class = "icon_Step" >
		               <img src="${pageContext.request.contextPath}/resources/img/icon/Step.svg"/>
		          </div>   
		          <table class = "steps" align = "center">
		          	<c:forEach var = "s1" items = "${mRecipe_step }">
			          	<tr>
			          		<td>
			          			<div class = "steps_img">
			               			<img src="/img/${s1.st_image }"/>
			            		</div>
			          		</td>
			          		<td class = "step_step">
			          			<img src="${pageContext.request.contextPath}/resources/img/icon/${s1.st_no }_icon.svg"/>
			          		</td>	
			          		<td class = "step_text">
			          				${s1.st_content }
			          		</td>	
			          	</tr>
		          	</c:forEach>
		       
		          	<tr>
		          		<td class = "step_img_main" colspan = "3">
		          			<img src="/img/${mRecipe.complete_img }"/>
		          		</td>
		          	
		          	</tr>
		          	<tr>
		          		<td class = "origin" align = "right" text-align = "right" colspan = "3">
		      				<span>출처: </span><a href = ${mRecipe.recipe_origin }>${mRecipe.recipe_origin }</a>
		          		
		          		</td>
		          	
		          	</tr>
		          </table>

		      </div>
		      
		      <div class = "reply_class">
		         <div class = "icon_Reply" >
		               <img src="${pageContext.request.contextPath}/resources/img/icon/Reply.svg"/>
		          </div> 
			              
			          <table class = "reply_table" align = "center" text-align = "left" border = "0">
			          	<thead>
			          		<tr>
			          			<td colspan = "4" class = "cnt">
			          				글<span>${mRecipe.reply_total }</span>
			          			</td>
			          		</tr>
			          	</thead>
			          	<c:if test="${empty mReply}">
			          		<tbody>
			          			<tr>
			          				<td colspan = "4" class = "reply_null">
										<span>-등록된 댓글이 없습니다.-</span>
									<td>
								</tr>
							</tbody>
						</c:if>
			          	<c:if test="${!empty mReply}">
				          	<tbody>
				          	<c:forEach var = "r1" items = "${mReply }">
				          		<tr>
				          			<td colspan = "4">
						          		<table class = "reply_class_content" border = "0" cellspacing = "0" cellpadding = "0">
								          	<tr class = "reply_body">
								          		<td rowspan = "2">
								          			<div class = "profile">
								          				<img src = "/img_pro/${r1.member_profile }">
								          			</div>
								          		</td>
								          		<td>
								          			<div class = "nick">
								          				${r1.nickname }
								          			</div>
								          		</td>
								          		<td>
								          			<div class = "date">
								          				${r1.reply_date }
								          			</div>
								          		</td>
								          		<td>
								          			<div class = "good_bad">
								          				<img src = "${pageContext.request.contextPath}/resources/img/icon/${r1.reply_score }">
								          				
								          			</div>
								          		</td>
									          		<td>
									          			<c:if test="${login_nickname eq r1.nickname}">
										          			<div class = "del_btn">
										          				<a onclick = "del_check(${r1.reply_no});" style = "cursor:pointer;"><img src = "${pageContext.request.contextPath}/resources/img/icon/del.svg"></a>
										          			</div>
									          			</c:if>
									          		</td>
								          	</tr>
								       		<tr class = "reply_body">
								          		<td colspan = "4" text-align = "left">
								          			<div class = "content">
								          				${r1.reply_content }
								          			</div>
								          		</td>
								          	</tr>
							          	</table>
						          	</td>
					          	</tr>
					          </c:forEach>
				          	</tbody>
			          	</c:if>
			          
			          	<tfoot>
			          		<!-- <form method="get" action = "searchOneReply_all.do"> -->
				          		<tr>
				          			<td colspan = "4" text-align = "center">
				          				<div class = "bun">
				          					<input type = "button" id = "reply_all_id" value = "전체보기" onclick = "reply_all();">
				          				</div>
				          			</td>
				          		</tr>
			          		<!-- </form> -->
			          		<tr>
			          			<td class = "re_btn">
			          				<div id = "good" is_over = "0" is_click = "0">
			          					<div id = "good_dis" style = "position:relative;">
			          						<a id = "good_activa" class = "good_pic" style = "display:none;"></a>
			          						<a id = "good_diss">
			               						<img id = "good_d" src="${pageContext.request.contextPath}/resources/img/icon/good_icon_disable.svg"  style = "cursor:pointer;"/>
			               					</a>
			               				</div>
			               			</div>
			          			</td>
			          			<td class = "re_btn">
			          				<div id = "bad" is_over = "0" is_click = "0">
			          					<div id = "bad_dis" style = "position:relative;">
			          						<a id = "bad_activa" class = "bad_pic"  style = "display:none;"></a>
			          						<a id = "bad_diss">
			               						<img id = "bad_d" src="${pageContext.request.contextPath}/resources/img/icon/bad_icon_disable.svg"  style = "cursor:pointer;"/>
			               					</a>
			               				</div>
			               			</div>
			          			</td>
			          			<td width="500px">
			          				<textarea id = "reply" name = "reply_content" placeholder = "먹지의 레시피는 어떠셨나요? 댓글을 남겨주세요!!"></textarea>
			          				<input type = "hidden" name = "recipe_no" value = "${mRecipe.recipe_no }">
			          			</td>
			          			<td class = "input">
			          				<input type = "button" value = "등록" onclick = "check();">
			          			</td>
			          		</tr>
			          	
			          	</tfoot>
			          </form>
			        </table>
		      </div>
		      
		</div>
		<jsp:include page="../main/footer.jsp" /> <!-- 푸터부분 삽입 -->
	</div>
	
</div>

<script type = "text/javascript">
		
		var good_sw = 0;
		var bad_sw = 0;
		
		$("#good_dis").mouseover(function(){
		    $("#good").attr('is_over', '1');
		    /* $("#good_activa").show(); */
		    $("#good_d").attr("src", "${pageContext.request.contextPath}/resources/img/icon/good_icon.svg");
		    
		    $("#good_dis").click(function() {
		    	$("#good").attr("is_click", '1');
		    	good_sw = 1;
		    	$("#bad").attr("is_click", '0');
		    	bad_sw = 0;
		    	$("#bad_d").attr("src", "${pageContext.request.contextPath}/resources/img/icon/bad_icon_disable.svg");
		    })
		    
		}).mouseout(function(){
		    $("#good").attr('is_over', '0');
		    
		    setTimeout(function(){
		        if ($("#good").attr('is_over') == '0' && $("#good").attr('is_click') == '0') {
		        	$("#good_d").attr("src", "${pageContext.request.contextPath}/resources/img/icon/good_icon_disable.svg");
		        }
		    })
		})
		
		$("#bad_dis").mouseover(function(){
		    $("#bad").attr('is_over', '1');
		    /* $("#bad_activa").show(); */
		    $("#bad_d").attr("src", "${pageContext.request.contextPath}/resources/img/icon/bad_icon.svg");
		    
		    $("#bad_dis").click(function() {
		    	$("#bad").attr("is_click", '1');
		    	bad_sw = 1;
		    	$("#good").attr("is_click", '0');
		    	good_sw = 0;
		    	$("#good_d").attr("src", "${pageContext.request.contextPath}/resources/img/icon/good_icon_disable.svg");
		    })
		   
		    
		}).mouseout(function(){
		    $("#bad").attr('is_over', '0');
		    
		    setTimeout(function(){
		        if ($("#bad").attr('is_over') == '0' && $("#bad").attr('is_click') == '0') {
		        	$("#bad_d").attr("src", "${pageContext.request.contextPath}/resources/img/icon/bad_icon_disable.svg");
		        }
		    })
		})

</script>

</body>

<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->

</html>