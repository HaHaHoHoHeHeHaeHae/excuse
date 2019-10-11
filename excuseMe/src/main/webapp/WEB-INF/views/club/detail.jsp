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
<c:set var="reply" value="${dataMap.replyList }" />
<head>

<title>동호회 디테일</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">

<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">

<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<!-- daterange picker -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/adminLTE/plugins/daterangepicker/daterangepicker.css">

<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/adminLTE/plugins/summernote/summernote-bs4.css">

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		
	<script src="<%=request.getContextPath() %>/resources/adminLTE/plugins/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>


<!-- modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.2/handlebars.min.js"></script>

<script id="reply-list-template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate reply_regDate}}
    <a class="button special small" style="margin-top: -15px;" id="modifyReplyBtn"
       data-replyer={{mem_id}} data-toggle="modal" data-target="#modifyModal">수&nbsp;&nbsp;정</a>
     </span>
     <h3 class="timeline-header"><strong style="display:none;">{{reply_no}}</strong>{{mem_nick}}</h3>
    <div class="timeline-body">{{reply_content}} </div>
   </li>
{{/each}}   
</script>
<!-- Time Line -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/adminLTE/build/scss/_timeline.scss">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css" />
	


<style>
div.top {
	height: 100px;
}
</style>

</head>


