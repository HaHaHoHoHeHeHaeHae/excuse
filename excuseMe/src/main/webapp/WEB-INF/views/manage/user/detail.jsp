<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<head>
<meta charset="utf-8">
<title>회원 상세보기</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<style>
.card-body{
	
}
</style>
<body class="subpage">

		<div class="col-md-12">
				<div class="card">
				<div class="text-center">
					<div class="card-header" style="background:#CAEAF7;">
						<h3> ${member.mem_name }님의&nbsp;회원정보</h3>
					</div><!--end card-header  --> 
					<div style="margin-left:180px;">
					<div class="card-body">
						<form role="form" method="post" action="detail" name="detailForm">
							<div class="form-group row" >
							    <label class="col-sm-3 control-label" style="margin-top:15px;">이름</label> 
							    <input class="col-sm-5 form-control" type="text" id="club_name" 
							    readonly name="id" value="${member.mem_name }">
							</div>
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label"style="margin-top:15px;">아이디</label> 
							    <input class="col-sm-5 form-control" type="text" id="mem_id" 
							    readonly name="mem_id" value="${member.mem_id }">
							</div>
							
							<div class="form-group row" style="margin-top:15px;">
							
							    <label class="col-sm-3 control-label" style="margin-top:15px;">상태</label> 
							    <input class="col-sm-5 form-control" type="text" id="nick" 
							    readonly name="id" 
							    value="<c:if test= "${member.mem_status==1 }" >활성</c:if>
									<c:if test= "${member.mem_status==0 }" >비활성</c:if>">
							</div>
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">닉네임</label> 
							    <input class="col-sm-5 form-control" type="text" id="club_local" 
							    readonly name="id" value="${member.mem_nick }">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">성별</label> 
							    <input class="col-sm-5 form-control" type="text" id="cate_name" 
							    readonly name="id" value="${member.mem_gender }">
							</div>	
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">생년월일</label> 
							    <input class="col-sm-5 form-control" type="text" id="nick" 
							    readonly name="id" value="<fmt:formatDate value="${member.mem_birthDate }" pattern="yyyy-MM-dd"/>">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">가입날짜</label> 
							    <input class="col-sm-5 form-control" type="text" id="nick" 
							    readonly name="id" value="<fmt:formatDate value="${member.mem_regDate }" pattern="yyyy-MM-dd"/>">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">지역</label> 
							    <input class="col-sm-5 form-control" type="text" id="cate_name" 
							    readonly name="id" value="${member.mem_local }">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">연락처</label> 
							    <input class="col-sm-5 form-control" type="text" id="cate_name" 
							    readonly name="id" value="${member.mem_phone }">
							</div>	
							
							
							
							<div class="form-group row" style="margin-top:15px;">
							
							    <label class="col-sm-3 control-label" style="margin-top:15px;">이름 공개 여부</label> 
							    <input class="col-sm-5 form-control" type="text" id="nick" 
							    readonly name="id" 
							    value="<c:if test= "${member.mem_name_check==0 }" >공개</c:if>
									<c:if test= "${member.mem_name_check==1 }" >비공개</c:if>">
							</div>
							
							<div class="form-group row" style="margin-top:15px;">
							
							    <label class="col-sm-3 control-label" style="margin-top:15px;">아이디 공개 여부</label> 
							    <input class="col-sm-5 form-control" type="text" id="nick" 
							    readonly name="id" 
							    value="<c:if test= "${member.mem_id_check==0 }" >공개</c:if>
									<c:if test= "${member.mem_id_check==1 }" >비공개</c:if>">
							</div>	
							
							<div class="form-group row" style="margin-top:15px;">
							
							    <label class="col-sm-3 control-label" style="margin-top:15px;">연락처 공개 여부</label> 
							    <input class="col-sm-5 form-control" type="text" id="nick" 
							    readonly name="id" 
							    value="<c:if test= "${member.mem_phone_check==0 }" >공개</c:if>
									<c:if test= "${member.mem_phone_check==1 }" >비공개</c:if>">
							</div>			
							
							
							
						</form>
						</div>
						</div>
					</div><!--end card-body  -->
					</div>
					<div class="text-center" style="margin-left:50px; margin-top:35px; margin-bottom:30px;">
					    
					    &nbsp; &nbsp; &nbsp;
					    <button type="button" class="button special small" id="statusBtn" onclick="StatusStop();">
					    <c:if test= "${member.mem_status==1 }" >활동중지</c:if>
						<c:if test= "${member.mem_status==0 }" >활동중지 해제</c:if></button>
						&nbsp; &nbsp; &nbsp;
						<button type="button" class="button special small" id="closeBtn" onclick="CloseWindow();">닫기</button>
						
					</div><!--end card-footer  -->
				</div><!-- end card -->				

				 <div id="replyList">
					<%-- <div class="form-group row">
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
							</div>	 --%>
				
				</div> 

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
	function StatusStop(){
		var id= mem_id.value;
		alert(id);
		if(confirm("활동중지 시키겠습니까?")){
			$.ajax({
				url:"<%=request.getContextPath() %>/manage/user/status",
				type:"POST",
				data:{mem_id:id},
				
				success:function(result){
					if(result=="SUCCESS"){
						alert("활동중지 되었습니다.");
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
				url:"<%=request.getContextPath() %>/manage/user/replyList",
				type:"GET",
				data:{mem_id:id},
				success:function(result){
					$('#replyList').append(replyList);
					location.reload();
				}
				
			}); 
		
	 
	}
	</script>
	
	</body>

