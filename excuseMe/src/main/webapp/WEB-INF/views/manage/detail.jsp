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

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/font-awesome.min.css"> --%>
	
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css"> --%>	

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>

<style>

</style>
<body class="subpage">

		<div class="col-md-12">
				<div class="card">
				<div class="text-center">
					<div class="card-header">
						<h3>${member.mem_name }님의&nbsp;&nbsp;회원 정보</h3>
					</div><!--end card-header  --> 
					<div class="card-body">
						<form role="form" method="post" action="detail" name="detailForm">
							</div>
                  			
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">이름</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="${member.mem_name }">
							</div>
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">아이디</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="${member.mem_id }">
							</div>
							
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">닉네임</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="${member.mem_nick }">
							</div>	
							
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">성별</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="${member.mem_gender }">
							</div>	
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">생년월일</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="<fmt:formatDate value="${member.mem_birthDate }" pattern="yyyy-MM-dd"/>">
							</div>	
							
							
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">가입날짜</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="<fmt:formatDate value="${member.mem_regDate }" pattern="yyyy-MM-dd"/>">
							</div>	
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">지역</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="${member.mem_local }">
							</div>	
							<div class="form-group row">
							    <label class="col-sm-2 control-label" for="writer">연락처</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" value="${member.mem_phone }">
							</div>
							<div class="form-group row">
							
							    <label class="col-sm-2 control-label" for="writer">상태</label> 
							    <input class="col-sm-3 form-control" type="text" id="nick" 
							    readonly name="id" 
							    value="<c:if test= "${member.mem_status==1 }" >활성</c:if>
									<c:if test= "${member.mem_status==0 }" >비활성</c:if>">
							</div>		
							
						   <div class="form-group row">  
							     <label class="col-sm-2">이름 공개 여부</label>
								 <div class="col-sm-4 row">
								      <div class="col-sm-4">
								            <label for="nameopen">공개</label>
								            <input type="radio" id="nameopen" name="oo" value="0" ${member.mem_name_check eq 0 ? 'checked' : '' }/>
								      </div>
								      <div class="col-sm-4">
								            <label for="nameclose">비공개</label>
								            <input type="radio" id="nameclose" name="xx" value="1" ${member.mem_name_check eq 0 ? 'checked' : '' }/>
								      </div>
								 </div>
							</div> 
							<div class="form-group row">  
							     <label class="col-sm-2">아이디 공개 여부</label>
								 <div class="col-sm-4 row">
								      <div class="col-sm-4">
								            <label for="idopen">공개</label>
								            <input type="radio" id="idopen" name="oo" value="0" ${member.mem_id_check eq 0 ? 'checked' : '' }/>
								      </div>
								      <div class="col-sm-4">
								            <label for="idclose">비공개</label>
								            <input type="radio" id="idclose" name="xx" value="1" ${member.mem_id_check eq 0 ? 'checked' : '' }/>
								      </div>
								 </div>
							</div>  
							<div class="form-group row">  
							     <label class="col-sm-2">연락처 공개 여부</label>
								 <div class="col-sm-4 row">
								      <div class="col-sm-4">
								            <label for="phoneopen">공개</label>
								            <input type="radio" id="phoneopen" name="oo" value="0" ${member.mem_phone_check eq 0 ? 'checked' : '' }/>
								      </div>
								      <div class="col-sm-4">
								            <label for="phoneclose">비공개</label>
								            <input type="radio" id="phoneclose" name="xx" value="1" ${member.mem_phone_check eq 0 ? 'checked' : '' }/>
								      </div>
								 </div>
							</div> 
							
							
							
						</form>
					</div><!--end card-body  -->
					<div class="text-center">
					    <button type="button" class="btn btn-secondary" id="closeBtn" onclick="CloseWindow();">댓글내역</button>
					    &nbsp; &nbsp; &nbsp;
					    <button type="button" class="btn btn-secondary" id="statusBtn">활동중지</button>
						&nbsp; &nbsp; &nbsp;
						<button type="button" class="btn btn-secondary" id="closeBtn" onclick="CloseWindow();">닫기</button>
						
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->

	

<script>
	window.onload=function(){
		$('input').attr('readonly',true);
		$('#contentDiv').attr("contentEditable",false);
		$(':radio:not(:checked)').attr('disabled',true);
	}
	function CloseWindow(){
		window.close();
	
	}
	
	</script>
	
	<script>
	$('#statusBtn').on('click',function(event){
		alert("활동중지 시키겠습니까?");
		var sendData={
				mem_id:mem_id
		});
	
		<%-- $.ajax({
			url:"<%=request.getRequestURL() %>/detail/"+mem_id,
			type:"POST",
			data:JSON.stringify(sendData),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Override":"delete"
			},
			success:function(result){
				if(result=="SUCCESS"){
					alert("활동중지 되었습니다.");
					getPage("<%=request.getRequestURL() %>/detail/${member.mem_id}/"+);
				}
			},
			error:function(error){
				alert('실패했습니다.');
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		}); --%>
	

	</script>
	
	</body>

