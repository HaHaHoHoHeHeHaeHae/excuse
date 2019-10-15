<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="blackList" value="${dataMap.blackList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<head>
<meta charset="utf-8">
<title>동호회 블랙 리스트</title>
<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

</head>
<body class="subpage">
	<div style="margin-left:50px;margin-top:-88px; width:280px; border-bottom:1px solid gray;">
		<h1 style="margin:0; color:#25a1c3;">동호회 블랙 리스트</h1>
	</div>	
      <!-- Main -->
    <section id="main" class="wrapper" >
        <!-- Elements -->
		<div class="row 200%" style="margin-left:50%;margin-top:-80px;">
			<div class="row" style="margin-bottom:20px;" >
			<select name="sortType"  id="sortType" style="width:100px; text-align:center; margin-left:20px; margin-right:10px; margin-top:10px; height:45px;">
								<option value="0" >전체</option>
								<option value="1">운영중</option>
								<option value="2">운영중지</option>

							</select>
					<input name="keyword" type="text" class="form-control" style="height:45px; width:260px; margin-top:10px;" placeholder="동호회명을 입력하세요">
				<ul class="actions" >
   					<li><a id="searchBtn" href="#" class="btn btn-block btn-secondary" style="height:45px; margin-top:10px; margin-left:15px; text-decoration:none;padding-top:10px;"  onclick="onSearch();">검색</a></li>
   				</ul>
			</div>
			
			
			
	</div>
	<div class="12u 12u$" style="height: 500px;">
				<div style="position: relative; margin-top: -30px;">
					<iframe id="if_list3" name="if_list3" frameborder="0" scrolling="0"
						src="<%=request.getContextPath()%>/manage/blacklist/blackListTable"
						style="position: absolute; top: 0px; left: 0px; bottom: 0px; height: 700px; width: 100%; border: 0px;">
					</iframe>
				</div>
			</div>
</section>

<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
   winleft = (screen.width - WinWidth) / 2;
   wintop = (screen.height - WinHeight) / 2;
   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
                         +", height="+ WinHeight +", top="+ wintop +", left=" 
                         + winleft + ", resizable=no, status=yes"  );
    win.focus() ; 
}
      
      
function onSearch(){
	
	var sortType=$('select#sortType').val();
	var keyword=$('input[name="keyword"]').val();
	
	
	searchList(sortType,keyword);
}

function searchList(sortType,keyword){
	document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/blacklist/blackListTable?sort="+ sortType + "&keyword=" + keyword;
}
   </script>

</body>