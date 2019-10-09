<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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
		
		$('div.fileInput').on('click','div.inputRow > button', function(event){
			
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
		 function registerSummernote(element, placeholder, max, callbackMax) {
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
			  registerSummernote('#not_content', 'Leave a comment', 3000, function(max) {
			    $('#maxContentPost').text(max+"/3000");
			  });
			});
		   function onSubmit(form,url,method,no){
				form.action="<%=request.getContextPath()%>/notice/"+url+"?not_no="+no;
				form.method=method;
				form.submit();
				
			}
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