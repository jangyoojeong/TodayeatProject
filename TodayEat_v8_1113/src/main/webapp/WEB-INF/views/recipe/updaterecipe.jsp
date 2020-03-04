<%@page import="com.todayeat.recipe.vo.RecipeVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
<!-- <link href = "recipe_view.css" rel = "stylesheet"> -->
<link href="${pageContext.request.contextPath}/resources/css/recipe_view.css" rel="stylesheet">
<!-- <script type = "text/javascript" src = "./js/jquery-3.4.1.min.js" charset="utf-8"></script> -->
<script type = "text/javascript" src="//code.jquery.com/jquery.min.js"></script>
<%-- <script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.4.4.min.js" charset="utf-8"></script> --%>
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js" charset="utf-8"></script>
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.js" charset="utf-8"></script>
<script type = "text/javascript">
	
var sel_file;
var st_num;
var id;
var imsi;
var imsi_arr = [];
var complete;


function delStepPhoto(num) {
	st_num = num;
	$("#stepPhotoHolder_"+st_num).attr("src", "${pageContext.request.contextPath}/resources/img/icon/insert_img.svg");
}

function fileUploadAction(num) {
	st_num = num;
	var va = document.getElementById('input_img_'+st_num);
	/* console.log(va); */
	//console.log("fileUploadAction" + st_num);
	$("#input_img_"+st_num).trigger('click');
	id = va.id.substring(0,4);
		//console.log(id); 

		$(document).ready(function() {
			$("#input_img_"+st_num).on("change", handleImgFileSelect);
		});
}

	function delWorkPhoto(num) {
		st_num = num; 
	$("#WorkPhotoHolder_"+st_num).attr("src", "${pageContext.request.contextPath}/resources/img/icon/insert_img.svg");
}


