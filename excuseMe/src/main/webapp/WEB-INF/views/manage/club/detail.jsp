
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="club" value="${dataMap.club }" />
<c:set var="member" value="${dataMap.member }" />



<head>
<meta charset="utf-8">
<title>동호회 목록</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
 <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/font-awesome.min.css"> 
	
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">


	
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">
 <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
.col-sm-3 control-label{
	margin-top:10px;
}
</style>
<body class="subpage">

		<div class="col-md-12">
				<div class="card">
				<div class="text-center">
					<div class="card-header" style="background:#CAEAF7;">
						<h3>동호회 정보</h3>
					</div><!--end card-header  --> 
					<div style="margin-left:200px;">
					<div class="card-body">
						<form role="form" method="post" action="detail" name="detailForm">
							<div class="form-group row" >
							    <label class="col-sm-3 control-label" style="margin-top:15px;">동호회 번호</label> 
							    <input class="col-sm-4 form-control" type="text" id="club_no" 
							    readonly name="club_no" value="${club.club_no }">
							</div>
							<div class="form-group row" >
							    <label class="col-sm-3 control-label" style="margin-top:15px;">동호회 이름</label> 
							    <input class="col-sm-4 form-control" type="text" id="club_name" 
							    readonly name="club_name" value="${club.club_name }">
							</div>
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label"style="margin-top:15px;">대표자 닉네임</label> 
							    <input class="col-sm-4 form-control" type="text" id="mem_nick" 
							    readonly name="mem_id" value="${member.mem_nick }">
							</div>
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">지역</label> 
							    <input class="col-sm-4 form-control" type="text" id="club_local" 
							    readonly name="id" value="${club.club_local }">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">카테고리</label> 
							    <input class="col-sm-4 form-control" type="text" id="cate_name" 
							    readonly name="id" value="${club.cate_name }">
							</div>	
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">상세설명</label> 
							    <input  type="text" id="club_content" 
							    readonly name="id" value="${club.club_content }">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							
							    <label class="col-sm-3 control-label" style="margin-top:15px;">상태</label> 
							    <input class="col-sm-4 form-control" type="text" id="club_status" 
							    readonly name="club_status" 
							    value="<c:if test= "${club.club_status==0 }" >승인 대기 중</c:if>
									<c:if test= "${club.club_status==1 }" >운영중</c:if>
									<c:if test= "${club.club_status==2 }" >운영중지</c:if>">
							</div>		
							
							
							
						</form>
						</div>
						</div>
					</div><!--end card-body  -->
					</div>
					<div class="text-center" style="margin-left:50px; margin-top:35px; margin-bottom:30px;">
					    
					    <button type="button" class="button special small" id="statusBtn" onclick="Status();">
					    <c:if test= "${club.club_status==1 }" >운영중지</c:if>
						<c:if test= "${club.club_status==2 }" >운영중지 해제</c:if></button>
						&nbsp; &nbsp; &nbsp;
						<button type="button" class="button special small" id="closeBtn" onclick="CloseWindow();">닫기</button>
						
					</div><!--end card-footer  -->
				</div><!-- end card -->				

				<%-- <div id="replyList">
					<div class="form-group row">
							    <label>동호회 명 </label> 
							    <input value="${club.club_name }">
							</div>
							<div class="form-group row">
							    <label> 아이디</label> 
							    <input value="${reply.reply_content }">
							</div>
							
							<div class="form-group row">
							    <label>등록날짜</label> 
							    <input value="${reply.reply_regDate }">
							</div>	
				
				</div> --%>

<script>
/* 	window.onload=function(){
		
		$('#contentDiv').attr("contentEditable",false);
		$(':radio:not(:checked)').attr('disabled',true);
	} */
	function CloseWindow(){
		window.close();
	
	}
	
	</script>
	
	<script>
	function Status(){
		var id = club_no.value;
		var status = club_status.value;
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
	
	function reply(){
		var id= mem_id.value;
		alert(id);
		
			$.ajax({
				url:"<%=request.getContextPath() %>/manage/user/list",
				type:"POST",
				data:{mem_id:id},
				success:function(result){
					$('#replyList').append(data);
					location.reload();
				}
				
			}); 
		
	 
	}
	</script>
	
	</body>

