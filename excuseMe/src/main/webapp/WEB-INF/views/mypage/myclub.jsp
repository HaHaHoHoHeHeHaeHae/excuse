<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 생성한 동호회</title>
<%-- 
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>
<%-- <c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>


<style>
#subm {
	top: 170px;
	position: absolute;
	height: 500px;
	width: 240px;
	z-index: 5;
	background: #25A2C3;
	left: 4px;
	margin: 0px;
	padding: 0px;
	border-radius: 0px 10px 10px 0px;
}

.atag {
	font-size: 18px;
}

#section_div {
	position: absolute;
	left: 280px;
	width: 1200px;
}
</style>
</head>

<body>

<%-- 사이드바 	
	<div id="subm">
		<br> <br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myjoinlist" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입한
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myclub" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생성한
			동호회</a><br> <br> <a href="<%=request.getContextPath()%>/mypage/wishlist" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심
			동호회</a><br> <br> <a href="<%=request.getContextPath()%>/mypage/myreply" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가
			쓴 댓글</a><br> <br> <a href="<%=request.getContextPath()%>/mypage/myinfo" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>


	</div> --%>
	
	<div id="sidebar" style="margin-top:120px;margin-left:120px;float:left;z-index:100;position:relative;background: #25a1c3;width: 250px;height: 1000px;text-align: center;display: inline-block;vertical-align: middle;height: 100%; left: -3px;">
			
			<div style="height:50px;background:#306170;">
				<p style=" padding-top:6px;font-size:1.3em; color:white; font-weight:bold;">마이 페이지</p>
			</div>
			<div class="subButton" onclick="myPage('myjoinlist');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">가입한 동호회</p>
			</div>
			<div class="subButton" onclick="myPage('myclub');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">생성한 동호회</p>
			</div>
			<div class="subButton"  onclick="myPage('wishlist');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">관심 동호회</p>
			</div>
			<div class="subButton" onclick="myPage('myreply');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">내가 쓴 댓글</p>
			</div>
			<div class="subButton" onclick="myPage('myinfo');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;" >개인정보수정</p>
			</div>
			
		</div>
	

	<div id="all_div">
		<div id="section_div" style="postion: relative; left: 5px; top: 18px; width: 1570px;">
			<!-- Main -->
			<section id="main" class="wrapper"> <!-- Menu --> <!-- Elements -->
			<div class="row">
				<h2 id="elements">마이페이지 - 생성한 동호회</h2>
				
			</div>
			<div class="row 200%">
				<div class="12u">
					<!-- Table -->

					<c:if test="${empty myClubList }">
						<b><strong style="position: relative; left: 45px;">
						생성한 동호회가 없어요.</strong></b>
						<div style="postion: relative; height: 400px;"></div>
					</c:if>

					<c:if test="${!empty myClubList }">
						<c:forEach var="club" items="${myClubList }">
							<div class="myClubList_body"
								style="width: 300px; float: left; border: 1px dashed #bcbcbc; margin-left: 3px; margin-right: 3px; width: 219px;">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" style="width: 100px; height: 100px;"
											<c:if test="${club.attachThum_no > 0}">
												src="<%=request.getContextPath()%>/attach/img?attach_no=${club.attachThum_no}";
											</c:if>
											<c:if test="${club.attachThum_no <= 0}">
												src="<%=request.getContextPath()%>/resources/img/logo.png"
											</c:if> >			
											
									</div>
									<h3 class="profile-username text-center"
										style="height: 31px; width: 190px; overflow: hidden; text-overflow: ellipsis;">${club.club_name }</h3>

									<ul class="list-group list-group-unbordered mb-3">

										<li class="list-group-item text-center"
											style="height: 40px; width: 198px; left: -10px;"><b
											id="btag"> 승인여부&nbsp;&nbsp;:&nbsp;&nbsp; <c:if
													test="${club.club_status eq '0'}">
													<i class="fas fa-exclamation-circle" style="color: #c7c402;">&nbsp;승인대기</i>&nbsp;
													</c:if> <c:if test="${club.club_status eq '1'}">
													<i class="fas fa-check-circle" style="color: green;">&nbsp;승인</i>&nbsp;&nbsp;
													</c:if> <c:if test="${club.club_status eq '2'}">
													<i class="fas fa-times-circle" style="color: red;">&nbsp;운영중지</i>&nbsp;
													</c:if>
										</b></li>
										
										<li class="list-group-item text-center" style="height: 40px; width: 198px; left: -10px;">
											<b id="btag">
												<i class="fas fa-user-alt"></i>&nbsp;&nbsp;${club.joincnt }
												&nbsp;&nbsp;
												<i class="far fa-thumbs-up"></i>&nbsp;&nbsp;${club.upcnt }
												&nbsp;&nbsp;
												<i class="fas fa-thumbs-down"></i>&nbsp;&nbsp;${club.downcnt }
											</b>
										</li>

									</ul>
									<ul class="actions vertical small" style="text-align: center;">
										<li>
											<div class="btn_g" style="position: relative;">
												<div class="btn-group" style="position: absolute; left: -18px; top: -10px;">
													<a href="#" class="button small" style="color: white; width: 108px; height: 35px; position: relative;">
														<p style="position: relative; left: -12px; font-size: 15px;"
														   onclick="OpenWindow('<%=request.getContextPath()%>/club/detail?club_no=${club.club_no }','','825','650')">상세보기</p>
													</a> &nbsp; <a href="#" class="button special small" style="color: white; width: 102px; height: 35px; position: relative;">
														<p style="position: relative; left: -12px; font-size: 15px;"
														   onclick="OpenWindow('<%=request.getContextPath()%>/mypage/myclubuser?club_no=${club.club_no }','','605','753')" >회원보기</p>
													</a>
												</div>
											</div>
										</li>

									</ul>
								</div>
							</div>
						</c:forEach>
					</c:if>
			</section>

			<%-- 			<!-- pagination Start-->
			<div class="card-body">
				<div class="pagination justify-content-center m-0">
					<ul class="pagination ">
						<li class="page-item"><a class="page-link"
							href="joinclub${pageMaker.makeQuery(1)}" style="text-decoration: none">&lt;&lt;</a>
						<li class="page-item"><a class="page-link"
							href="joinclub<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
							style="text-decoration: none">&lt;</a></li>
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="pageNum">
							<li
								class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
								<a class="page-link" href="joinclub${pageMaker.makeQuery(pageNum) }"
								style="text-decoration: none">${pageNum } </a>
							</li>
						</c:forEach>
	
						<li class="page-item"><a class="page-link"
							href="joinclub
										<c:if test="${pageMaker.next }">
											${pageMaker.makeQuery(pageMaker.endPage+1) }
										</c:if>
										<c:if test="${!pageMaker.next }">
											${pageMaker.makeQuery(pageMaker.cri.page) }
										</c:if>
									"
							style="text-decoration: none">&gt;</a></li>
	
						<li class="page-item"><a class="page-link"
							href="joinclub${pageMaker.makeQuery(pageMaker.realEndPage) }"
							style="text-decoration: none"> &gt;&gt; </a></li>
					</ul>
				</div>
			</div> --%>

		</div>

		<br> <br> <br>

		<script>
				//팝업창들 뛰우기
	//새로운 윈도우 창을 오픈할 경우 사용되는 함수(arg : 주소, 창타이틀, 넓이, 길이)
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		
		var win = window.open(UrlStr , WinTitle, "scrollbars=yes, width="+ WinWidth
				+", height="+ WinHeight+ ", top="+wintop + ", left="+winleft +", resizable=no, status=yes");
		
		win.focus();
		//대문자를 쓴 이유 확인
		//내가 만든 펑션 제공되는 펑션 = 대문자로 구분
	}
	
	
		
