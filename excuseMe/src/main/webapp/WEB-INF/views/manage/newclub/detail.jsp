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
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label" style="margin-top:15px;">NO</label> 
							    <input class="col-sm-4 form-control" type="text" id="clubno" 
							    readonly name="clubno" value="${club.club_no }">
							</div>	
							<div class="form-group row" >
							    <label class="col-sm-3 control-label" style="margin-top:15px;">동호회 이름</label> 
							    <input class="col-sm-4 form-control" type="text" id="club_name" 
							    readonly name="id" value="${club.club_name }">
							</div>
							<div class="form-group row" style="margin-top:15px;">
							    <label class="col-sm-3 control-label"style="margin-top:15px;">대표자 닉네임</label> 
							    <input class="col-sm-4 form-control" type="text" id="mem_id" 
							    readonly name="mem_id" value="${member.mem_id }">
							    <button class="button small"  onclick="memdetail();">대표자 정보</button>
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
							    <input class="col-sm-4 form-control" type="text" id="nick" 
							    readonly name="id" 
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
					    
					    <button type="button" class="button small" id="statusBtn" onclick="Status();">
					    수락</button>
					    <button type="button" class="button small" id="statusStopBtn" onclick="StatusStop();">
					    거부</button>
						&nbsp; &nbsp; &nbsp;
						<button type="button" class="button special small" id="closeBtn" onclick="CloseWindow();">닫기</button>
						
					</div><!--end card-footer  -->
				</div><!-- end card -->				

				

<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
		                	+", height="+ WinHeight +", top="+ wintop +", left=" 
		                	+ winleft + ", resizable=no, status=yes"  );
    win.focus() ; 
}
	function CloseWindow(){
		window.close();
	
	}
	
	</script>
	
	<script>
	function Status(){
		var id= clubno.value;
		//var status = $("#club_status").val();
		//alert(id);
		//alert(status);
		
			$.ajax({
				url:"<%=request.getContextPath() %>/manage/club/status",
				type:"POST",
				data:{club_no:id},
				
				success:function(result){
					if(result=="SUCCESS"){
						alert("승인수락 되었습니다.");
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
	function StatusStop(){
		var id= clubno.value;
		//var status = $("#club_status").val();
		//alert(id);
		//alert(status);
		
			$.ajax({
				url:"<%=request.getContextPath() %>/manage/club/stopstatus",
				type:"POST",
				data:{club_no:id},
				
				success:function(result){
					if(result=="SUCCESS"){
						alert("승인거부 되었습니다.");
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
	
	function memdetail(){
		var mem_id= mem_id.value;
		self.location.href="<%=request.getContextPath() %>/manage/member/detail?mem_id="+mem_id;
	
	}
   	
	
	
	</script>
	
	</body>

