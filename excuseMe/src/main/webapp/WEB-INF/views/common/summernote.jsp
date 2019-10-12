
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SummerNote</title>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/adminLTE/dist/css/adminlte.min.css">
  
  <!-- Time Line -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/adminLTE/build/scss/_timeline.scss">
  
    <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  <!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">

<!-- jQuery -->
  <script src="<%=request.getContextPath() %>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>
  
  <!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/adminLTE/plugins/summernote/summernote-bs4.css">

</head>
<body>

      <div class="col-md-12" id="content">
      	
         ss
      </div>
</body>
</html>
  
  <!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/adminLTE/dist/js/adminlte.min.js"></script>

<!-- InputMask -->
<script src="<%=request.getContextPath() %>/resources/adminLTE/plugins/inputmask/jquery.inputmask.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/adminLTE/plugins/moment/moment.min.js"></script>

<!-- 공지사항 등록할때 섬머노트 경로지정 및 실행 -->
<script src="<%=request.getContextPath() %>/resources/adminLTE/plugins/summernote/summernote-bs4.min.js"></script>  

<script>
   $('#content').summernote({
      height:430,
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
         cache: false,
         success: function(resp) {
            console.log(resp);
         }
      });
   }
   
</script>  
    
