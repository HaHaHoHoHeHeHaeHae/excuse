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
function changeIframe(name){
	document.getElementById("if_list").src="<%=request.getContextPath()%>/"+name;
}
$('.hmenu1').click(function(){
	$('.hmenu1').css("background","");
	$(this).css("background","linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0) 55%,rgba(0,0,0,0) 61%,rgba(0,0,0,0.16) 100%)");
});
</script>
