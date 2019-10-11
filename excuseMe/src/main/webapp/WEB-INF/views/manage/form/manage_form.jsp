<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

</style>
</head>
<body class="subpage">


	<!-- Menu -->
	<div class="inner" style="margin-left:-3px; ">					
		<div id="sidebar" style="margin-top:120px;margin-left:120px;float:left;z-index:100;position:absolute;background: #25a1c3;width: 250px;height: 1000px;text-align: center;display: inline-block;vertical-align: middle;height: 100%;">
			
			<div style="height:50px;background:#306170;">
				<p style=" padding-top:6px;font-size:1.3em; color:white; font-weight:bold;">관리자 페이지</p>
			</div>
			<div onclick="changeIframe2('club/clubList');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">동호회 리스트</p>
			</div>
			<div onclick="changeIframe2('blacklist/list');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">동호회 블랙 리스트</p>
			</div>
			<div onclick="changeIframe2('newclub/list');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">신규 동호회 관리</p>
			</div>
			<div onclick="changeIframe2('member/list');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">회원 관리</p>
			</div>
			
		</div>
	</div>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">


			<!-- Elements -->
		
			<div class="12u 12u$" style="height: 500px;">
				<div style="position: relative; margin-top: 20px;">
					<iframe id="if_list2" name="if_list2" frameborder="0" scrolling="0"
						src="<%=request.getContextPath()%>/manage/club/clubList"
						style="position: absolute; top: 0px; left: 0px; bottom: 0px; height: 1050px; width: 100%; border: 0px;">
					</iframe>
				</div>
			</div>
		</div>
	</section>
	<div id="footer_div" style="margin-top:500px;">
		<footer id="footer" >
			<div class="inner">
				<h2>Get In Touch</h2>
				<ul class="actions">
					<li><span class="icon fa-phone"></span> <a href="#">(000)
							000-0000</a></li>
					<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
					<li><span class="icon fa-map-marker"></span> 123 Somewhere Road, Nashville, TN 00000</li>
				</ul>
			</div>
			<div class="copyright">
				&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
				Images <a href="https://unsplash.com">Unsplash</a>.
			</div>
		</footer>
	</div>	 
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	function changeIframe2(name){
		
		document.getElementById("if_list2").src="<%=request.getContextPath()%>/manage/"+name;
		
	}
	
	/* function change1(obj){
        obj.style.background = '#306170';
        obj.style.color = 'white';
    }
     
    function change2(obj){
        obj.style.background = '#25a1c3';
        obj.style.color = 'black';
    } */
    
    
   


	</script>
</body>
</html>