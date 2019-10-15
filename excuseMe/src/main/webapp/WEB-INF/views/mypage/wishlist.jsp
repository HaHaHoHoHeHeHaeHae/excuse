<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="wishList" value="${dataMap.wishList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 관심 동호회</title>


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

<body class="subpage">

	<%-- <div id="subm">

		<br> <br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myjoinlist" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입한
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myclub" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생성한
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/wishlist" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myreply" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가
			쓴 댓글</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myinfo" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>


	</div> --%>
	<div id="sidebar"
		style="margin-top: 120px; margin-left: 120px; float: left; z-index: 100; position: relative; background: #25a1c3; width: 250px; height: 1000px; text-align: center; display: inline-block; vertical-align: middle; height: 100%; left: -3px;">

		<div style="height: 50px; background: #306170;">
			<p
				style="padding-top: 6px; font-size: 1.3em; color: white; font-weight: bold;">마이
				페이지</p>
		</div>
		<div class="subButton" onclick="myPage('myjoinlist');"
			style="cursor: pointer; height: 50px; margin-top: 20px; width: 230px; margin-left: 10px; border-bottom: 1px solid #cce3de;">
			<p
				style="padding-top: 10px; color: white; font-size: 1.1em; text-align: left; padding-left: 20px;">가입한
				동호회</p>
		</div>
		<div class="subButton" onclick="myPage('myclub');"
			style="cursor: pointer; height: 50px; margin-top: 20px; width: 230px; margin-left: 10px; border-bottom: 1px solid #cce3de;">
			<p
				style="padding-top: 10px; color: white; font-size: 1.1em; text-align: left; padding-left: 20px;">생성한
				동호회</p>
		</div>
		<div class="subButton" onclick="myPage('wishlist');"
			style="cursor: pointer; height: 50px; margin-top: 20px; width: 230px; margin-left: 10px; border-bottom: 1px solid #cce3de;">
			<p
				style="padding-top: 10px; color: white; font-size: 1.1em; text-align: left; padding-left: 20px;">관심
				동호회</p>
		</div>
		<div class="subButton" onclick="myPage('myreply');"
			style="cursor: pointer; height: 50px; margin-top: 20px; width: 230px; margin-left: 10px; border-bottom: 1px solid #cce3de;">
			<p
				style="padding-top: 10px; color: white; font-size: 1.1em; text-align: left; padding-left: 20px;">내가
				쓴 댓글</p>
		</div>
		<div class="subButton" onclick="myPage('myinfo');"
			style="cursor: pointer; height: 50px; margin-top: 20px; width: 230px; margin-left: 10px; border-bottom: 1px solid #cce3de;">
			<p
				style="padding-top: 10px; color: white; font-size: 1.1em; text-align: left; padding-left: 20px;">개인정보수정</p>
		</div>

	</div>
	<div id="all_div">
		<div id="section_div"
			style="postion: relative; left: 5px; top: 18px; width: 1570px;">
			<!-- Main -->
			<section id="main" class="wrapper"> <!-- Menu --> <!-- Elements -->
			<div class="row">
				<h2 id="elements">마이페이지 - 관심 동호회</h2>
				<!-- <div class="nav nav-pills ml-auto p-2">
							<span class="button small" onclick="#">글 쓰기</span>
						</div> -->
			</div>
			<div class="row 200%">
				<div class="12u">
					<!-- Table -->
					<c:if test="${empty wishList }">
						<b><strong style="position: relative; left: 45px;">관심
								동호회가 없어요.</strong></b>
						<div style="postion: relative; height: 400px;"></div>
					</c:if>


					<c:if test="${!empty wishList }">
						<c:forEach var="club" items="${wishList }">
							<div class="clublist_body"
								style="width: 20%; float: left; border: 1px dashed #bcbcbc; margin-left: 3px; margin-right: 3px; width: 219px;">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" style="width: 100px; height: 100px;"
											<c:if test="${club.attachThum_no > 0}">
												src="<%=request.getContextPath()%>/attach/img?attach_no=${club.attachThum_no}"
											</c:if>
											<c:if test="${club.attachThum_no <= 0}">
												src="<%=request.getContextPath()%>/resources/img/logo.png"
											</c:if>>
									</div>
									<h3 class="profile-username text-center"
										style="height: 31px; width: 190px; overflow: hidden; text-overflow: ellipsis;">${club.club_name }</h3>

									<ul class="list-group list-group-unbordered mb-3">

										<li class="list-group-item text-center"
											style="height: 40px; width: 198px; left: -10px;"><b
											id="btag"> <i class="fas fa-user-alt"></i>&nbsp;&nbsp;${club.joincnt }
												&nbsp;&nbsp; <i class="far fa-thumbs-up"></i>&nbsp;&nbsp;${club.upcnt }
												&nbsp;&nbsp; <i class="fas fa-thumbs-down"></i>&nbsp;&nbsp;${club.downcnt }
										</b></li>

									</ul>
									<ul class="actions vertical small" style="text-align: center;">
										<li>
											<div class="btn_g" style="position: relative;">
												<div class="btn-group"
													style="position: absolute; left: -18px; top: -10px;">
													<a href="#" class="button small"
														style="color: white; width: 108px; height: 35px; position: relative;"
														onclick="OpenWindow('<%=request.getContextPath()%>/club/detail?club_no=${club.club_no }','','825','650')">
														<p
															style="position: relative; left: -12px; font-size: 15px;">상세보기</p>

													</a> &nbsp; <a href="#" class="button special small"
														style="color: white; width: 102px; height: 35px; position: relative;"><p
															style="position: relative; left: -7px; font-size: 15px;"
															onclick="wishclub('remove','${club.club_no}');">삭&nbsp;&nbsp;&nbsp;제</p></a>
												</div>
											</div>
										</li>

									</ul>
								</div>
							</div>
						</c:forEach>
					</c:if>
			</section>

			<!-- pagination Start-->
			<c:if test="${!empty wishList }">
				<div class="card-body">
					<div class="pagination justify-content-center m-0">
						<ul class="pagination ">
							<li class="page-item"><a class="page-link"
								href="wishlist${pageMaker.makeQuery(1)}"
								style="text-decoration: none">&lt;&lt;</a>
							<li class="page-item"><a class="page-link"
								href="wishlist<c:if test="true">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
								style="text-decoration: none">&lt;</a></li>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">
								<li
									class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
									<a class="page-link"
									href="wishlist${pageMaker.makeQuery(pageNum) }"
									style="text-decoration: none">${pageNum } </a>
								</li>
							</c:forEach>

							<li class="page-item"><a class="page-link"
								href="wishlist
								<c:if test="${pageMaker.next }">${pageMaker.makeQuery(pageMaker.endPage) }</c:if>
								<c:if test="${!pageMaker.next }">${pageMaker.makeQuery(pageMaker.cri.page) }</c:if>"
								style="text-decoration: none">&gt;</a></li>

							<li class="page-item"><a class="page-link"
								href="wishlist${pageMaker.makeQuery(pageMaker.realEndPage) }"
								style="text-decoration: none"> &gt;&gt; </a></li>
						</ul>
					</div>
				</div>
			</c:if>
		</div>

		<br> <br> <br>



		

		<script>
	
		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
			winleft = (screen.width - WinWidth) /2;
			wintop = (screen.height - WinHeight) /2;
			var win = window.open(UrlStr, WinTitle, "scrollbars=no, width="+WinWidth+",height="+WinHeight+",top="+wintop+",left="+winleft+", resizable=no, status=yes");
			win.focus();
		}
	
		function wishclub(wishnremove,club_no) {
		<%-- wishnremove 에는 club 과 remove 가  스트링으로 들어야한다.--%>
			var text = " 추가";
			
			if(wishnremove == "remove")
				text = "서 삭제";
			
			if(confirm("정말로 관심동호회에" + text + "하시겠습니까?")){
				
				$.ajax({
					contentType:"application/JSON",
					type: "POST",
					url: "<%=request.getContextPath()%>/wish"
								+ wishnremove
								+ "?mem_id=${loginUser.mem_id}&club_no="
								+ club_no,
						cache : false,
						success : function(bool) {
							console.log(bool);

							if (bool == false)
								alert("이미 관심동호회에" + text + "되어있습니다.");
							else
								alert("관심동호회에" + text + "되었습니다.");
							location.reload();
						}
					});
				}

			}

		function myPage(url) {
			self.location.href="<%=request.getContextPath()%>/mypage/"+ url;
			}

			$('.subButton')
					.click(
							function() {
								$('.subButton').css("background", "");
								$(this)
										.css(
												"background",
												"linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0) 55%,rgba(0,0,0,0) 61%,rgba(0,0,0,0.16) 100%)");
							});
		</script>
</body>