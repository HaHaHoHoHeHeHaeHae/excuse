<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/adminLTE/plugins/daterangepicker/daterangepicker.css">
  <style>
.register-box {
	width: 950px;
	margin-top: -80px;
}

.register-logo img {
	width: 150px;
	height: auto;
}

#registForm div {
	margin-left: 5px;
}

#registForm div div {
	padding: 0;
}

#checkbutton {
	margin: 0;
	padding: 0;
}

.card-footer div {
	margin-left: 100px;
}

.card-footer div div {
	padding: 0;
}

#nullform {
	width: 10px;
}

#jungbok {
	margin-top: 5px;
}

#mem_id_check_label, #mem_name_check_label, #mem_phone_check_label {
	font-size: 0.8em;
}

#mem_id_test, #mem_pwd_test, #mem_pwd_check_test, #mem_name_test, #mem_nick_test, #mem_phone_test{
	margin-left:10px;
	font-size: 0.8em;
	color:red;
}
</style>

</head>

<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<img src="<%=request.getContextPath()%>/resources/img/logo.png">
		</div>
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">회원가입</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<form action="#" method="post" id="registForm">
					<div>
						<p>
							이메일 &nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
								id="mem_id_check" name="mem_id_check" value="1"> <label for="mem_id_check"
								id="mem_id_check_label">정보&nbsp비공개</label>
						</p>
					</div>
					
					<div class="row uniform" id="emailform">
						<div class="3u 10u$(xsmall)">
							<input type="text" name="mem_id" id="mem_id" value=""
								placeholder="아이디" maxlength="20"/>
						</div>
						
						<div class="3u$ 12u$(xsmall)">
							<input type="text" name="email_add" id="email_add" value=""
								 placeholder="@" maxlength="20"/>
						</div>
						<div class="3u$ 12u$(xsmall)">
							<select name="email_address" id="email_address">
								<option value="">- 직접입력 -</option>
								<option value="@naver.com">naver.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@hotmail.com">hotmail.com</option>
								<option value="@nate.com">nate.com</option>
								<option value="@yahoo.co.kr">yahoo.co.kr</option>
							</select>
						</div>
						<div class="2u$ 12u$(xsmall)" id="checkbutton">
							<span class="button alt small" id="jungbok" onclick="mem_id_jungbok()">중&nbsp복&nbsp체&nbsp크</span>
						</div>
					</div>
					<div>
							<p id="mem_id_test"> </p><input type="hidden" id="mem_id_hidden1" value=""><input type="hidden" id="mem_id_hidden2" value=""><input type="hidden" id="mem_id_check_hidden" value="">
					</div>

					<div>
						<p>비밀번호</p>
					</div>
					<div class="row uniform">
						<div class="9u 12u$(xsmall)">
							<input type="password" name="mem_pwd" id="mem_pwd" value=""
								placeholder="비밀번호" maxlength="30"/>
						</div>
					</div>
					<div>
							<p id="mem_pwd_test"> </p><input type="hidden" id="mem_pwd_hidden" value="">
					</div>
					<div>
						<p>비밀번호 확인</p>
					</div>
					<div class="row uniform">
						<div class="9u 12u$(xsmall)">
							<input type="password" name="mem_pwd_check" id="mem_pwd_check" value=""
								placeholder="비밀번호 확인" maxlength="30"/>
						</div>
					</div>
					<div>
							<p id="mem_pwd_check_test"> </p><input type="hidden" id="mem_pwd_check_hidden" value="">
					</div>
					<div>
						<p>
							이름&nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
								id="mem_name_check" name="mem_name_check" value="1"> <label for="mem_name_check"
								id="mem_name_check_label">정보&nbsp비공개</label>
						</p>
					</div>
					<div class="row uniform">
						<div class="5u 12u$(xsmall)">
							<input type="text" name="mem_name" id="mem_name" value=""
								placeholder="이름" maxlength="8"/>
						</div>
					</div>
					<div>
							<p id="mem_name_test"> </p><input type="hidden" id="mem_name_hidden" value="">
					</div>
					<div>
						<p>닉네임</p>
					</div>
					<div class="row uniform">
						<div class="5u 12u$(xsmall)">
							<input type="text" name="mem_nick" id="mem_nick"
								placeholder="닉네임" maxlength="20"/>
						</div>
						<div class="2u$ 12u$(xsmall)" id="checkbutton">
							<span class="button alt small" id="jungbok" onclick="mem_nick_jungbok()">중&nbsp복&nbsp체&nbsp크</span>
						</div>
						
					</div>
					<div>
							<p id="mem_nick_test"> </p><input type="hidden" id="mem_nick_hidden" value=""><input type="hidden" id="mem_nick_check_hidden" value="">
					</div>
					<div>
						<p>
							전화번호&nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
								id="mem_phone_check" name="mem_phone_check" value="1"> <label for="mem_phone_check"
								id="mem_phone_check_label">정보&nbsp비공개</label>
						</p>
					</div>
					<div class="row uniform">
						<div class="3u$ 12u$(xsmall)">
							<select name="mem_phone1" id="mem_phone1" >
								<option value="fail" selected disabled>- 전화번호 -</option>
								<option value="010">010</option>
								<option value="02">02</option>
								<option value="051">051</option>
								<option value="053">053</option>
								<option value="032">032</option>
								<option value="062">062</option>
								<option value="042">042</option>
								<option value="052">052</option>
								<option value="044">044</option>
								<option value="031">031</option>
								<option value="033">033</option>
								<option value="043">043</option>
								<option value="041">041</option>
								<option value="063">063</option>
								<option value="061">061</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="064">064</option>
							</select>
						</div>
						<div class="3u 12u$(xsmall)">
							<input type="text" name="mem_phone2" id="mem_phone2" value=""
								placeholder="" maxlength="4"/>
						</div>
						<div class="3u 12u$(xsmall)">
							<input type="text" name="mem_phone3" id="mem_phone3" value=""
								placeholder="" maxlength="4"/>
						</div>
					</div>
					<div>
							<p id="mem_phone_test"> </p><input type="hidden" id="mem_phone_hidden" value="">
					</div>
					<div>
						<p>지역</p>
					</div>
					<div class="row uniform">
						<div class="4u$ 12u$(xsmall)">
							<select name="mem_local1" id="mem_local1" style="width: 100%;">
								
								<option value="fail" selected disabled>- 광역시, 도 -</option>
								<c:forEach var="local" items="${localList.localList}">
									<option value="${local.local_name }">${local.local_name }</option>
								</c:forEach>
								
							</select>
						</div>
						<div class="4u$ 12u$(xsmall)">
							<select name="mem_local2" id="mem_local2" >
								<option value="" value="fail" selected disabled>- 시, 구 -</option>
							</select>
						</div>
					</div>
					<br />
					<div>
						<p>생년월일</p>
					</div>
					<div class="row uniform">
						<div class="4u$ 9u$(xsmall)">
							<p><input type="text" id="datepicker" name="mem_birthDate"></p>
						</div>	
					</div>
					<br />
					<div>
						<p>성 별</p>
					</div>
					<div class="row uniform">
						<div class="4u 12u$(small)">
							<input type="radio" id="priority-low" name="mem_gender" checked value="남성">
							<label for="priority-low">남&nbsp&nbsp&nbsp&nbsp성</label>
						</div>
						<div class="4u 12u$(small)">
							<input type="radio" id="priority-normal" name="mem_gender" value="여성">
							<label for="priority-normal">여&nbsp&nbsp&nbsp&nbsp성</label>
						</div>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="row uniform">
					<div id="nullform"></div>
					<div class="2u$ 12u$(small)">
						<span class="button special" id="signup">회원가입</span>
					</div>
					<div class="2u$ 12u$(small)">
						<span class="button alt">취&nbsp&nbsp&nbsp&nbsp소</span>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
