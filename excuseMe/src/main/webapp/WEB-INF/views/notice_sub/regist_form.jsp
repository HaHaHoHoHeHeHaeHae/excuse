<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</head>
<body>


	<!-- Main -->
	
	<div class="inner" style="width:98%;">


		<!-- Elements -->
		<div class="row" style="border-bottom:1px solid gray">
			<h2 style="margin-left:40px; margin-bottom:20px; font-weight:900; color:#4f9cc2;">공지사항 작성</h2>
		</div>
		
		<input type="hidden" id="not_startDate" name="not_startDate" value="" />
		<input type="hidden" id="not_endDate" name="not_endDate" value="" />
		<div class="row" style="margin-top:20px; margin-left:30px;">
			<div >
				<h5 style="font-weight:bold;margin-top:5px;color:#768d99;">제&nbsp&nbsp&nbsp&nbsp&nbsp목</h5>
			</div>
			<div>
				<input type="text" class="form-control" id="not_title" name="not_title" style="margin-left:50px; width:600px;">
			</div>
		</div>
		<div class="row" style="margin-top:10px; margin-left:30px;">
			<div>
				<h5 style="font-weight:bold;margin-top:5px;color:#768d99;">게시일</h5>
			</div>
			<div>
				<input type="text" id="startEndDate" class="form-control" style="margin-left:50px; width:300px;">
			</div>
		</div>
		<div  style="margin-top:20px;">
			<textarea class="summernote" id="not_content" name="not_content"></textarea>

		</div>
		<div>
			<div class="row uniform" style="margin-top:10px; margin-left:30px;">
				<h5 style="font-weight:bold;margin-top:5px;color:#768d99;">첨부파일</h5>
				<button type="button" id="addFileBtn" class ="btn btn-block btn-default btn-sm"style="margin-left:25px;width:50px;padding-top:5px;">추가</button>
			</div>
			<div class="box-footer fileInput"></div>
		</div>
		
		<div class="text-center" style="margin-left:420px;">
			<div class="row">
				<div >
					<button type="button" class="btn btn-block btn-info" onclick="insertNotice()" style="width:100px;">글 등록</button>
				</div>
				<div style="margin-left:20px;">
					<button type="button" class="btn btn-block btn-outline-info" style="width:100px;"onclick="window.parent.location.href='<%=request.getContextPath()%>/notice/list'">뒤로가기</button>
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
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script>
		$(function() {
			//Date range picker
			$('#startEndDate').daterangepicker({
				opens : 'left',
				changeMonth : true,
				changeYear : true,
				startDate : moment(),
				endDate : moment().add(30, 'days'),
				locale : {
					format : 'YYYY/MM/DD'
				}

			});

			$('#startEndDate').on("change",setReservationTime);
			setReservationTime();

		});
		$('#addFileBtn').on('click',function(event){
			//alert("add File btn click");
		  
			if($('input[name="uploadFile"]').length >=5){
				alert("파일추가는 5개까지만 가능합니다.");
				return;
			}
			
			var input=$('<input>').attr({"type":"file",
										"name":"uploadFile",
										}).css("display","inline");
			
			var div=$('<div>').addClass("inputRow");
			    div.append(input).append("<button style='border:0;outline:0;width:40px;' class='badge bg-red' type='button'>X</button>");
			    
			    div.appendTo('.fileInput');
		});


		$('div.fileInput').on('click','div.inputRow > button', function(event){
			//alert("X btn click;");
			$(this).parent('div.inputRow').remove();
			
		});

		$('.fileInput').on('change','input[type="file"]',function(event){
			if(this.files[0].size>1024*1024*40){
				alert("파일 용량이 40MB를 초과하였습니다.");
				this.value="";
				$(this).focus();
				return false;
			}
		});
		
		
	
	
	function insertNotice(){
		var id = "admin@naver.com";
		var startDate = not_startDate.value;
		var endDate = not_endDate.value;
		var title = not_title.value;
		var content=not_content.value;
		console.log(id+startDate+endDate+title+content);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/regist",
			type:"POST",
			data:{
				mem_id : id,
				not_startDate2 : startDate,
				not_endDate2 : endDate,
				not_title : title,
				not_content : content
			},
			success:function(){
				alert("글이 등록되었습니다.");
				window.parent.location.href="<%=request.getContextPath()%>/notice/list";
			},
			error:function(){
				alert("서버 오류입니다.");
			}
			
		});
	}
	
		var setReservationTime = function () {
			//alert($(this).val()); 

			var date2 = startEndDate.value;
			console.log(date2);
			var date = date2.split('-');
			console.log(date);
			$("#not_startDate").val(
					date[0].replace(/\//gi, "-").trim());
			$("#not_endDate").val(date[1].replace(/\//gi, "-").trim());
		}
	</script>
	<script>
   $('#not_content').summernote({
      height:410,
      placeholder:"",
      tabsize:50,
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
              }
           }
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
	</script>

</body>
</html>