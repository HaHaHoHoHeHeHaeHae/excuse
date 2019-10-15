<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 개인정보수정</title>

<c:set var="phoneArr" value="${loginUser.mem_phone.split('-')}" />
<c:set var="localArr" value="${loginUser.mem_local.split('_')}" />



<style>
#subm {
   top: 170px;
   position: absolute;
   height: 500px;
   width: 240px;
   z-index: 5;
   background: #25A2C3;
   left: 4px;
   margin: 0px;
   padding: 0px;
   border-radius: 0px 10px 10px 0px;
}

.atag {
   font-size: 18px;
}

#section_div {
   position: absolute;
   left: 280px;
   width: 1200px;
   top: 150px;
}


</style>
</head>

<body class="subpage">

   <%-- <div id="subm">

      <br> <br> <br> <a
         href="<%=request.getContextPath()%>/mypage/myjoinlist" class="atag"
         style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입한
         동호회</a><br> <br> <a
         href="<%=request.getContextPath()%>/mypage/myclub" class="atag"
         style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생성한
         동호회</a><br> <br> <a
         href="<%=request.getContextPath()%>/mypage/wishlist" class="atag"
         style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심
         동호회</a><br> <br> <a
         href="<%=request.getContextPath()%>/mypage/myreply" class="atag"
         style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가
         쓴 댓글</a><br> <br> <a
         href="<%=request.getContextPath()%>/mypage/myinfo" class="atag"
         style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>


   </div> --%>


      <div id="sidebar" style="margin-top:120px;margin-left:120px;float:left;z-index:100;position:relative;background: #25a1c3;width: 250px;height: 1000px;text-align: center;display: inline-block;vertical-align: middle;height: 100%; left: -3px;">
         
         <div style="height:50px;background:#306170;">
            <p style=" padding-top:6px;font-size:1.3em; color:white; font-weight:bold;">마이 페이지</p>
         </div>
         <div class="subButton" onclick="myPage('myjoinlist');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
            <p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">가입한 동호회</p>
         </div>
         <div class="subButton" onclick="myPage('myclub');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
            <p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">생성한 동호회</p>
         </div>
         <div class="subButton"  onclick="myPage('wishlist');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
            <p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">관심 동호회</p>
         </div>
         <div class="subButton" onclick="myPage('myreply');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
            <p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">내가 쓴 댓글</p>
         </div>
         <div class="subButton" onclick="myPage('myinfo');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
            <p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;" >개인정보수정</p>
         </div>
         
      </div>
   
      <div id="section_div" style="postion: relative; left: 5px; top: 18px;">
         <!-- Main -->
         <section id="main" class="wrapper"> <!-- Menu --> <!-- Elements -->
         <div class="row">
            <h2 id="elements">마이페이지 - 개인정보수정</h2>
            <!-- <div class="nav nav-pills ml-auto p-2">
                     <span class="button small" onclick="#">글 쓰기</span>
                  </div> -->
         </div>
         <div class="card"  style="left: 29px;">

            <!-- /.card-header -->
            <div class="card-body">
               <form action="#" method="post" id="modifyForm">
                  <div>
                     <p style="margin-bottom: 15px;">
                        이메일 &nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
                           id="mem_id_check" name="mem_id_check" value="1" ${loginUser.mem_id_check eq 1 ? 'checked':'' }> <label
                           for="mem_id_check" id="mem_id_check_label">정보&nbsp비공개</label>
                     </p>
                  </div>

                  <div class="row uniform" id="emailform">
                     <div class="3u 10u$(xsmall)">
                        <input type="text" name="mem_id" id="mem_id"
                           value="${loginUser.mem_id}" maxlength="20" disabled />
                     </div>

                  </div>
                  <div>
                     <p id="mem_id_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_id_hidden1" value=""><input
                        type="hidden" id="mem_id_hidden2" value=""><input
                        type="hidden" id="mem_id_check_hidden" value="">
                  </div>

                  <div>
                     <p style="margin-bottom: 15px;">비밀번호</p>
                  </div>
                  <div class="row uniform">
                     <div class="9u 12u$(xsmall)">
                        <input type="password" name="mem_pwd" id="mem_pwd" value=""
                           placeholder="비밀번호" maxlength="30" />
                     </div>
                  </div>
                  <div>
                     <p id="mem_pwd_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_pwd_hidden" value="">
                  </div>
                  <div>
                     <p style="margin-bottom: 15px;">비밀번호 확인</p>
                  </div>
                  <div class="row uniform">
                     <div class="9u 12u$(xsmall)">
                        <input type="password" name="mem_pwd_check" id="mem_pwd_check"
                           value="" placeholder="비밀번호 확인" maxlength="30" />
                     </div>
                  </div>
                  <div>
                     <p id="mem_pwd_check_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_pwd_check_hidden" value="">
                  </div>
                  <div>
                     <p style="margin-bottom: 15px;">
                        이름&nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
                           id="mem_name_check" name="mem_name_check" value="1" ${loginUser.mem_name_check eq 1 ? 'checked':'' } > <label
                           for="mem_name_check" id="mem_name_check_label">정보&nbsp비공개</label>
                     </p>
                  </div>
                  <div class="row uniform">
                     <div class="5u 12u$(xsmall)">
                        <input type="text" name="mem_name" id="mem_name"
                           value="${loginUser.mem_name}" maxlength="8" disabled />
                     </div>
                  </div>
                  <div>
                     <p id="mem_name_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_name_hidden" value="">
                  </div>
                  <div>
                     <p style="margin-bottom: 15px;">닉네임</p>
                  </div>
                  <div class="row uniform">
                     <div class="5u 12u$(xsmall)">
                        <input type="text" name="mem_nick" id="mem_nick"
                           placeholder="닉네임" maxlength="20" value="${loginUser.mem_nick}" />
                     </div>
                     <div class="2u$ 12u$(xsmall)" id="checkbutton">
                        <span class="button alt small" id="jungbok"
                           onclick="mem_nick_jungbok()">중&nbsp복&nbsp체&nbsp크</span>
                     </div>

                  </div>
                  <div>
                     <p id="mem_nick_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_nick_hidden" value=""><input
                        type="hidden" id="mem_nick_check_hidden" value="aaa">
                  </div>
                  <div>
                     <p style="margin-bottom: 15px;">
                        전화번호&nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
                           id="mem_phone_check" name="mem_phone_check" value="1" ${loginUser.mem_phone_check eq 1 ? 'checked':'' }>
                        <label for="mem_phone_check" id="mem_phone_check_label">정보&nbsp비공개</label>
                     </p>
                  </div>
                  <div class="row uniform">
                     <div class="3u$ 12u$(xsmall)">
                        <select name="mem_phone1" id="mem_phone1">
                           <option value="fail" selected disabled>- 전화번호 -</option>
                           <option value="010" ${phoneArr[0] eq "010" ? 'selected':''}>010</option>
                           <option value="02" ${phoneArr[0] eq "02" ? 'selected':''}>02</option>
                           <option value="051" ${phoneArr[0] eq "051" ? 'selected':''}>051</option>
                           <option value="053" ${phoneArr[0] eq "053" ? 'selected':''}>053</option>
                           <option value="032" ${phoneArr[0] eq "032" ? 'selected':''}>032</option>
                           <option value="062" ${phoneArr[0] eq "062" ? 'selected':''}>062</option>
                           <option value="042" ${phoneArr[0] eq "042" ? 'selected':''}>042</option>
                           <option value="052" ${phoneArr[0] eq "052" ? 'selected':''}>052</option>
                           <option value="044" ${phoneArr[0] eq "044" ? 'selected':''}>044</option>
                           <option value="031" ${phoneArr[0] eq "031" ? 'selected':''}>031</option>
                           <option value="033" ${phoneArr[0] eq "033" ? 'selected':''}>033</option>
                           <option value="043" ${phoneArr[0] eq "043" ? 'selected':''}>043</option>
                           <option value="041" ${phoneArr[0] eq "041" ? 'selected':''}>041</option>
                           <option value="063" ${phoneArr[0] eq "063" ? 'selected':''}>063</option>
                           <option value="061" ${phoneArr[0] eq "061" ? 'selected':''}>061</option>
                           <option value="054" ${phoneArr[0] eq "054" ? 'selected':''}>054</option>
                           <option value="055" ${phoneArr[0] eq "055" ? 'selected':''}>055</option>
                           <option value="064" ${phoneArr[0] eq "064" ? 'selected':''}>064</option>
                        </select>
                     </div>
                     <div class="3u 12u$(xsmall)">
                        <input type="text" name="mem_phone2" id="mem_phone2"
                           value="${phoneArr[1] }" placeholder="" maxlength="4" />
                     </div>
                     <div class="3u 12u$(xsmall)">
                        <input type="text" name="mem_phone3" id="mem_phone3"
                           value="${phoneArr[2] }" placeholder="" maxlength="4" />
                     </div>
                  </div>
                  <div>
                     <p id="mem_phone_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_phone_hidden" value="">
                  </div>
                  <div>
                     <p style="margin-bottom: 15px;">지역</p>
                  </div>
                  <div class="row uniform">
                     <div class="4u$ 12u$(xsmall)">
                        <select name="mem_local1" id="mem_local1" style="width: 100%;">

                           <option value="fail" disabled>- 광역시, 도 -</option>
                           <c:forEach var="local" items="${localList}">
                              <option value="${local.local_no }" ${localArr[0] eq local.local_name ? 'selected':''} class="${local.local_name }" >${local.local_name }</option>
                           </c:forEach>

                        </select>
                     </div>
                     <div class="4u$ 12u$(xsmall)">
                        <input type="hidden" id="sublocal" value="${localArr[1] }">
                        <select name="mem_local2" id="mem_local2">
                           <option value="" value="fail" selected disabled>- 시, 구
                              -</option>
                        </select>
                     </div>
                  </div>
                  <br />
                  <div>
                     <p style="margin-bottom: 15px;">생년월일</p>
                  </div>
                  <div class="row uniform">
                     <div class="4u$ 9u$(xsmall)">
                        <p style="margin-bottom: 15px;">
                           <input type="text" class="form-control" id="mem_birthDate"
                              name="mem_birthDate"
                              value="<fmt:formatDate value="${loginUser.mem_birthDate }" pattern="yyyy-MM-dd" />" disabled>
                        </p>
                     </div>
                  </div>
                  <div>
                     <p id="mem_birthDate_test" style="margin-bottom: 15px;"></p>
                     <input type="hidden" id="mem_birthDate_hidden" value="">
                  </div>
                  <div>
                     <p style="margin-bottom: 15px;">성 별</p>
                  </div>
                  <div class="row uniform">
                     <div class="4u 12u$(small)">
                        <input type="radio" id="priority-low" name="mem_gender" 
                           value="남성" ${loginUser.mem_gender eq '남성' ? 'checked':'' } disabled > <label for="priority-low">남&nbsp&nbsp&nbsp&nbsp성</label>
                     </div>
                     <div class="4u 12u$(small)">
                        <input type="radio" id="priority-normal" name="mem_gender"
                           value="여성" ${loginUser.mem_gender eq '여성' ? 'checked':'' } disabled > <label for="priority-normal">여&nbsp&nbsp&nbsp&nbsp성</label>
                     </div>
                  </div>
               </form>
            </div>
            <div class="card-footer">
               <div class="row uniform">
                  <div id="nullform"></div>
                  <div class="2u$ 12u$(small)" style="position: relative; left: 100px;">
                     <span class="button special" id="modify">수&nbsp;&nbsp;&nbsp;&nbsp;정</span>
                  </div>
                  <div class="2u$ 12u$(small)" style="position: relative; left: 280px;">
                     <span class="button alt"
                        onclick="self.location='<%=request.getContextPath()%>/mypage/myinfo'">취&nbsp&nbsp&nbsp&nbsp소</span>
                  </div>
               </div>
            </div>
         </div>



         </section>



      </div>

      <br> <br> <br>


      <script>
      <%--지역 변경 --%>
      $(document).ready(function(){
         
         $.ajax({      
            data:JSON.stringify({"local_no": $("#mem_local1 option:selected").val()}),
            contentType:"application/JSON",
            type: "POST",
            url: "<%=request.getContextPath()%>/club/sublocal",
            success: function(data){
                  $("#mem_local2").html("");
                  $("#mem_local2").append("<option value='' value='fail' selected disabled>- 시, 구 -</option>");
                  for(var sub of data){
                     $("#mem_local2").append("<option value="+sub.local_sub_name+" >"+ sub.local_sub_name +"</option>");
                  }
                  $("#mem_local2").val($("#sublocal").val()).prop("selected", true);
               },
            error:function(){
               alert("서버오류입니다.");
            }
         });
      });
      
      $("#mem_local1").change(function(){
         
         $.ajax({      
            data:JSON.stringify({"local_no":$(this).val()}),
            contentType:"application/JSON",
            type: "POST",
            url: "<%=request.getContextPath()%>/club/sublocal",
            success: function(data){
                  $("#mem_local2").html("");
                  $("#mem_local2").append("<option value='' value='fail' selected disabled>- 시, 구 -</option>");
                  for(var sub of data){
                     $("#mem_local2").append("<option>"+ sub.local_sub_name +"</option>");
                  }
               },
            error:function(){
               alert("서버오류입니다.");
            }
         });
      });
   
   </script>
   
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
   
      <%--체크박스--%>
      $("input:radio[id='mem_gender']").is(":checked") == true;
      $("input:checkbox[id='mem_id_check']").is(":checked") == true;
      $("input:checkbox[id='mem_name_check']").is(":checked") == true;
      $("input:checkbox[id='mem_phone_check']").is(":checked") == true;
   
      <%--유효성 검사--%>
   
      $(document).ready(function() {
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
            $("#mem_nick_check_hidden").val("");
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
      function chkPhone(콜){
         var phone2= RegExp(/^[0-9]+$/);
         return phone2.test(콜);
      }
      function chkBirthDate(birthDate){
         var birthDate2= RegExp(/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/);
         return birthDate2.test(birthDate);
      }
   
      
      <%--회원가입 버튼 활성화 --%>
      $("#modify").click(function(){
         
         var pwd1 = $("#mem_pwd_hidden").val();
         var pwd2= $("#mem_pwd_check_hidden").val();
         
         var nick1 = $("#mem_nick_hidden").val();
         var nick2 = $("#mem_nick_check_hidden").val();
         var phone1 = $("#mem_phone_hidden").val();
         var phone2 = mem_phone1.value;
         var local1 = $("#mem_local1 option:selected").text();
         var local2 = mem_local2.value;
         
         
         var pwd = mem_pwd.value;
      
         var nick = mem_nick.value;
         var phone = mem_phone1.value+"-"+mem_phone2.value+"-"+mem_phone3.value;
         var local = $("#mem_local1 option:selected").text() +"_"+mem_local2.value;
         
         
         var gender = $("input:radio[name='mem_gender']:checked").val();
         
         if(confirm("개인정보 수정을 하시겠습니까?")){
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
               var name_check = 3;
            }
            
            if(pwd1 == 'fail'){
                           
               alert("비밀번호를 확인 해주세요. ");
            }
            else if(nick2.length < 2){
               alert("닉네임을 확인 해주세요.")
            }
            else{
               
               $.ajax({
                  url:"<%=request.getContextPath()%>/common/modify",
                  type:"POST",
                  data:{
                     mem_id:$("#mem_id").val(),
                       mem_pwd:pwd,
                       mem_nick:nick,
                       mem_phone:phone,
                       mem_local:local,
                       mem_phone_check:phone_check,
                       mem_id_check:id_check,
                       mem_name_check:name_check
                       },
                  success:function(){
                     location.href="<%=request.getContextPath()%>/mypage/myinfo";
                     alert("개인정보 수정을 완료했습니다.")
                  },
                  error:function(){
                     alert("서버에 오류가 발생하였습니다. 다시 시도하세요.");
                  }
               });
               
            }
         }
            
      });
      
      function myPage(url) {
         self.location.href="<%=request.getContextPath()%>/mypage/"+url;
      }
      
      $('.subButton').click(function(){
            $('.subButton').css("background","");
            $(this).css("background","linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0) 55%,rgba(0,0,0,0) 61%,rgba(0,0,0,0.16) 100%)");
         });
      
   </script>
</body>