function mem_nick_jungbok(){
	var nick = mem_nick.value;
	
	$.ajax({
		type:"GET",
		url:"<%=request.getContextPath()%>/common/searchNickForCheck?mem_nick="+nick,
		success:function(response){
			alert("사용 가능한 닉네임입니다.");
			$("#mem_nick").attr("readonly",true).attr("disabled",true);
			$("#mem_nick_check_hidden").val("success");
		},
		error:function(error){
			alert("중복된 닉네임입니다.");
			$("#mem_nick").val("");
			$("#mem_nick_check_hidden").val("");
		}
		
	});
	
}
function mem_id_jungbok(){
	var id = mem_id.value+email_add.value;
	
	$.ajax({
		type:"GET",
		url:"<%=request.getContextPath()%>/common/searchIdForCheck?mem_id="+id,
		success:function(response){
			alert("사용 가능한 아이디입니다.");
			$("#mem_id").attr("readonly",true).attr("disabled",true);
			$("#mem_id_check_hidden").val("success");
			$("#mem_id_hidden2").val("success");
		},
		error:function(error){
			alert("이미 가입된 이메일입니다.");
			$("#mem_id").val("");
			$("#mem_id_check_hidden").val("success");
		}
		
	});
	
}

<%--이메일 주소 입력창 변경 --%>
$("#email_address").change(function(address){
	var address2 = document.getElementById("email_address")
	var address1 = address2.options[address2.selectedIndex].value;
	$('#email_add').val(address1);
	if(address1!=""){
		$('#email_add').attr("readonly",true);
		$('#mem_id_test').html("");
		$("#mem_id_hidden2").val("success");
	}else if(address1=="@"){
		$('#email_add').attr("readonly",false);
		$("#mem_id_hidden2").val("");
	}
	
});

