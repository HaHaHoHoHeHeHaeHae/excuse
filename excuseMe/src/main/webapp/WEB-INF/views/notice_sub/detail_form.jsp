
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
<script
	src="<%=request.getContextPath()%>/resources/adminLTE/plugins/summernote/summernote-bs4.min.js"></script>
<!-- Time Line -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/build/scss/_timeline.scss">

</head>
<body>


	<!-- Main -->
	
	<div class="inner" style="width:98%;">


		<!-- Elements -->
		<div class="row" style="border-bottom:1px solid gray">
			<h2 style="margin-left:40px; margin-bottom:20px; font-weight:900; color:#4f9cc2;">공지사항</h2>
		</div>
		
		<input type="hidden" id="not_startDate" name="not_startDate" value="" />
		<input type="hidden" id="not_endDate" name="not_endDate" value="" />
		<div class="row" style="margin-top:20px; margin-left:30px;">
			<div >
				<h5 style="font-weight:bold;margin-top:5px;color:#768d99;">제&nbsp&nbsp&nbsp&nbsp&nbsp목</h5>
			</div>
			<div>
				<h5 style="margin-top:5px;margin-left:40px;">${notice.not_title }</h5>
			</div>
		</div>
		<div class="row" style="margin-top:10px; margin-left:30px;">
			<div>
				<h5 style="font-weight:bold;margin-top:5px;color:#768d99;">등록일</h5>
			</div>
			<div>
				<h5 style="margin-top:5px;margin-left:40px;"><fmt:formatDate value="${notice.not_regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></h5>
			</div>
		</div>
		<div  style="margin-left: 50px;margin-right:20px;min-height:300px; background:#f0f5f7;">
			<div style="margin-top:40px;word-wrap:break-word; padding:10px;">
					${notice.not_content}
			</div>

		</div>
		<div>
			<div class="row uniform" style="margin-top:10px; margin-left:30px;">
				<h5 style="font-weight:bold;margin-top:5px;color:#768d99;">첨부파일</h5>
				
			</div>
			<div class="box-footer fileInput">
					<div class="attached row">	
					
						<c:forEach items="${notice.attachList}" var="attach">
							<div class="col-sm-4 attached-inputRow" attach-name="${attach.attach_name }" attach-no="${attach.attach_no }" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/attach/get?attach_no=${attach.attach_no}';">

								<div class="info-box uploadedList">
									
									<span class="info-box-icon">
													<img src="<%=request.getContextPath() %>/resources/img/icon/hwp.png" />
									</span>	
									<div class="info-box-content">
										<span class="info-box-text"> 
											${attach.attach_regDate }
										</span>
										<span class="info-box-number text-overflow">
											${attach.attach_name } 
										</span>
									</div>

								</div>
							</div>
						</c:forEach>
					</div>
					<br />
				</div>
		</div>
		
		<div class="text-center" style="margin-left:420px;">
			<div class="row">
				<c:if test="${loginUser.mem_nick eq 'admin'}">
				<div >
					<button type="button" class="btn btn-block btn-info" onclick="window.parent.location.href='<%=request.getContextPath()%>/notice/modify?not_no=${notice.not_no }'" style="width:100px;">수&nbsp&nbsp정</button>
				</div>
				</c:if>
				<div style="margin-left:20px;">
					<button type="button" class="btn btn-block btn-outline-info" style="width:100px;"onclick="window.parent.location.href='<%=request.getContextPath()%>/notice/list?page=${page }'">뒤로가기</button>
				</div>
			</div>
			
		</div>
		
	</div>




		<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>

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
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script>
		$(function() {
			//Date range picker
			$('#startEndDate').daterangepicker({
				opens : 'left',
				changeMonth : true,
				changeYear : true,
				startDate : moment(),
				endDate : moment().add(30, 'days'),
				locale : {
					format : 'YYYY/MM/DD'
				}

			});

			$('#not_startDate').on("change",setReservationTime);
			setReservationTime();

		});
		$('#addFileBtn').on('click',function(event){
			//alert("add File btn click");
		  
			if($('input[name="uploadFile"]').length >=5){
				alert("파일추가는 5개까지만 가능합니다.");
				return;
			}
			
			var input=$('<input>').attr({"type":"file",
										"name":"uploadFile",
										}).css("display","inline");
			
			var div=$('<div>').addClass("inputRow");
			    div.append(input).append("<button style='border:0;outline:0;width:40px;' class='badge bg-red' type='button'>X</button>");
			    
			    div.appendTo('.fileInput');
		});


		$('div.fileInput').on('click','div.inputRow > button', function(event){
			//alert("X btn click;");
			$(this).parent('div.inputRow').remove();
			
		});

		$('.fileInput').on('change','input[type="file"]',function(event){
			if(this.files[0].size>1024*1024*40){
				alert("파일 용량이 40MB를 초과하였습니다.");
				this.value="";
				$(this).focus();
				return false;
			}
		});
		
		
	
	
	function insertNotice(){
		var id = "admin@naver.com";
		var startDate = not_startDate.value;
		var endDate = not_endDate.value;
		var title = not_title.value;
		var content=not_content.value;
		console.log(id+startDate+endDate+title+content);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/regist",
			type:"POST",
			data:{
				mem_id : id,
				not_startDate2 : startDate,
				not_endDate2 : endDate,
				not_title : title,
				not_content : content
			},
			success:function(){
				alert("글이 등록되었습니다.");
				
			},
			error:function(){
				alert("서버 오류입니다.");
			}
			
		});
	}
	
		var setReservationTime = function () {
			//alert($(this).val()); 

			var date2 = startEndDate.value;
			console.log(date2);
			var date = date2.split('-');
			console.log(date);
			$("#not_startDate").val(
					date[0].replace(/\//gi, "-").trim());
			$("#not_endDate").val(date[1].replace(/\//gi, "-").trim());
		}
	</script>
	
  
</body>
</html>