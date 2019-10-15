<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- 
<c:set var="attachT" value="${dataMap.attachThum }" /> --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동호회 수정</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/summernote/summernote-bs4.css">
<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/adminLTE/plugins/summernote/summernote-bs4.min.js"></script>
<!-- Time Line -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/build/scss/_timeline.scss">
<style>
	.caution{
			height:5px;
			margin-left:200px;
			color:red;
			margin-top:-5px;
	}
</style>
</head>
<body>
	<div style="width:800px;">
		
		
		<div class = "card-header">
			<input type="hidden" id="mem_id" name="mem_id" value="${loginUser.mem_id }">
			<input type="hidden" id="club_no" name="club_no" value="${club.club_no }">
			<h2 style="margin-left: 40px; margin-bottom:0; font-weight: 900; color: #4f9cc2;">동호회 수정</h2>
		</div>
		<div class= "card-body">
			<div>
				<div class="text-center">
					<img class="img-fluid" id="thum" 
					
					<c:if test="${attachThum.attach_no > 0}">
						src="<%=request.getContextPath()%>/attach/img?attach_no=${attachThum.attach_no}" style="width:200px;height:200px;"
					</c:if>
					<c:if test="${attachThum==null}">
						src="<%=request.getContextPath()%>/resources/img/logo.png" style="width:200px;height:200px;"
					</c:if>	
					/>
					
				</div>
				<div>
				<p></p>
				</div>
				<form id="club_RegistThum" name="club_RegistThum" enctype="multipart/form-data">
					<div class="text-center">
					    <button type="button"  class="btn btn-block btn-outline-secondary" style="width:160px;margin-left:300px;">대표사진 변경하기</button>
						<input type="file" style="width:170px;margin-left:-80px;margin-top:-35px;opacity:0;position:absolute;" name="uploadThum" id="uploadThum" />
					</div>
					<div>
						<p style="font-size:0.9em; color:gray; margin-left:250px;">사진 크기는 200x200(픽셀)으로 고정됩니다.</p>
					</div>
				</form>
			</div>
			<div class="row">
				<div  class="col-md-3">
					<h5 style="font-weight: bold; margin-top: 7px;margin-left:40px; color: #768d99;">지&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp역</h5>
				</div>
				<div  class="col-md-4">
					<select class="form-control" id="club_local1" name="club_local1">
						<option value="fail"disabled>- 광역시, 도 -</option>
						<option value="${main_local }" selected id="main_local">${main_local }</option>
								<c:forEach var="local" items="${localList}">
									<option value="${local.local_name }">${local.local_name }</option>
								</c:forEach>
					</select>
				</div>
				<div class="col-md-1">
					<h5 style="font-weight: bold; margin-top: 7px;margin-left:22px; color: #768d99;">-</h5>
				</div>
				<div  class="col-md-4">
					<select class="form-control" id="club_local2" name="club_local2" >
						<option value="${sub_local }" selected disabled>${sub_local }</option>
						<c:forEach var="subLocal" items="${subLocalList}">
									<option value="${subLocal.local_sub_name }">${subLocal.local_sub_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div>
				<p class="caution"></p>
			</div>
			<div class="row" style="margin-left:35px;">
				
			    <textarea id="club_content" name="club_content"> ${club.club_content }</textarea>
			</div>
			<div class="row" style="margin-top:10px;">
				
				<div class="card-header" style="margin-left:60px;width:700px;padding:0;">
					<div class="row">
						<div>
							<h5 style="font-weight: bold; margin-top: 7px;margin-left:22px; color: #768d99;">첨부&nbsp&nbsp파일</h5>
						</div>
						<div>
							<button type="button" class="btn btn-block btn-default" style="color: #768d99;font-weight: bold;margin-left:30px;" onclick="uploadFile()">추가하기</button>
						</div>
					</div>
					
				</div>
				<form id="club_Regist" name="club_Regist" enctype="multipart/form-data" role="form">
					<div class="card-body fileInput"style="width:200px;padding-top:10px;">
						<div class="attached row" style="width: 1200px;margin-top:10px; margin-left:50px;">
						<c:forEach items="${attach}" var="attach">
							<div class="col-sm-4 attached-inputRow" attach-name="${attach.attach_name }" attach-no="${attach.attach_no }" style="cursor: pointer;" >
								<button type="button" style="border: 0; outline: 0; z-index:100;"
									class="badge bg-red float-right" >X</button>
								<div class="info-box uploadedList" onclick="location.href='<%=request.getContextPath()%>/attach/get?attach_no=${attach.attach_no}'">
									<span class="info-box-icon">
											<img src="<%=request.getContextPath() %>/attach/thum?attach_no=${attach.attach_no }" />
									</span>
									<div class="info-box-content">
										<span class="info-box-text"> 
											${attach.attach_regDate }
										</span>
										<span class="info-box-number text-overflow">
											${attach.attach_name } 
										</span>
									</div>

								</div>
							</div>
						</c:forEach>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class= "card-footer">
			<div class="row" style="margin-left:290px;">
				<div>
					<button type="button" class="btn btn-block btn-info" style="width:100px;" onclick="registClub()">수정</button>
				</div>
				&nbsp&nbsp&nbsp&nbsp
				<div>
					<button class="btn btn-block btn-secondary" style="width:100px;" onclick="onClose();" >취소</button>
				</div>	
			</div>
		</div>
		
	</div>
	
			<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>

		<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script>
	
	function onClose(){
		window.close();
	}
	
	function registerSummernote(element, placeholder, max, callbackMax) {
		 $('#club_content').summernote({
		      height:410,
		      placeholder:"",
		      tabsize:1,
		      fontNames : ['맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
		      fontNamesIgnoreCheck : ['맑은고딕'],
		      focus: true,
		      lang : 'ko-KR',
		       toolbar: [
		               ['style', ['style']],
		               ['font', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
		               ['fontname', ['fontname']],
		               ['fontsize', ['fontsize']],
		               ['color', ['color']],
		               ['para', ['ul', 'ol', 'paragraph']],
		               ['height', ['height']],
		               ['table', ['table']],
		               ['insert', ['link', 'picture', 'video', 'hr']],
		               ['view', ['codeview']]
		           ],
		           callbacks: {
		              onImageUpload : function(files, editor, welEditable) {
		                 
		                 for(var i = files.length - 1; i >= 0; i--) {
		                    if(files[i].size > 1024 *1024*5){
		                       alert("이미지는 5MB 미만입니다.");
		                       return;
		                    }
		                    <%-- 본문내용에 사진 추가시 사진파일인지 확인한다.--%>
		                    if(files[i].name.substring(files[i].name.lastIndexOf(".")+1).toLowerCase()!="jpg" && 
		                          files[i].name.substring(files[i].name.lastIndexOf(".")+1).toLowerCase()!="gif" &&
		                          files[i].name.substring(files[i].name.lastIndexOf(".")+1).toLowerCase()!="png" &&
		                          files[i].name.substring(files[i].name.lastIndexOf(".")+1).toLowerCase()!="jpeg"){
		                       alert("본문내용에는 이미지만 올릴 수 있습니다.");
		                       return;
		                    }
		                 }
		                 for(var i = files.length - 1; i >= 0; i--) {
		                    sendFile(files[i], this);
		                 }
		                 
		              },
		              onMediaDelete : function(target) {
		                 alert("delete image : " + target[0].src);
		                 deleteFile(target[0].src);
		              },
		              onKeydown: function(e) {
		                  var t = e.currentTarget.innerText;
		                  if (t.trim().length >= max) {
		                    //delete key
		                    if (e.keyCode != 8)
		                      e.preventDefault();
		                    // add other keys ...
		                  }
		                },
		                onKeyup: function(e) {
		                  var t = e.currentTarget.innerText;
		                  if (typeof callbackMax == 'function') {
		                    callbackMax(max - t.trim().length);
		                  }
		                },
		                onPaste: function(e) {
		                  var t = e.currentTarget.innerText;
		                  var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
		                  e.preventDefault();
		                  var all = t + bufferText;
		                  document.execCommand('insertText', false, all.trim().substring(0, 400));
		                  if (typeof callbackMax == 'function') {
		                    callbackMax(max - t.length);
		                  }
		                }
		           }
		 		
		   });}
	 $(function(){
		  registerSummernote('#club_content', 'Leave a comment', 3000, function(max) {
		    $('#maxContentPost').text(max+"/3000");
		  });
		}); 
	 
	 function sendFile(file, el) {
	      var form_data = new FormData();
	      form_data.append("file", file);
	      form_data.append("id","admin@naver.com");
	      
	      $.ajax({
	         data: form_data,
	         type: "POST",
	         url: '<%=request.getContextPath()%>/uploadImg',
	         contentType: false,
	         processData: false,
	         success: function(img_url) {
	            $(el).summernote('editor.insertImage', img_url);
	         }
	      });
	   } 
		function deleteFile(src) {
		      
		      /* src.split("/")[src.split("/").length-1]; */
		      
		      $.ajax({
		         data: {fileName : src.split("/")[src.split("/").length-1]},
		         type: "POST",
		         url: "<%=request.getContextPath()%>/deleteImg",
				cache : false,
				success : function(resp) {
				console.log(resp);
						}
					});
				}
	 
	 $("#club_local1").change(function(){
			
			var local = $("#club_local1").val();
			
			$.ajax({
				data:{local_name:local},
				type:"GET",
				url:"<%=request.getContextPath()%>/common/registLocal",
				success:function(data){
					$("#main_local").remove();
					$("#club_local2").html("");
					$("#club_local2").append("<option value='fail' selected disabled>- 시, 구 -</option>");
					for(var sub of data){
						console.log(sub.local_sub_name);
						$("#club_local2").append("<option>"+sub.local_sub_name+"</option>");
					}
							
				},
				error:function(){
					alert("서버오류입니다.");
				}
			});
		});
	 
	 $('#uploadThum').change(function(){
		 var thum = $('#uploadThum').val();
		 	if(thum != null){
		 		var type = thum.slice(thum.lastIndexOf('.')+1);
		 		if(!(type == "jpg" || type == "png" || type == "jpeg")){
		 			alert("대표사진은 jpg, png, jpeg 파일만 가능합니다.");
		 			return false;
		 		}
		 	}
		 readURL(this);
	 });
	 
	 function readURL(input){
		
		 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#thum').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
	 }
	 
	 function uploadFile(){
		 var attachedFile=$('div.attached-inputRow').length;
			var inputFile=$('input[name="uploadFile"]').length;
			var attachCount = attachedFile+inputFile;
			
			if(attachCount >= 5){
				alert("파일추가는 5개까지만 가능합니다.");
				return;
			}
		 
		 var input=$('<input>').attr({"type":"file", "name":"uploadFile"}).css({"dispaly":"inline", "margin-left":"50px","margin-top":"10px"});
		 
		 var div = $('<div>').addClass("inputRow").css("width","600px");
		 
		 div.append(input).append("<button style='border:0;outline:0;width:40px;' class='badge bg-red' type='button'>X</button>");
		 
		 div.appendTo('.fileInput');
	 }
	 
	 function registClub(){
		 
		var files = $('input[name="uploadFile"]');
		 
	 	for(var file of files){
		 	console.log(file.name+" : "+file.value);
		 	if(file.value==""){
		 		alert("파일을 선택하세요.");
		 		file.focus();
		 		return false;
		 	}
		 } 
	 	
	 	var no = club_no.value;
	 	
	 	var local = club_local1.value + "_" +club_local2.value;
	 	
	 	var content= club_content.value;

	 	if(club_local1.value == "fail" || club_local2.value == "fail"){
	 		alert("잘 못 된 입력입니다. 다시 입력하십시오.");
	 		return false;
	 	}else{
	 		$.ajax({
		 		url:"<%=request.getContextPath()%>/club/modify",
		 		type:"post",
		 		data:{
		 			club_no: no,
		 			club_content: content,
		 			club_local : local,

		 			},
		 		success:function(club_no){ 			
		 			onSubmit(document.club_RegistThum,"modifyAttachThum","post",club_no);
		 			
		 			onSubmit(document.club_Regist,"modifyAttach","post",club_no);
		 			
		 			alert("동호회 정보가 수정 되었습니다.");
					
		 		},
		 		error:function(){
		 			alert("서버 오류입니다.");
		 		},
		 		complete:function(){
		 			window.opener.location.reload();
		 			window.close();
		 		}
		 	});
	 	}
	 	
	 }
	 
	 function onSubmit(form,url,method,no){
		 	
			form.action="<%=request.getContextPath()%>/club/"+url+"?club_no="+no;
			form.method = method;
			form.submit();
	}
	
	 $(function(){
		 $("#club_name").keyup(function(){
				var name = $("#club_name").val();
				if(name != 0) {
					if(chkName2(name)){
						$("#caution").html("");
						$("#caution_check").val("success");
					}else{
						$("#caution").html("한글과 영문만 입력 가능합니다.");
						$("#caution_check").val("");
					}
				}else{
					$("#caution").html("빈칸을 입력하실 수 없습니다.");
					$("#caution_check").val("");
				}	
			}); 
	 });
	 function chkName2(name){
			var chkName = new RegExp(/^[가-힣a-zA-Z]{1,10}$/);
			return chkName.test(name);
		}
	 function findName(){
		 var name = club_name.value;
		 
		 $.ajax({
			url : "<%=request.getContextPath()%>/club/findName",
			data : {
				club_name:name
			},
			type:"GET",
			success:function(name){
				alert(name + "은(는) 사용 가능한 이름입니다.");
				$("#club_name").css("disable",true);
			},
			error:function(){
				alert("이미 존재하는 이름입니다.");
				$("#club_name").val("");
			}
		 });
	 }
	 $('div.fileInput').on('click','div.inputRow > button', function(event){
			$(this).parent('div.inputRow').remove();	
	});
	 $('.attached button').on('click',function(event){
			event.stopPropagation();
			
			var parent = $(this).parent('div.attached-inputRow');
			alert(parent.attr("attach-name")+"파일을 삭제합니다.");
			
			var attach_no = parent.attr("attach-no");
			
			var input = $('<input>').attr({"type":"hidden",
										 "name":"deleteFile",
										 "value":attach_no
										 });
			
			$('form[role="form"]').prepend(input);
			
			parent.remove();
		});
	</script>
	
</body>
</html>