<%--체크박스--%>
$("input:radio[id='mem_gender']").is(":checked") == true;
$("input:checkbox[id='mem_id_check']").is(":checked") == true;
$("input:checkbox[id='mem_name_check']").is(":checked") == true;
$("input:checkbox[id='mem_phone_check']").is(":checked") == true;

<%--유효성 검사--%>

$(document).ready(function(){
	$("#mem_id").keyup(function(){
		var id= $("#mem_id").val();
		
		if(id != 0) {
			if(chkId(id)){
				$("#mem_id_test").html("");
				$("#mem_id_hidden1").val("success");
			}else{
				$("#mem_id_test").html("잘못된 이메일 주소 입니다.");
				$("#mem_id_hidden1").val("fail");
			}
		}else{
			$("#mem_id_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_id_hidden1").val("fail");
		}
		
		
	});
	$("#email_add").keyup(function(){
		var email= $("#email_add").val();
		
		if(email != 0) {
			if(chkAddress(email)){
				$("#mem_id_test").html("");
				$("#mem_id_hidden2").val("success");
			}else{
				$("#mem_id_test").html("잘못된 이메일 주소 입니다.");
				$("#mem_id_hidden2").val("fail");
			}
		}else{
			$("#mem_id_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_id_hidden2").val("fail");
		}	
	});
	$("#mem_pwd").keyup(function(){
		var pwd= $("#mem_pwd").val();
		
		if(pwd != 0) {
			if(chkPwd(pwd)){
				$("#mem_pwd_test").html("");
				$("#mem_pwd_hidden").val("success");
			}else{
				$("#mem_pwd_test").html("비밀번호는 8자 이상, 15자 이하로 영소문자, 숫자, 특수기호를 포함하여야 합니다.");
				$("#mem_pwd_hidden").val("fail");
			}
		}else{
			$("#mem_pwd_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_pwd_hidden").val("fail");
		}	
	});
	$("#mem_pwd_check").keyup(function(){
		var pwd= $("#mem_pwd").val();
		var pwd_check=$("#mem_pwd_check").val();
		
		if(pwd_check != 0){
			if(pwd != pwd_check){
				$("#mem_pwd_check_test").html("비밀번호가 일치하지 않습니다.");
				$("#mem_pwd_check_hidden").val("");
			}else{
				$("#mem_pwd_check_test").html("");
				$("#mem_pwd_check_hidden").val("success");
			}
		}else{
			$("#mem_pwd_check_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_pwd_check_hidden").val("");
		}
	});
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
	$("#mem_nick").keyup(function(){
		var nick= $("#mem_nick").val();
	 	
		if(nick != 0) {
			if(chkNick(nick)){
				$("#mem_nick_test").html("");
				$("#mem_nick_hidden").val("success");
			}else{
				$("#mem_nick_test").html("닉네임은 최소 2글자, 최대 10글자입니다.");
				$("#mem_nick_hidden").val("");
			}
		}else{
			$("#mem_nick_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_nick_hidden").val("");
		}	
	});
	$("#mem_phone3").keyup(function(){
		var phone2= $("#mem_phone2").val();
		var phone3= $("#mem_phone3").val();
	 	
		if(phone3 != 0) {
			if(chkPhone(phone2)){
				$("#mem_phone_test").html("");
				if(chkPhone(phone3)){
					$("#mem_phone_test").html("");
					$("#mem_phone_hidden").val("success");
				}else{
					$("#mem_phone_test").html("숫자만 입력가능합니다.");
					$("#mem_phone_hidden").val("");
				}
			}else{
				$("#mem_phone_test").html("숫자만 입력가능합니다.");
				$("#mem_phone_hidden").val("");
			}
		}else{
			$("#mem_phone_test").html("빈칸을 입력하실 수 없습니다.");
			$("#mem_phone_hidden").val("");
		}	
	});

});