</script>
	<%-- 상세보기 와 회원보기 스크립트 추가 --%>
	<script>
		
	</script>

		<script>

<%-- 추천, 비추천하는 에이젝스 , upndown은 up,down 둘중 하나의 스트링값이 들어가면된다, club_no는 클럽 넘버가 들어가야함--%> 
	function club_upndown(upndown,club_no) {
		var text ="추천";
		
		if(upndown == "down")
			text = "비추천";
		
		if(confirm(text + "을 하시겠습니까?")){
			
			$.ajax({
				
				contentType:"application/JSON",
				type: "POST",
				url: "<%=request.getContextPath()%>/"+upndown+"check?mem_id=${member.mem_id}&club_no="+club_no,
				cache: false,
				success: function(bool) {
					console.log(bool);
					
						if(bool == false)
							alert("당신은 이미 " + text + "을 하셨습니다.");
							
						else
							alert(text + "을 하셨습니다.");
						location.reload();
								
				}
			});
			
		}
			
	}
	
	

	$('#category').change(function() { 
		/* alert('sssssssssssssssssssssssssssssssssssssssssss'); */ 
		<%-- self.location="<%=request.getContextPath()%>/subcategory" --%>
		
	/* 	var go = ; */
		/* var gogo ={
				
		
		} */
		/* alert(go); */
		$.ajax({
			data:JSON.stringify({"cate_no":$(this).val()}),
			contentType:"application/JSON",
			type: "POST",
			url: "<%=request.getContextPath()%>/subcategory",
			cache: false,
			success: function(data) {
				console.log(data);
				$("#subCategory").html("");
				
				$("#subCategory").append("<option selected disabled >소분류</option>");
				for(var sub of data){
					console.log(sub.cate_sub_name);
					$("#subCategory").append("<option>"+sub.cate_sub_name+"</option>");
				}
			}
		});
	
	});

	</script>

		<script>
		/* $("#sidemenu").add("style='padding: 0px;'"); */
		
		function myPage(url) {
			self.location.href="<%=request.getContextPath()%>/mypage/"+url;
		}
		
		$('.subButton').click(function(){
		      $('.subButton').css("background","");
		      $(this).css("background","linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0) 55%,rgba(0,0,0,0) 61%,rgba(0,0,0,0.16) 100%)");
		   });
		
	</script>
</body>