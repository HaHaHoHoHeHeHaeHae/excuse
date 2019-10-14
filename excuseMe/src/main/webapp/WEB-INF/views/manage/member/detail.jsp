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
      <div>
         <div class="card">
            <div class="text-center">
               <div class="card-header" style="background:#6499b0;margin-top:-50px;">
                  <h3 style="margin-top:10px; margin-bottom:5px; color:white;"> ${member.mem_name }님의&nbsp;회원정보</h3>
               </div><!--end card-header  --> 
               <div>
               <div class="card-body" style="background:#f2f9fa;">
                  <div style="margin-left:40px;">
                     <form role="form" method="post" action="detail" name="detailForm">
                        <div class="form-group row" style="border-bottom:1px solid #c8d5db;height:30px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label" style="margin-top:3px;">이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</label>
                            </div>
                            <div>
                               <p >${member.mem_name }</p>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-top:5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label"style="margin-top:3px;">아&nbsp&nbsp이&nbsp&nbsp디</label>
                            </div>
                            <div>
                               <p id="mem_id" name="mem_id">${member.mem_id }</p>
                            </div>
                        </div>
                        
                        <div class="form-group row" style="margin-top:5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label" style="margin-top:3px;">상&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp태</label>
                            </div>
                            <div>
                               
                                  <c:if test= "${member.mem_status==0 }" ><p id="mem_status" name="mem_status" style="color:#cf271b;">비활성</p></c:if>
                                  <c:if test= "${member.mem_status==1 }" ><p id="mem_status" name="mem_status" style="color:#2b83e0;">활성</p></c:if>
                            </div>
                        </div>
                        
                        <div class="form-group row" style="margin-top:5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                           <div>
                              <label class="col-sm-3 control-label" style="margin-top:3px;">닉&nbsp&nbsp네&nbsp&nbsp임</label>
                           </div>
                           <div>
                              <p>${member.mem_nick }</p>
                           </div>                       
                        </div>   
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label" style="margin-top:3px;">성&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp별</label>
                            </div>
                            <div>
                               <p>${member.mem_gender }</p>
                            </div>
                        </div>   
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label" style="margin-top:3px;">생년월일</label>
                            </div>
                            <div>
                               <p><fmt:formatDate value="${member.mem_birthDate }" pattern="yyyy-MM-dd"/></p>
                            </div>
                        </div>   
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label" style="margin-top:3px;">가입날짜</label>
                            </div>
                            <div>
                               <p><fmt:formatDate value="${member.mem_regDate }" pattern="yyyy-MM-dd"/></p>
                            </div>                         
                        </div>   
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                            <div>
                               <label class="col-sm-3 control-label" style="margin-top:3px;">지&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp역</label>
                            </div>
                            <div>
                               <p>${member.mem_local }</p>
                            </div>
                        </div>   
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                           <div>
                              <label class="col-sm-3 control-label" style="margin-top:3px;">연&nbsp&nbsp락&nbsp&nbsp처</label>
                           </div>
                           <div>
                              <p>${member.mem_phone }</p>
                           </div>
                        </div>   
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                           <div>
                              <label class="col-sm-3 control-label" style="margin-top:3px;">이&nbsp&nbsp&nbsp&nbsp름 공개 여부</label>
                           </div>
                           <div>
                               <c:if test= "${member.mem_name_check==0 }" ><p style="color:#2b83e0;">공개</p></c:if>
                              <c:if test= "${member.mem_name_check==1 }" ><p style="color:#cf271b;">비공개</p></c:if>                              
                           </div>
                        </div>
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                           <div>
                              <label class="col-sm-3 control-label" style="margin-top:3px;">아이디 공개 여부</label>
                           </div>
                           <div>
                               <c:if test= "${member.mem_id_check==0 }" ><p style="color:#2b83e0;">공개</p></c:if>
                                  <c:if test= "${member.mem_id_check==1 }" ><p style="color:#cf271b;">비공개</p></c:if>                      
                           </div>                                               
                        </div>   
                        
                        <div class="form-group row" style="margin-top: 5px;border-bottom:1px solid #c8d5db;height:34px;width:330px;">
                           <div>
                              <label class="col-sm-3 control-label" style="margin-top:3px;">연락처 공개 여부</label>
                           </div>
                           <div>
                               <c:if test= "${member.mem_phone_check==0 }" ><p style="color:#2b83e0;">공개</p></c:if>
                              <c:if test= "${member.mem_phone_check==1 }" ><p style="color:#cf271b;">비공개</p></c:if>
                           </div> 
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div><!--end card-body  -->
      </div>
      <div class="text-center" style="margin-left:10px; margin-top:10px; margin-bottom:30px;">
          <button type="button" style="width:100px;"class="button special small" id="closeBtn" onclick="OpenWindow('replyList?mem_id=${member.mem_id }&mem_name=${member.mem_name }','','650','750');">댓글내역</button>
          &nbsp; &nbsp; &nbsp;
          <button type="button" style="width:100px;"class="button special small" id="statusBtn" onclick="StatusStop();">
             <c:if test= "${member.mem_status==1 }" >활동중지</c:if>
            <c:if test= "${member.mem_status==0 }" >활동중지 해제</c:if></button>
         &nbsp; &nbsp; &nbsp;
         <button type="button" style="width:100px;"class="button special small" id="closeBtn" onclick="CloseWindow();">닫기</button>
         
      </div><!--end card-footer  -->
   </div><!-- end card -->            


<script>
/*    window.onload=function(){
      
      $('#contentDiv').attr("contentEditable",false);
      $(':radio:not(:checked)').attr('disabled',true);
   } */
   function CloseWindow(){
      window.close();
   
   }
   
   </script>
   
   <script>
   function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
      winleft = (screen.width - WinWidth) / 2;
      wintop = (screen.height - WinHeight) / 2;
      var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
                            +", height="+ WinHeight +", top="+ wintop +", left=" 
                            + winleft + ", resizable=no, status=yes"  );
       win.focus() ; 
   }
   
   
   function StatusStop(){
      var id= $("#mem_id").html();
      var status=$("#mem_status").html();

      if(status=='비활성'){
         $.ajax({
            url:"<%=request.getContextPath() %>/manage/member/status",
            type:"POST",
            data:{mem_id:id},
            success:function(result){
               if(result=="SUCCESS"){
                  alert("활동중지 해제되었습니다.");
                  location.reload();
               }else{
                  alert("error");
               }
            },
            error:function(){
               alert('실패했습니다.');
            },
            
         }); 
      
      }else{
         $.ajax({
            url:"<%=request.getContextPath() %>/manage/member/stopstatus",
            type:"POST",
            data:{mem_id:id},
            success:function(result){
               if(result=="SUCCESS"){
                  alert("활동중지 되었습니다.");
                  location.reload();
               }else{
                  alert("error");
               }
            },
            error:function(){
               alert('실패했습니다.');
            },
            
         }); 
         }   
   }
   
   function reply(){
      var id= $("mem_id").html();
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