function chkId(mem_id){
	var chkEmail = new RegExp(/^[a-zA-Z0-9]{1,12}$/);
	return chkEmail.test(mem_id);
}
function chkAddress(email){
	var chkeAddress = new RegExp(/^@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	return chkeAddress.test(email);
}
function chkPwd(pwd){
	var chkeAddress = new RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/);
	return chkeAddress.test(pwd);
}
function chkName(name){
	var name2= RegExp(/^[가-힣]{2,4}$/);
	return name2.test(name);
}
function chkNick(nick){
	var nick2= RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}|[가-힣][a-zA-Z]{2,10}$/);
	return nick2.test(nick);
}
function chkPhone(phone){
	var phone2= RegExp(/^[0-9]+$/);
	return phone2.test(phone);
}

<%--지역 변경 --%>
$("#mem_local1").change(function(){
	
	var local = $("#mem_local1").val();
	
	$.ajax({
		data:{local_name:local},
		type:"GET",
		url:"<%=request.getContextPath()%>/common/registLocal",
		success:function(data){
			$("#mem_local2").html("");
			$("#mem_local2").append("<option value='' value='fail' selected disabled>- 시, 구 -</option>");
			for(var sub of data){
				console.log(sub.local_sub_name);
				$("#mem_local2").append("<option>"+sub.local_sub_name+"</option>");
			}
					
		},
		error:function(){
			alert("서버오류입니다.");
		}
	});
});

<%--회원가입 버튼 활성화 --%>
$("#signup").click(function(){
	var id1 = $("#mem_id_hidden1").val();
	var id2 = $("#mem_id_hidden2").val();
	var id3 = $("#mem_id_check_hidden").val();
	var pwd1 = $("#mem_pwd_hidden").val();
	var pwd2= $("#mem_pwd_check_hidden").val();
	var name1 = $("#mem_name_hidden").val();
	var nick1 = $("#mem_nick_hidden").val();
	var nick2 = $("#mem_nick_check_hidden").val();
	var phone1 = $("#mem_phone_hidden").val();
	var phone2 = mem_phone1.value;
	var local1 = mem_local1.value;
	var local2 = mem_local2.value;
	
	var id = mem_id.value+email_add.value;
	var pwd = mem_pwd.value;
	var name = mem_name.value;
	var nick = mem_nick.value;
	var phone = mem_phone1.value+"-"+mem_phone2.value+"-"+mem_phone3.value;
	var local = mem_local1.value+"_"+mem_local2.value;
	var birthDate = $("#datepicker").val();
	var gender = $("input:radio[name='mem_gender']:checked").val();
	if($("input:checkbox[name='mem_phone_check']").is(":checked")==true){
		var phone_check = $('input:checkbox[id="mem_phone_check"]').val();
	}else{
		var phone_check = 0;
	}
	if($("input:checkbox[name='mem_id_check']").is(":checked")==true){
		var id_check = $('input:checkbox[id="mem_id_check"]').val();
	}else{
		var id_check = 0;
	}
	if($("input:checkbox[name='mem_name_check']").is(":checked")==true){
		var name_check = $('input:checkbox[id="mem_name_check"]').val();
	}else{
		var name_check = 0;
	}
	
	if(local1== "fail" || local2 =="fail" || phone2 == "fail" || id1 != "success" || id2 != "success" || id3 != "success" || pwd1 != "success" || pwd2 != "success" || name1 != "success" || nick1 != "success" || nick2 != "success" || phone1 != "success" ){
		alert("잘 못 된 정보를 입력하셨습니다.");
		
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/common/signup",
			type:"POST",
			data:{mem_id:id,
				  mem_pwd:pwd,
				  mem_gender:gender,
				  mem_name:name,
				  mem_nick:nick,
				  mem_phone:phone,
				  mem_local:local,
				  mem_birthDate:birthDate,
				  mem_phone_check:phone_check,
				  mem_id_check:id_check,
				  mem_name_chcek:name_check
				  },
			success:function(mem_id){
				alert(mem_id+"님 회원가입 되었습니다");
				self.location="<%=request.getContextPath()%>/common/login";
			},
			error:function(){
				alert("서버에 오류가 발생하였습니다. 다시 시도하세요.");
			}
		});
		
	}
});
</script>

</body>
</html>