<body>
	<div class="top"></div>
	
	<!-- main1 start -->	
	<div id="main1" class="wrapper" style="width: 800px; position: relative;">
		<div class="pic_demo_wqrp" style="position: absolute; width: 800px;; height: 300px; top: 0px;">
			<div class="pic_warp" style="width: 300px; height: 300px; float: left; position: absolute;">
				<div class="pic" style="width: 300px; height: 300px;">
					<img class="profile-user-img" 
						 id="thum" src="<%=request.getContextPath()%>/attach/img?attach_no=${club.attachThum_no}" 
						 alt="<%=request.getContextPath()%>/resources/img/logo.png"
						 style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 300px; height: 300px; padding: 2px;" />
				</div>
			</div>
			<div class="demo_wrap" style="width: 500px; height: 300px; float: left; position: absolute; left: 300px;">
				<div style="height: 300px;">
					<table class="alt" style="height: 300px; margin-bottom: 0px; margin: auto; text-align: center; font-size: 18px;">
						<tbody>
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
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="summernote" style="position: absolute; width: 800px; top: 300px;">
			<table class="alt" style="margin-bottom: 0px; margin: auto; text-align: center; font-size: 18px; height: 400px;">
				<tbody>
					<tr valign=middle>
						<td style="width: 156px;"><b>내용</b></td>
						<td>${club.club_content }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- main1 end -->

	<!-- main2 start -->
	<div id="main2" class="wrapper" style="width: 800px; position: absolute; top:800px;">
		<div class="attach" style="position: relative; width: 800px; margin-bottom:50px;">
			<table class="alt" style="margin-bottom: 0px; margin: auto; text-align: center; font-size: 18px;">
				<tbody>
					<tr>
						<td style="width: 156px;"><b>첨부파일</b></td>
						<td class="attach_wrap" style="width: 644px; margin-right: -50px;">
							<c:forEach var="attach" items="${attach }">
								<div class="col-md-4 col-md-12" style="cursor: pointer;"
									onclick="location.href='<%=request.getContextPath() %>/attach/get?attach_no=${attach.attach_no }';">
									<div class="img info-box uploadedlist">
										<span class="info-box-icon"> 
											<c:if test="${!empty ImgCheck.getImgCheck(attach.attach_type) }">
												<img src="<%=request.getContextPath() %>/attach/thum?attach_no=${attach.attach_no }" />
											</c:if> 
											<c:if test="${empty ImgCheck.getImgCheck(attach.attach_type) }">
												<img src="<%=request.getContextPath() %>/resources/img/icon/${FileFormat.generate(attach.attach_type)}.png" />
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
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="buttons" style="position: relative; width: 800px; text-align: center; margin-bottom:20px;">
			<a href="#" class="button special" id="wishBtn" onclick="onWish();">관심동호회등록</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="button" id="joinBtn" onclick="onJoin();">가입하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="button alt" id="closeBtn" onclick="onClose();">나가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>

		<div class="updown" style="position: relative; width: 800px; margin-bottom: 50px;">
			<ul class="list-group list-group-unbordered mb-3">
				<li class="list-group-item text-center" style="height: 60px; width: 198px; left: 35%; float: left;">
				<b id="btag"> 
					<a href="#" style="text-decoration:none;" onclick="club_upndown('up','${club.club_no}');"><i class="far fa-thumbs-up"></i>&nbsp;&nbsp;${club.upcnt }&nbsp;&nbsp;</a>
					 
					<a href="#" style="text-decoration:none;" onclick="club_upndown('down','${club.club_no}');"><i class="fas fa-thumbs-down"></i>&nbsp;&nbsp;${club.downcnt }</a>
				</b>
				</li>
			</ul>
		</div>

		<div class="reply" style="position: relative; width: 800px;">
			<!-- Reply 부분 -->
			<div class="card">
				<div class="card-header">
					<!-- 리플 작성하는 부분 -->
					<div class="box box-success">
						<!-- <div class="box-header">
						<h3 class="box-title">Add new Reply</h3>
					</div>-->
						<div class="box-body">
							<input class="form-control" type="hidden" id="newReplyWriter" readonly value="${loginUser.mem_id }" /> 
							<input class="form-control" type="text" placeholder="댓글을 입력하세요." id="newReplyText" />
						</div>
						<div class="box-footer" style="float: right;">
							<button type="button" class="button alt small" id="replyAddBtn">등&nbsp;&nbsp;록</button>
						</div>
					</div>
				</div>

				<div class="card-body">
					<!-- 리플라이 목록 -->
					<ul class="timeline color-palette-set">
						<li class="bg-green color-palette row" id="repliesDiv"><span
							class="col-sm-12">Replies List</span></li>
					</ul>
				</div>

				<div class="card-footer">
					<!-- 리플라이 페이지네이션 -->
					<div class="text-center">
						<ul id="pagination" class="pagination pagination-sm no-margin">

						</ul>
					</div>
				</div>
			</div>

		</div>

		<!-- Modal -->
		<div id="modifyModal" class="modal modal-default fade" role="dialog">
			<!-- modal-default 는 색상배합  -->
			<div class="modal-dialog">
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" style="display: none;"></h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" data-reply_no>
						<p>
							<input type="text" id="reply_content" class="form-control">
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
						<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
	function onWish(){}
	
	<%-- function onJoin(){
		alert('onJoin성공');
		self.location.href="<%=request.getContextPath() %>/club/joinToClub?mem_id=${member.mem_id}&club_no=${club.club_no}";
	} --%>
	
	
	function onClose(){
		window.close();
	}
	
	
	<%-- up&down --%>
	function club_upndown(upndown,club_no){
		$.ajax({
			contentType:"application/JSON",
			type:"POST",
			url:"<%=request.getContextPath()%>/"+upndown+"check?mem_id=${member.mem_id}&club_no="+club_no,
			cache:false,
			success:function(bool){
				if(upndown=="up"){
					if(bool==false)
						alert('이미 추천하신 동호회입니다.');
					else
						alert('추천되었습니다.')
				
				location.reload();
				}
				
				else if(upndown=="down"){
					if(bool==false)
						alert('이미 비추천하신 동호회입니다.');	
					else
						alert('비추천되었습니다.');
				location.reload();	
				}
			}
		});
	}
	
	
	
	
	<%--reply--%>
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var date = dateObj.getDate();
		return year+"/"+month+"/"+date;
	});
	
	var printData = function(replyArr, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$('.replyLi').remove();
		target.after(html);
	};
	
	var replyPage=1;
	
	function getPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			printData(data.replyList, $('#repliesDiv'), $('#reply-list-template'));
			printPaging(data.pageMaker, $('.pagination'));
		  });
		}
	
	getPage("<%=request.getContextPath() %>/replies/${club.club_no}/"+replyPage);
	
	var printPaging = function(pageMaker, target){ 
		var str = "";
		if(pageMaker.prev){
			str += "<li class='page-item'><a href='"+(pageMaker.startPage-1)+"'class='page-link'> << </a></li>";
		}
		
		for(var i = pageMaker.startPage, len=pageMaker.endPage; i<= len; i++){
			var strClass = pageMaker.cri.page == i?'active':'';
			str += "<li class='page-item'" + strClass + "><a class='page-link' href='" + i + "'>" + i + "</a></li>";
		}
		if(pageMaker.next){
	        str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	    }
		target.html(str);
	}
	
	$('.pagination').on('click','li a', function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("<%=request.getContextPath() %>/replies/${club.club_no}/"+replyPage);
	});
		
	
	$('#replyAddBtn').on('click',function(e){
		var mem_id = $('#newReplyWriter').val();
		var reply_content = $('#newReplyText').val();

		//alert("mem_id= " + mem_id + "\nreply_content= "+ reply_content);

		if(reply_content ==""){
			alert('댓글 내용은 필수입니다.');
			$('#newReplyText').focus().css("border-color","red").attr("placeholder","내용은 필수입니다.");
		return;
		}

		var data = {
			"club_no": "${club.club_no}",
			"mem_id": "${loginUser.mem_id}",
			"reply_content": reply_content
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/replies",
			type:"POST",
			data:JSON.stringify(data),
			contentType:"application/json",
			dataType:"text",
			success:function(data){
				if(data=="SUCCESS"){
					alert('댓글이 등록되었습니다.');
					getPage("<%=request.getContextPath() %>/replies/${club.club_no}/"+replyPage);
					$('#newReplyText').val("");
				}else{
					alert('댓글 등록이 취소되었습니다.');
				}
			},
			error:function(error){
				alert('서버 오류로 댓글 등록을 실패하였습니다.');
			}
		});
	});
	
	$('ul.timeline').on('click', '#modifyReplyBtn', function(event){
		var replyer = $(event.target).attr("data-replyer");
		if(replyer!="${loginUser.mem_id}"){
			alert("수정이 불가합니다.");
			$(this).attr("data-toggle","");
		}
	});
	
	$('.timeline').on('click','.replyLi', function(event){
		var reply = $(this);
		$('#reply_content').val(reply.find('.timeline-body').text());
		$('.modal-title').html(reply.attr('data-reply_no'));

	});

	
	$('#replyModBtn').on('click', function(event){
		var reply_no = $('.modal-title').html();
		var reply_content = $('#reply_content').val();
		
		var sendData = {
				reply_no:reply_no,
				reply_content:reply_content
		}
		
		console.log(reply_no);
		console.log(reply_content);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/replies/"+reply_no,
			type:"put",
			data:JSON.stringify(sendData),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			success:function(result){
				if(result=="SUCCESS"){
					alert("수정되었습니다.");
					getPage("<%=request.getContextPath()%>/replies/${club.club_no}/"+replyPage);
				}
			},
			error:function(error){
				alert("댓글 수정에 실패했습니다.");
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		});
 	});
	
	$('#replyDelBtn').on('click', function(event){
		var reply_no = $('.modal-title').html();
		//alert(reply_no);
		
		var sendData={
				reply_no:reply_no
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/replies/"+reply_no,
			type:"delete",
			data:JSON.stringify(sendData),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"DELETE"
			},
			success:function(result){
				if(result=="SUCCESS"){
					alert("삭제되었습니다.");
					getPage("<%=request.getContextPath()%>/replies/${club.club_no}/"+replyPage);
				}
			},
			error:function(error){
				alert('삭제 실패했습니다.');
				
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		});
	});
 		
	</script>


	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>

	
	

	<!-- templated Scripts -->
	<!-- <script src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.min.js"></script> -->
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>

</body>
