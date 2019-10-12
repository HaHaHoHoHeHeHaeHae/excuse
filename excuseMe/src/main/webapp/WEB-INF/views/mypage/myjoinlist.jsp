<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="myjoinList" value="${dataMap.myjoinList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 가입한 동호회</title>

<%-- <c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>
<%-- <c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/font-awesome.min.css">

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

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

	<div id="subm">

		<br>
		<br>
		<br> <a href="<%=request.getContextPath()%>/mypage/myjoinlist"
			class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입한
			동호회</a><br>
		<br> <a href="<%=request.getContextPath()%>/mypage/myclub"
			class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생성한
			동호회</a><br>
		<br> <a href="<%=request.getContextPath()%>/mypage/wishlist"
			class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심
			동호회</a><br>
		<br> <a href="<%=request.getContextPath()%>/mypage/" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가
			쓴 댓글</a><br>
		<br> <a href="<%=request.getContextPath()%>/mypage/myinfo"
			class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>


	</div>
	<div id="all_div">


		<div id="section_div">
			<!-- Main -->
			<section id="main" class="wrapper"> <!-- Menu --> <!-- Elements -->
			<div class="row">
				<h2 id="elements">마이페이지 - 가입한 동호회</h2>
				<!-- <div class="nav nav-pills ml-auto p-2">
							<span class="button small" onclick="#">글 쓰기</span>
						</div> -->
			</div>
			<div class="row 200%">
				<div class="12u">
					<!-- Table -->
					<c:if test="${empty myjoinList }">
						<b><strong>가입한 동호회가 없어요. </strong></b>
					</c:if>


					<c:if test="${!empty myjoinList }">
						<c:forEach var="club" items="${myjoinList }">
							<div class="clublist_body"
								style="width: 33%; float: left; border: 1px dashed #bcbcbc; margin-left: 3px; margin-right: 3px; width: 219px;">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle"
											src="<%=request.getContextPath()%>/resources/img/logo.png"
											alt="User profile picture">
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
														style="color: white; width: 108px; height: 35px; position: relative;"><p
															style="position: relative; left: -12px; font-size: 15px;" onclick="OpenWindow('<%=request.getContextPath()%>/club/detail?club_no=${club.club_no }','','800','650');">상세보기</p></a>
													&nbsp; <a href="#" class="button special small"
														style="color: white; width: 102px; height: 35px; position: relative;"><p
															style="position: relative; left: -7px; font-size: 15px;" onclick="joinclub('exit','${club.club_no}');">탈&nbsp;&nbsp;&nbsp;퇴</p></a>
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
			<div class="card-body">
				<div class="pagination justify-content-center m-0">
					<ul class="pagination ">
						<li class="page-item"><a class="page-link"
							href="myjoinlist${pageMaker.makeQuery(1)}"
							style="text-decoration: none">&lt;&lt;</a>
						<li class="page-item"><a class="page-link"
							href="myjoinlist<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
							style="text-decoration: none">&lt;</a></li>
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="pageNum">
							<li
								class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
								<a class="page-link"
								href="myjoinlist${pageMaker.makeQuery(pageNum) }"
								style="text-decoration: none">${pageNum } </a>
							</li>
						</c:forEach>

						<li class="page-item"><a class="page-link"
							href="myjoinlist
										<c:if test="${pageMaker.next }">
											${pageMaker.makeQuery(pageMaker.endPage+1) }
										</c:if>
										<c:if test="${!pageMaker.next }">
											${pageMaker.makeQuery(pageMaker.cri.page) }
										</c:if>
									"
							style="text-decoration: none">&gt;</a></li>

						<li class="page-item"><a class="page-link"
							href="myjoinlist${pageMaker.makeQuery(pageMaker.realEndPage) }"
							style="text-decoration: none"> &gt;&gt; </a></li>
					</ul>
				</div>
			</div>

		</div>
</div>
		<br> <br> <br>


		<script>
		
			function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
				winleft = (screen.width - WinWidth) /2;
				wintop = (screen.height - WinHeight) /2;
				var win = window.open(UrlStr, WinTitle, "scrollbars=no, width="+WinWidth+",height="+WinHeight+",top="+wintop+",left="+winleft+", resizable=no, status=yes");
				win.focus();
			}
		
			function joinclub(joinnexit,club_no) {
				<%-- joinnexit는 스트링으로 join 과 exit을 받아와야한다. --%>
				
				var text = "가입을";
				
				if(joinnexit == "exit")
					text = "탈퇴를";
				
				if(confirm("정말로 " + text + " 하시겠습니까?")){
					
					$.ajax({
						contentType:"application/JSON",
						type: "POST",
						url: "<%=request.getContextPath()%>/" + joinnexit + "club?mem_id=${loginUser.mem_id}&club_no="+club_no,
						cache: false,
						success: function(bool) {
							console.log(bool);
							if(bool == false)
								alert("당신은 이미 " + text + " 하셨습니다.");
							else
								alert(text + " 하셨습니다.");
							location.reload();
						}
					});
					
				}
				
			}
		</script>



		<!-- jQuery -->
		<script
			src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script
			src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
		<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
		<script>
			/* $("#sidemenu").add("style='padding: 0px;'"); */
		</script>
</body>