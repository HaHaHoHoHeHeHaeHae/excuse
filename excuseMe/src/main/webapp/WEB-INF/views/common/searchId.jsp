<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>아이디 찾기</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/daterangepicker/daterangepicker.css">
<style>
#search {
	padding: 0;
}

.login-box {
	margin: 0px;
}

#topid {
	font-size: 1em;
	font-weight: bold;
}

#midid {
	font-size: 1em;
	text-align: center;
}

#botid {
	font-size: 1em;
	text-align: right;
	margin: 0;
	font-weight: bold;
}

.card-header p {
	margin: 0;
	font-size: 1.2em;
	text-align: center;
	font-weight: bold;
}

@media screen and (max-width:480px) {
	.button {
		padding: 0 3.5em;
	}
}

#mem_name_test, #mem_phone_test, #mem_birthDate_test {
	margin-left: 10px;
	font-size: 0.8em;
	color: red;
	margin-bottom:0;
	margin-top:-13px;
}
	
</style>
</head>
<body class="hold-transition login-page" id="search">
	<div class="login-box">
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-header">
				<p>아이디 찾기</p>
			</div>
			<div class="card-body login-card-body">
				<form action="#" method="post">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <ion-icon name="contacts"></ion-icon>
							</span>
						</div>
						<input type="text" class="form-control" id="mem_name"
							name="mem_name" placeholder="한글 이름">
					</div>
					<div>
						<p id="mem_name_test"></p><input type="hidden" id="mem_name_hidden">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <ion-icon
									name="phone-portrait"></ion-icon>
							</span>
						</div>
						<input type="text" class="form-control" id="mem_phone"
							name="mem_phone" placeholder="휴대폰 번호 (-포함하여 입력)">
					</div>
					<div>
						<p id="mem_phone_test"></p><input type="hidden" id="mem_phone_hidden">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <ion-icon name="calendar"></ion-icon>
							</span>
						</div>
						<input type="text" class="form-control" id="mem_birthDate"
							name="mem_birthDate" placeholder="년-월-일 ex) 1993-02-18">
					</div>
					<div>
						<p id="mem_birthDate_test"></p><input type="hidden" id="mem_birthDate_hidden">
					</div>

					<div class="social-auth-links text-center">
						<span class="button small" onclick="searchId();">확&nbsp&nbsp&nbsp인</span>
					</div>
				</form>
				<div id="hold-transition" style="display: none;">
					<div class="card">
						<div class="card-body">
							<p id="topid">귀하의 아이디는</p>
							<p id="midid"></p>
							<p id="botid">입니다.&nbsp&nbsp&nbsp&nbsp</p>
						</div>
					</div>
				</div>
				<!-- /.social-auth-links -->
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>

	<!-- jQuery -->
	<%@include file="/WEB-INF/views/include/searchIdPwd_footer.jsp"%>
	<script>
function searchId(){
	var name = mem_name.value;
	var phone = mem_phone.value;
	var birthDate = mem_birthDate.value;
	
	var name_hidden = $("#mem_name_hidden").val();
	var phone_hidden = $("#mem_phone_hidden").val();
	var birthDate_hidden = $("#mem_birthDate_hidden").val();
	if(name_hidden != "success" ||phone_hidden != "success" ||birthDate_hidden != "success"){
		alert("잘 못 된 입력입니다.");
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/common/searchId",
			data:{mem_name:name,
				mem_phone:phone,
				mem_birthDate:birthDate},
			type:"POST",
			success:function(mem_id){
				$("#hold-transition").css("display","inline");
				$("#midid").html(mem_id);
			},
			error:function(){
				alert("일치하는 아이디가 없습니다.");
			}
		});
	}
	
}

<%--유효성검사--%>
$(document).ready(function(){
	
	$("#mem_name").keyup(function(){
		var name= $("#mem_name").val();
	 	
		if(name != 0) {
			if(chkName(name)){
				$("#mem_name_test").html("");
				$("#mem_name_hidden").val("success");
			}else{
				$("#mem_name_test").html("한글을 입력하세요.");
				$("#mem_name_hidden").val("");
			}
		}else{
			$("#mem_name_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_name_hidden").val("");
		}	
	});
	$("#mem_phone").keyup(function(){
		var phone = $("#mem_phone").val();
		if(phone != 0) {
			if(chkPhone(phone)){
				$("#mem_phone_test").html("");
				$("#mem_phone_hidden").val("success");
			}else{
				$("#mem_phone_test").html("잘못된 형태입니다. ex)010-3333-3333");
				$("#mem_phone_hidden").val("");
			}
		}else{
			$("#mem_phone_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_phone_hidden").val("");
		}	
	});
	$("#mem_birthDate").keyup(function(){
		var birthDate = $("#mem_birthDate").val();
		if(birthDate != 0) {
			if(chkBirthDate(birthDate)){
				$("#mem_birthDate_test").html("");
				$("#mem_birthDate_hidden").val("success");
			}else{
				$("#mem_birthDate_test").html("잘못된 형태입니다. ex)1993-01-01");
				$("#mem_birthDate_hidden").val("");
			}
		}else{
			$("#mem_birthDate_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_birthDate_hidden").val("");
		}	
	});
});

function chkName(name){
	var name2= RegExp(/^[가-힣]{2,4}$/);
	return name2.test(name);
}
function chkPhone(phone){
	var phone2= RegExp(/(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g);
	return phone2.test(phone);
}	
function chkBirthDate(birthDate){
	var birthDate2= RegExp(/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/);
	return birthDate2.test(birthDate);
}

</script>

</body>
</html>
