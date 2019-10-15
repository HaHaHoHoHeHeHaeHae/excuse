<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.blood.coding.controller.common.ImgCheck"%>
<%@ page import="com.blood.coding.controller.common.FileFormat"%>


<c:set var="club" value="${dataMap.club }" />
<c:set var="mem_nick" value="${dataMap.memberNick }" />
<c:set var="member" value="${dataMap.member }" />
<%--<c:set var="ReplyMember" value="${dataMap.ReplyMember }" />--%>
<c:set var="attach" value="${dataMap.attachList }" />
<head>

<title>동호회 상세보기</title>

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

<!-- Bootstrap 4 -->
<script
	src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>


<!-- modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.2/handlebars.min.js"></script>

<script id="reply-list-template" type="text/x-handlebars-template">

</script>
<!-- Time Line -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/build/scss/_timeline.scss">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css" />

</head>


<body>
	<div id="main_wrap" style="position: absolute; width: 800px;">
		<!-- thumnail & demonstration -->
		<div id="main1" style="position: absolute; width: 800px; height: 300px;">
			<div class="pic_demo_wqrp" style="position: relative; width: 800px;; height: 300px;">
				<div class="pic_warp"
					style="position: absolute; width: 300px; height: 300px; float: left;">
					<div class="pic" style="width: 300px; height: 300px;">
						<img class="profile-user-img" id="thum" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 300px; height: 300px; padding: 2px;"
						<c:if test="${club.attachThum_no > 0}">
                        src="<%=request.getContextPath()%>/attach/img?attach_no=${club.attachThum_no}"
                     </c:if>
                     <c:if test="${club.attachThum_no <= 0}">
                        src="<%=request.getContextPath()%>/resources/img/logo.png"
                     </c:if>  />
					</div>
				</div>
				<div class="demo_wrap"
					style="position: absolute; width: 500px; height: 300px; float: left;  left: 300px;">
					<div style="height: 300px;">
						<table class="alt"
							style="height: 300px; margin-bottom: 0px; margin: auto; text-align: center; font-size: 18px;">
							<tbody>
								<tr id="clubno">
									<td><b>NO</b></td>
									<td>${club.club_no }</td>
								</tr>
								<tr>
									<td><b>동호회명</b></td>
									<td>${club.club_name }</td>
								</tr>
								<tr>
									<td><b>지역</b></td>
									<td>${club.club_local }</td>
								</tr>
								<tr>
									<td><b>카테고리</b></td>
									<td>${club.cate_name }</td>

								</tr>
								<tr>
									<td><b>대표자명</b></td>
									<td>${mem_nick }</td>
								</tr>
								<tr id="clubstatus">
							<td><b>상태</b></td>
							
							<td><c:if test= "${club.club_status==1 }" >운영중</c:if>
									<c:if test= "${club.club_status==2 }" >운영중지</c:if></td>
						</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="main2" class="wrapper"
			style=" position: absolute; width: 800px; top:300px;">
			<!-- summer note -->
			<div class="summernote" style="position: relative; width: 800px;">
				<table class="alt"
					style="margin-bottom: 0px; margin: auto; text-align: center; font-size: 18px;">
					<tbody>
						<tr valign=middle>
							<td style="width: 156px;"><b>내용</b></td>
							<td>${club.club_content }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- attach -->
			<div class="attach"
				style="position: relative; width: 800px; margin-bottom: 50px;">
				<table class="alt"
					style="margin-bottom: 0px; margin: auto; text-align: center; font-size: 18px;">
					<tbody>
						<tr>
							<td style="width: 156px;"><b>첨부파일</b></td>
							<td class="attach_wrap"
								style="width: 644px; margin-right: -50px;"><c:forEach
									var="attach" items="${attach }">
									<div class="col-md-4 col-md-12" style="cursor: pointer;"
										onclick="location.href='<%=request.getContextPath() %>/attach/get?attach_no=${attach.attach_no }';">
										<div class="img info-box uploadedlist">
											<span class="info-box-icon"> <c:if
													test="${!empty ImgCheck.getImgCheck(attach.attach_type) }">
													<img
														src="<%=request.getContextPath() %>/attach/thum?attach_no=${attach.attach_no }" />
												</c:if> <c:if
													test="${empty ImgCheck.getImgCheck(attach.attach_type) }">
													<img
														src="<%=request.getContextPath() %>/resources/img/icon/${FileFormat.generate(attach.attach_type)}.png" />
												</c:if>
											</span>
											<div class="text info-box-content">
												<span class="subtext1 info-box-text"><fmt:formatDate
														value="${attach.attach_regDate }" pattern="yyyy-MM-dd" /></span>
												<span class="subtext2 info-box-number text-overflow"
													style="width: 460px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${attach.attach_name }</span>
											</div>
										</div>
									</div>
								</c:forEach></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- updown -->
			<div class="updown" style="position: relative; width: 800px; margin-bottom: 50px;">
				<ul class="list-group list-group-unbordered mb-3">
					<li class="list-group-item text-center"
						style="height: 60px; width: 198px; left: 35%; float: left;"><b
						id="btag"> <a href="#" style="text-decoration: none;"
							onclick="club_upndown('up','${club.club_no}');"><i
								class="far fa-thumbs-up"></i>&nbsp;&nbsp;${club.upcnt }&nbsp;&nbsp;</a>

							<a href="#" style="text-decoration: none;"
							onclick="club_upndown('down','${club.club_no}');"><i
								class="fas fa-thumbs-down"></i>&nbsp;&nbsp;${club.downcnt }</a>
					</b></li>
				</ul>
			</div>
			<div class="buttons"
		style="position: relative;  width: 800px; text-align: center;">
		 <button type="button" class="button special small" id="statusBtn" onclick="Status();">
					    <c:if test= "${club.club_status==1 }" >운영중지</c:if>
						<c:if test= "${club.club_status==2 }" >운영중지 해제</c:if></button>
						&nbsp; &nbsp; &nbsp;
						<button type="button" class="button special small" id="closeBtn" onclick="CloseWindow();">닫기</button>
	</div>
			
		</div>
	</div>


	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"
		defer></script>

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
	<%--<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />--%>

	<!-- templated Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
<script>
function Status(){
 	var id= $("#clubno").children().eq(1).text();
 	var status= $("#clubstatus").children().eq(1).text();
	//alert(id);
	//alert(status);
	
	if(status=='운영중'){
		$.ajax({
			url:"<%=request.getContextPath() %>/manage/club/stopstatus",
			type:"POST",
			data:{club_no:id},
			
			success:function(result){
				if(result=="SUCCESS"){
					alert("운영중지 되었습니다.");
					location.reload();
				}else{
					alert("1234");
				}
			},
			error:function(){
				alert('실패했습니다.');
			},
			
		}); 
	}else{
		$.ajax({
			url:"<%=request.getContextPath() %>/manage/club/status",
			type:"POST",
			data:{club_no:id},
			
			success:function(result){
				if(result=="SUCCESS"){
					alert("동호회가 활성화 되었습니다.");
					location.reload();
				}else{
					alert("1234");
				}
			},
			error:function(){
				alert('실패했습니다.');
			},
			
		}); 
		
		
	}
}
function CloseWindow(){
	window.close();

}
</script>


</body>

