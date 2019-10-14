<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>비밀번호 찾기</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>
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
#mem_name_test, #mem_id_test {
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
				<p>비밀번호 찾기</p>
			</div>
			<div class="card-body login-card-body">
				<form action="#" method="post">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <ion-icon name="contacts"></ion-icon>
							</span>
						</div>
						<input type="text" class="form-control" id="mem_name"
							name="mem_name" placeholder="이름">
					</div>
					<div>
						<p id="mem_name_test"></p>
						<input type="hidden" id="mem_name_hidden">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <ion-icon name="mail"></ion-icon>
							</span>
						</div>
						<input type="email" class="form-control" id="mem_id" name="mem_id"
							placeholder="아이디">
					</div>
					<div>
						<p id="mem_id_test"></p><input type="hidden" id="mem_id_hidden">
					</div>



					<div class="social-auth-links text-center">
						<a href="#" class="button small" onclick="sendMail()">확&nbsp&nbsp&nbsp인</a>
					</div>
				</form>

				<!-- /.social-auth-links -->
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/searchIdPwd_footer.jsp"%>
	<script>
	function sendMail(){
		var id = mem_id.value;
		var name = mem_name.value;
		var name_hidden = $("#mem_name_hidden").val();
		var id_hidden = $("#mem_id_hidden").val();
		if(name_hidden != "success" ||phone_id != "success"){
			alert("잘 못 된 입력입니다.")
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/mail/sendPwd",
					data : {
						mem_id : id,
						mem_name : name
					},
					type : "POST",
					success : function() {
						alert("이메일로 비밀번호를 전송하였습니다.");
						closeWindow();
					},
					error : function() {
						alert("등록된 아이디와 이름이 없습니다.");
					}
	
				});
		}
		}
	<%--유효성검사--%>
		$(document).ready(function() {

			$("#mem_name").keyup(function() {
				var name = $("#mem_name").val();

				if (name != 0) {
					if (chkName(name)) {
						$("#mem_name_test").html("");
						$("#mem_name_hidden").val("success");
					} else {
						$("#mem_name_test").html("한글을 입력하세요.");
						$("#mem_name_hidden").val("");
					}
				} else {
					$("#mem_name_test").html("빈칸을 입력하실 수 없습니다.");
					$("#mem_name_hidden").val("");
				}
			});
			$("#mem_id").keyup(function() {
				var id = $("#mem_id").val();
				if (id != 0) {
					if (chkId(id)) {
						$("#mem_id_test").html("");
						$("#mem_id_hidden").val("success");
					} else {
						$("#mem_id_test").html("잘못된 이메일 형태입니다.");
						$("#mem_id_hidden").val("");
					}
				} else {
					$("#mem_id_test").html("빈칸을 입력하실 수 없습니다.");
					$("#mem_id_hidden").val("");
				}
			});

		});

		function chkName(name) {
			var name2 = RegExp(/^[가-힣]{2,4}$/);
			return name2.test(name);
		}
		function chkId(id) {
			var email2 = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
			return email2.test(id);
		}
	</script>
</body>
</html>
