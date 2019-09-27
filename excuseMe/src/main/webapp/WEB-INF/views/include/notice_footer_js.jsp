<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
		                	+", height="+ WinHeight +", top="+ wintop +", left=" 
		                	+ winleft + ", resizable=no, status=yes"  );
    win.focus() ; 
}
	
</script>
<!-- summernote -->

<script>
     // 글등록 내용 스마트에디터
    $('#content').summernote({
        height:200,
         placeholder:"여기에 내용을 작성하세요.",
         tabsize:2,
         fontNames:[ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
         fontNamesIgnoreCheck : [ '맑은고딕' ],
         focus: true,
         lang : 'ko-KR',
         
         callbacks:{
            onImageUpload : function(files, editor, welEditable) {
              // for(var i in files) 와 같음. 'in'은 파일의 인덱스를 불러옴. 아래 for문은 인덱스가 거꾸로 들어옴.
               for(var i = files.length - 1; i >= 0; i--) {
                  if(files[i].name.substring(files[i].name.lastIndexOf(".")+1).toLowerCase() != "jpg") {
                     alert("jpg 확장자만 가능합니다.");
                     return;
                  }
                  
                 // files[i] : 인덱스를 하나씩 꺼냄.
                  //alert(files[i].name);
                  if(files[i].size > 1024*1024*1) {
                     alert("이미지는 5MB 미만입니다.");
                     return;
                  }
               }
              for(var i = files.length - 1; i >= 0; i--){
            	  sendFile(files[i],this);
              }
            },
            onMediaDelete : function(target) {
               //alert(target[0].src);
               deleteFile(target[0].src);
            }
         }
         
     });
</script>