function fileUploadAction_work(num) {
	st_num = num; 
	var va = document.getElementById('work_img_'+st_num); 
	// console.log("fileUploadAction" + st_num); 
	$("#work_img_"+st_num).trigger('click');
	id = va.id.substring(0,4);
	//console.log(id); 

		$(document).ready(function() {
			//console.log(id); 
			$("#work_img_"+st_num).on("change", handleImgFileSelect);
		});
}  

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	

		var file_gubun = '';
		var str_num = ''; 
	
	    if (id == 'inpu') {
        file_gubun = 'Step';
        str_num =  e.target.id.replace('input_img_', ''); 
    } else if (id == 'work') {
        file_gubun = 'work';
        str_num =  e.target.id.replace('work_img_', ''); 
    } else if (id == 'main') {
        file_gubun = 'main';
   }  
   
    
    $("#divStepPhotoHolder_" + str_num).mouseover(function(){
    
        $("#stepPhothHolderBox_" + str_num).attr('is_over', '1');
        $("#btnDelStepPhoto_" + str_num).show();
    }).mouseout(function(){
        $("#stepPhothHolderBox_" + str_num).attr('is_over', '0');
        setTimeout(function(){
            if ($("#stepPhothHolderBox_" + str_num).attr('is_over') == '0') {
            	 $("#btnDelStepPhoto_" + str_num).hide(); 
            }
        })
    })
    
    
    $("#divWorkPhotoHolder_" + str_num).mouseover(function(){
    
        $("#WorkPhothHolderBox_" + str_num).attr('is_over', '1');
        $("#btnDelWorkPhoto_" + str_num).show();
    }).mouseout(function(){
        $("#WorkPhothHolderBox_" + str_num).attr('is_over', '0');
        setTimeout(function(){
            if ($("#WorkPhothHolderBox_" + str_num).attr('is_over') == '0') {
            	 $("#btnDelWorkPhoto_" + str_num).hide(); 
            }
        })
    })
    
	
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			} 

		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
				var img = new Image();
			img.src = reader.result;
			img.onload = function() {
				
				var finalFile = reader.result;
				
				// console.log(finalFile); 
				
				if (file_gubun == 'Step') {
					 $("#stepPhotoHolder_"+st_num).attr("src", e.target.result); 
				} else if (file_gubun == 'work') {
					$("#WorkPhotoHolder_"+st_num).attr("src", e.target.result);
				}
				
				
					var form = $('#f1');
				form.ajaxForm ({
					url: "upload_photo.do",
					data: {
						//form.serialize(),
						file_gubun1: file_gubun,
						id: str_num
					},
					//data: "canvasData=" + finalFile,
					type: "POST",
					enctype: "multipart/form-data",
	                processData: false,
	                contentType: false,
	                success: function(result){
	                	//console.log(result);
	                	$('.file').val('');	//? 적용 안됨.
	                			
						if (file_gubun == 'Step') {
							imsi = 'Step'+st_num;
							//console.log(imsi);
		                	//imsi_arr.imsi=result;
		                	//console.log(imsi_arr.imsi);
		                	
						} else if (file_gubun == 'work') {
							//complete = result;
							//console.log(complete);
						}		
/*  		                    if (result == "1") {
	                        //alert("업로드 성공!");
		                    	console.log("성공");
	                    } 
	                    else {
	                        alert("처리에 실패하였습니다.");
	                        console.log("실패");
	                    } */
	                },
	                error: function(){
	                	alert("파일 업데이트 error")
	                    //alert('오류가 발생하였습니다.');
	                    console.log("오류발생");
	                }
				});   
				form.submit();
				
			}		
		}
		reader.readAsDataURL(f);
	});
}


   function check() {
	   
	   var category = document.getElementById("category");
	   var cate = category.options[category.selectedIndex].text;
	   

	   if ($.trim($("#cok_title").val()) == '') {
		   alert('레시피 제목을 입력해 주세요.');
		   $("#cok_title").focus();
	   } else if ($.trim($("#cok_intro").val()) == '') {
		   alert('요리소개 내용을 입력해 주세요.');
		   $("#cok_intro").focus();
	   } else if (cate == '카테고리') {
		   alert('카테고리를 선택해주세요.');
	   } else if (fo_nu < 2) {
		   alert('요리재료는 최소 2개 이상이어야 합니다.');
		   $('#food > tbody:last > tr:last').focus();
	   } else if (st_nu < 3) {
		   alert('요리순서는 최소 3개 이상이어야 합니다.');
	   } /* else if ($.trim($("#recipe_tip").val()) == '') {
		   if(alert('요리 팁을 입력하지 않으셨습니다. 그대로 진행하시겠습니까?')); {
			   $('#f1').submit();
		   }
	   } */ else {
		   alert('레시피를 저장하시겠습니까?'); 
			   
			   $.ajax({
				 	//url: "upload_recipe.do?step_arr=" + imsi_arr + "&complete_img=" + complete,
				 	url: "updateRecipe.do?fo_nu=" + fo_nu + "&st_nu=" + st_nu,
				 	//data: imsi_arr,
				 	data: $('#f1').serialize(),
				 	//dataType    :   "json",
				 	contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
				 	//contentType :   "application/json; charset=UTF-8",
				 	type: "get",
				 	success : function(result){
				 		alert('레시피수정 성공!');
				 		location.href = "my_recipe_search.do";
				 	},
				 	error : function(request, status, error){
				 		alert('예기치못한 에러가 발생하여 레시피 수정이 미처리되었습니다.');
				 		location.href = "my_recipe_search.do";
				 	}
			   });
			   
		  // $('#f1').submit();
			   
		}
   }

