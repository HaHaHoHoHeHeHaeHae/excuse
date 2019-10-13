
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<div class="inner" style="width: 98%;">


		<!-- Elements -->
		<div class="row" style="border-bottom: 1px solid gray">
			<h2
				style="margin-left: 40px; margin-bottom: 20px; font-weight: 900; color: #4f9cc2;">공지사항
				수정</h2>
		</div>
		<form id="modify_form" name="modify_form"
			enctype="multipart/form-data" role="form">
		<input type="hidden" id="not_no" name="not_no"
			value="${notice.not_no }"> <input type="hidden"
			id="not_startDate" name="not_startDate"
			value="<fmt:formatDate value="${notice.not_startDate}" pattern="yyyy-MM-dd" />" />
		<input type="hidden" id="not_endDate" name="not_endDate"
			value="<fmt:formatDate value="${notice.not_endDate}" pattern="yyyy-MM-dd" />" />
		<div class="row" style="margin-top: 20px; margin-left: 30px;">
			<div>
				<h5 style="font-weight: bold; margin-top: 5px; color: #768d99;">제&nbsp&nbsp&nbsp&nbsp&nbsp목</h5>
			</div>
			<div>
				<input type="text" class="form-control" id="not_title"
					name="not_title" style="margin-left: 50px; width: 600px;" maxlength="80"
					value="${notice.not_title }">
			</div>
		</div>
		<div class="row" style="margin-top: 10px; margin-left: 30px;">
			<div>
				<h5 style="font-weight: bold; margin-top: 5px; color: #768d99;">게시일</h5>
			</div>
			<div>
				<input type="text" id="startEndDate" name="startEndDate"
					class="form-control" style="margin-left: 50px; width: 300px;">
			</div>
		</div>
		<div style="margin-top: 20px;">
			<textarea class="summernote" id="not_content" name="not_content">${notice.not_content }</textarea>

		</div>
		<div class="col-xs-12 text-right">
      <span id="maxContentPost"></span>
    </div>
		
			<div>
				<div class="row uniform"
					style="margin-top: 10px; margin-left: 30px;">
					<h5 style="font-weight: bold; margin-top: 5px; color: #768d99;">첨부파일</h5>
					<button type="button" id="addFileBtn"
						class="btn btn-block btn-default btn-sm"
						style="margin-left: 25px; width: 50px; padding-top: 5px;">추가</button>
				</div>
				<div class="box-footer fileInput">
					<div class="attached row">	
					
						<c:forEach items="${notice.attachList}" var="attach">
							<div class="col-sm-4 attached-inputRow" attach-name="${attach.attach_name }" attach-no="${attach.attach_no }" style="cursor: pointer;" >
								<button type="button" style="border: 0; outline: 0;"
									class="badge bg-red float-right" id="">X</button>
								<div class="info-box uploadedList" onclick="location.href='<%=request.getContextPath()%>/attach/get?attach_no=${attach.attach_no}'">
									<span class="info-box-icon">
											<img src="<%=request.getContextPath() %>/attach/thum?attach_no=${attach.attach_no }" />
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
		</form>
		<div class="text-center" style="margin-left: 420px;">
			<div class="row">
				<div>
					<button type="button" class="btn btn-block btn-info"
						onclick="modifyNotice()" style="width: 100px;">수정하기</button>
				</div>
				<div style="margin-left: 20px;">
					<button type="button" class="btn btn-block btn-outline-info"
						style="width: 100px;"
						onclick="window.parent.location.href='<%=request.getContextPath()%>/notice/list'">뒤로가기</button>
				</div>
			</div>

		</div>

	</div>




	<script>
		$(function() {
			var startDate2 = not_startDate.value;
			var endDate2 = not_endDate.value;
			//Date range picker
			$('#startEndDate').daterangepicker({
				opens : 'left',
				changeMonth : true,
				changeYear : true,
				startDate : startDate2,
				endDate : endDate2,
				locale : {
					format : 'YYYY/MM/DD'
				}

			});

			$('#startEndDate').on("change",setReservationTime);
			setReservationTime();

		});
		
	
	function modifyNotice(){
		var form = document.modify_form;
		
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				return false;
			}
		}
		
		var form2 =$("#modify_form[name='deleteFile']").val();
		var no = not_no.value;
		var id = "admin@naver.com";
		var startDate = not_startDate.value;
		var endDate = not_endDate.value;
		var title = not_title.value;
		var content=not_content.value;

		
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/modify",
			type:"POST",
			data:{
				not_no : no,
				mem_id : id,
				not_startDate2 : startDate,
				not_endDate2 : endDate,
				not_title : title,
				not_content : content
			},
			success:function(no){
				onSubmit(document.modify_form,'modifyAttach','post',no);
				
				alert("글이 수정되었습니다.");
				
				window.parent.location.href="<%=request.getContextPath()%>/notice/list";
			},
			error:function(){
				alert("서버 오류입니다.");
			}
			
		});
	}
	$('#addFileBtn').on('click',function(event){
		//alert("add File btn click");
	  
		var attachedFile=$('div.attached-inputRow').length;
		var inputFile=$('input[name="uploadFile"]').length;
		var attachCount = attachedFile+inputFile;
		
		if(attachCount >= 5){
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
	
	$("input").on('keyup',function(e){
		if($(this).val()!=""){
			$(this).removeClass("is-invalid");
		}
	});
	
	$('.attached button').on('click',function(event){
		event.stopPropagation();
		
		var parent = $(this).parent('div.attached-inputRow');
		alert(parent.attr("attach-name")+"파일을 삭제합니다.");
		
		var attach_no = parent.attr("attach-no");
		
		var input = $('<input>').attr({"type":"hidden",
									 "name":"deleteFile",
									 "value":attach_no
									 });
		
		$('form[role="form"]').prepend(input);
		
		parent.remove();
	});
	
	</script>
<%@include file="/WEB-INF/views/notice_sub/notice_form_js.jsp" %>
</body>
</html>