</script>
</head>
<style type="text/css">

	body{
	/* text-align:center; */
	}
	
	.page{
	margin-top:210px;
	/* text-align:center; */
	height: 100%;
	min-width: 800px;
	}
	.contents_wrap:after{content:''; display:block; clear:both; float:none;}
	.contents_left,
	.contents_right{width:50%;float:left;margin:0;padding:0;border:1px solid #000;box-sizing:border-box;}

</style>
<body>
<%
	int fo_nu = 0;
	int st_nu = 0;
%>
<div class="page">
	<div class="contents_wrap">

		<jsp:include page="../main/header.jsp" />  <!-- 헤더부분 삽입 -->
		
		<div class = "upload">
		   
		   <form action="upload_recipe.do" method="post" id = "f1" enctype="multipart/form-data">
		   
		      <table  class = "main" align = "center" border = "0">
		         <thead align = "center">
		            <tr>
		               <td colspan = "3">
		                  <div class = "icon" align = "center">
		                     <img src="${pageContext.request.contextPath}/resources/img/icon/updateRecipe.svg"/>
		                  </div>
		               </td>
		            <tr>
		         </thead>
		         
		         <tbody>
		            <tr>
		               <th>레시피 제목</th>
		               <td colspan="2" ><input type = "text" id = "cok_title" name = "recipe_title" value = "${mRecipe.recipe_title }" autofocus><input type = "hidden" name = "recipe_no" value = "${mRecipe.recipe_no }"></td>
		            </tr>
		            
		            <tr>
		               <th>요리 소개</th>
		               <td colspan="2" ><input type = "text" id = "cok_intro" name = "recipe_intro" value = "${mRecipe.recipe_intro }"></td>
		            </tr>
		            
		            <tr>
		               <th>카테고리</th>
		               <td colspan="2" >
		               	  <select id = "category" name = "recipe_category">
		               	  	 <option value = "카테고리">카테고리</option>
		                     <option value = "한식"<%=request.getAttribute("cate").equals("한식")?"selected":"" %>>한식</option>
		                     <option value = "중식"<%=request.getAttribute("cate").equals("중식")?"selected":"" %>>중식</option>
		                     <option value = "일식"<%=request.getAttribute("cate").equals("일식")?"selected":"" %>>일식</option>
		                     <option value = "양식"<%=request.getAttribute("cate").equals("양식")?"selected":"" %>>양식</option>
		                  </select>
		               </td>
		            </tr>
		            
		            
			            <tr>
			               <th>재료정보</th>
			               <td>
			                  <table id = "food" cellspacing = "0" cellpadding = "0">
				                 	 <tbody>
					                   <c:forEach var = "m1" items = "${mRecipe_material }" varStatus="sta">
					                   		<% fo_nu = fo_nu+1; %>
						                     <tr id = "food${sta.count }">
						                        <td><input type = "text" name = "food${sta.count }_tx1" placeholder = "예) 돼지고기" value = "${m1.material_food }" required></td>
						                        <td><input type = "text" name = "food${sta.count }_tx2"  placeholder = "예) 300g" value = "${m1.material_amo }" required></td>
						                     </tr>
					                    </c:forEach>
				                     </tbody>
			                  </table>
			               </td>
			            </tr>
		            
		            
		            <tr>
		               <td></td>
		               <td align = "center">
		               		<div class = food_in>
		               			<button id = "food_insert" type = "button">
		               				<img src="${pageContext.request.contextPath}/resources/img/icon/insert_food.svg"/>
		               			</button>
		               			/
		               			<button id = "food_delete" type = "button">
		               				<img src="${pageContext.request.contextPath}/resources/img/icon/delete_food.svg"/>
		               			</button>
		               		</div>
		               </td>
		               <td></td>
		            </tr>
		            
		            <tr>
		               <th>요리순서</th>   
		               <td></td>
		               <td></td>
		            </tr>
		            
		            <tr>
		            <!--    <td class = "text"><strong>Step1</strong></td> -->
		               <td colspan = "3">
		                  <table id = "step">
			                  <tbody>
				                  <c:forEach var = "s1" items = "${mRecipe_step }" varStatus="sta">
				                  		<% st_nu = st_nu+1; %>
					                     <tr id = "step${sta.count }">
					                        <td class = "text"><strong>${s1.st_no }</strong></td>
					                        <td><textarea name = "steptext_${sta.count }" placeholder = "예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요" id = "steptext${sta.count }" required>${s1.st_content }</textarea></td>
					                        <td>               		
					                        	<div class = "step_img" id = "stepPhothHolderBox_${sta.count }" is_over = "0">
						                        	<div id = "divStepPhotoHolder_${sta.count }" style = "position:relative;">
							                        		<a id = "btnDelStepPhoto_${sta.count }" class = "pic_del" href="javascript:delStepPhoto(${sta.count });" style = "display:none;"></a>
							                  				<a href = "javascript:" onclick = "fileUploadAction(${sta.count });">
							                  					<!-- <img id = "stepPhotoHolder_1" onclick = "browseStepFile(1)" src = "icon/insert_img.svg" style = "cursor:pointer"/> -->
							                  					<img id = "stepPhotoHolder_${sta.count }" src = "/img/${s1.st_image }" style = "cursor:pointer;"/>
							                  				</a>
															<input type = "file" id = "input_img_${sta.count }" name = "step_${sta.count }"/>
													</div>
					                  			</div>
					                  		</td>
					                     </tr>
				                     </c:forEach>
			                     </tbody>
		                  </table>
		               </td>
		            </tr>
		            
		            <tr>
		               <td></td>
		               <td align = "center">
		               		<div class = step_in>
		               			<button id = "step_insert" type = "button">
		               				<img src="${pageContext.request.contextPath}/resources/img/icon/insert_step.svg"/>
		               			</button>
		               			/
		               			<button id = "step_delete" type = "button">
		               				<img src="${pageContext.request.contextPath}/resources/img/icon/delete_step.svg"/>
		               			</button>
		               		</div>
		             	</td>
		               <td></td>
		            </tr>
		            
		            <tr>
		               <th>요리 완성 사진</th>
		               <td colspan = "3">                  
		               		<div class = "complete_img" id = "WorkPhothHolderBox_1" is_over = "0">
		               			<div id = "divWorkPhotoHolder_1" class = "complete_pic" style = "position:relative; left:0px; top: 0px;">
		               					 <a id = "btnDelWorkPhoto_1" class = "pic_del" href="javascript:delWorkPhoto(1);" style = "display:none;"></a>
		               					<a href = "javascript:" onclick = "fileUploadAction_work(1);">
		               						<img id = "WorkPhotoHolder_1" src = "/img/${mRecipe.complete_img }" style = "cursor:pointer;"/>
										</a>
										<input type = "file" id = "work_img_1" name = "work_1"/>
		               				</div>
		                  	</div>	        	
		               </td>
		            </tr>
		            
		            <tr>
		               <th>요리 팁</th>
		               <td colspan = "3"><textarea name = "recipe_tip" id = "recipe_tip" placeholder = "예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요.">${mRecipe.recipe_tip }</textarea></td>
		            </tr>
		         </tbody>
		         
		         <tfoot class = "tfoot">
		            <tr>
		               <td colspan = "4" align = "center">
		                  <input type = "button" id = "insert" value = "저장" onclick = "check();">
		                  <a href = "Mypage_my.do?nickname=${login_nickname}"><input type = "button" id = "cancle" value = "취소"></a>
		               </td>
		            </tr>
		         </tfoot>
		      </table>
		   </form>
		   
		</div>
		<jsp:include page="../main/footer.jsp" /> <!-- 푸터부분 삽입 -->
	</div>
</div>





<%-- <script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script> --%>
<script type = "text/javascript">

/*    var food = document.getElementById('food'); 
	var step = document.getElementById('step');  */

	/*   function food_insert_click() {
		  $('#food > tbody:last').append('<tr><td><input type = "text"></td><td align = "left"><input type = "button" id = "food_del"></td></tr>');
	} */

	var fo_nu = <%= fo_nu %>;
	var st_nu = <%= st_nu %>;
	
	
	$('#food_insert').click(function() {
		fo_nu = fo_nu + 1;
	 $('#food > tbody:last').append('<tr id = "food' + fo_nu + '"><td><input type = "text" name = "food' + fo_nu + '_tx1" placeholder = "예) 돼지고기" required></td><td><input type = "text" name = "food' + fo_nu + '_tx2" placeholder = "예) 300g" required></td></tr>');
	});

	$('#food_delete').click(function() {
		fo_nu = fo_nu - 1;
		  $('#food > tbody:last > tr:last').remove();
	});


	$('#step_insert').click(function() {
		st_nu = st_nu + 1;
	    $('#step > tbody:last').append('<tr id = "step' + st_nu + '"><td class = "text"><strong>Step'+ st_nu +'</strong></td><td><textarea name = "steptext_' + st_nu + '" placeholder = "예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요" id = "steptext' + st_nu + '" required></textarea></td><td><div class = "step_img" id = stepPhothHolderBox_' + st_nu + ' is_over = "0"><div id = "divStepPhotoHolder_' + st_nu + '" style = "position:relative;"><a id = "btnDelStepPhoto_' + st_nu + '" class = "pic_del" href="javascript:delStepPhoto(' + st_nu + ');" style = "display:none;"></a><a href = "javascript:" onclick = "fileUploadAction(' + st_nu + ');"><img id = "stepPhotoHolder_' + st_nu + '" src = "${pageContext.request.contextPath}/resources/img/icon/insert_img.svg" style = "cursor:pointer;"/></a><input type = "file" id = "input_img_' + st_nu + '" <input type = "file" id = "input_img_1" name = "step_' + st_nu + '" multiple/></div></td></tr>');
	});

	$('#step_delete').click(function() {
		st_nu = st_nu - 1;
		$('#step > tbody:last > tr:last').remove();
	}); 


	    
</script>
</body>
</html>