
<style>
div.top {
   height: 100px;
}
</style>


<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<title>동호회 리스트 창</title>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cateList" value="${dataMap.cateList }" />
<c:set var="localList" value="${dataMap.localList }" />
<c:set var="recommendList" value="${dataMap.recommendList }" />
<c:set var="member" value="${dataMap.member }" />
<c:set var="split" value="${dataMap.split }" />
<c:set var="split_sub" value="${dataMap.split_sub }" />



<!-- Font Awesome -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/templated/assets/css/font-awesome.min.css">

<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Theme style -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css">

<!-- Google Font: Source Sans Pro -->
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
   rel="stylesheet">
<style>

@media screen and (max-width: 1920px){
   body{
      font-size:1.05em;
   }
   
}
@media screen and (max-width: 1680px){
   body{
      font-size:1.2em;
   }
   
}
</style>
</head>

<body class="subpage" style="overflow-x: hidden;">
   <!-- Main -->
   <div class="top"></div>
   <section id="main" class="wrapper" style="position: relative;">
      <div class="club_inner"
         style="margin: 0 auto; width: 1126.66px; position: absolute; left: 50%; transform: translateX(-50%);margin-top:-90px;">

         <!-- searchClubList Start-->
         <header class="align-center"
            style="position: absolute; width: 1126.66px;">
            <h1>동호회 찾기</h1>
            <p style="font-size:1.1em;">원하는 동호회를 검색해보세요.</p>
         </header>
         
         <section class="search" style="background:#e8f4ff; border-right: 2px solid #bfced9;border-bottom: 2px solid #bfced9;border-radius:8px;margin-top: 110px;">
            <div class="search1" style="padding-top:40px;">
               <div class="form-group" >
                  <div class="row" style=" margin-left: 15%; height: 40px; width: 1020px;">
                     <div class="label_name"
                        style="margin-right: 10px; margin-top:4px;">
                        <strong >카테고리</strong>
                     </div>
                     <div class="select">
                        <!-- category1 -->
                        <select id="category" class="form-control"
                           style="width: 250px;">
                           <option value="0">- 전체 보기 -</option>

                           <c:forEach var="cate1" items="${cateList}">
                              <c:if test="${!empty cateList }">
                                 <option value="${cate1.cate_no }"
                                    ${split[0] eq cate1.cate_name ? 'selected':''}>${cate1.cate_name }</option>
                              </c:if>
                           </c:forEach>

                        </select>
                     </div>
                <div class="select">
                        <input type="hidden" id="selected_sub_category"
                           value="${split[1]}" />

                        <!-- category2 -->
                        <select id="subCategory" class="form-control"
                           style="width: 250px;">
                           <option selected>- 전체 보기 -</option>
                        </select>
                     </div>
                  </div> 
               </div>
            </div>
            
            <div class="search2" style="height: 50px;">
               <div class="form-group">
                  <div class="row" style=" margin-left: 15%; height: 40px;">
                     <div class="label_name" style="margin-right: 10px;margin-top:4px;">
                        <strong>지&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp역</strong>
                     </div>
                     <div class="select" style="">
                        <select id="local" class="form-control"
                           style="width: 250px;">
                           <option value="0">- 전체 보기 -</option>
                           <c:forEach var="local" items="${localList }">
                              <c:if test="${!empty localList }">
                                 <option value="${local.local_no}"
                                    ${split_sub[0] eq local.local_name ? 'selected':''}>${local.local_name }</option>
                              </c:if>
                           </c:forEach>
                        </select>
                     </div>
                     <div class="label">
                        <div class="select">
                           <input type="hidden" id="selected_sub_local" value="${split_sub[1]}" /> 
                           <select id="subLocal"
                              class="form-control" style="width: 250px; ">
                              <option selected>- 전체 보기 -</option>
                           </select>
                        </div>
                     </div>
                  </div>        
               </div>
            </div>
            <div class="search3" style="height: 60px;">
                 <div class="row" style=" margin-left: 15%; height: 40px;">
                   <div class="label_name" style="margin-right: 10px;margin-top:4px;">
                        <strong>동호회명</strong>
                     </div>
                    <div class="select" >
                        <input name="keyword" type="text" class="form-control" placeholder="검색어를 입력하세요." style="background:white;width: 535px;height: 40px;">
                      </div> 
                </div>
            </div>
         <div class="actions" style="height:60px;">
                  <div id="searchBtn" style="margin-left:40%;width:220px; height:45px;border-radius:5px;background:#2BB3D7; text-align:center; vertical-align:middle;cursor:pointer;">
                     <div style="font-size:16px; color:white; dispay:inline-block; line-height:45px;">검&nbsp;&nbsp;색</div>
                </div>
             </div>
         </section>
         <!-- searchClubList End-->

         <!-- clubList Start -->
         <!-- alignment -->
         <section class="alignment"
            style="top: 360px; height: 70px; width: 1126.66px;margin-top:30px;">
            <div class="listTitle" style="float: right;">
               <a data-name="ali" class="btn btn-app" onclick="ali_1();"><i
                  class="fas fa-sort-numeric-down-alt"></i>오래된순</a> <a
                  class="btn btn-app" onclick="ali_0();"><i
                  class="fas fa-sort-numeric-down"></i>최신순</a> <a class="btn btn-app"
                  onclick="ali_5();"><i class="fas fa-users"></i>인원많은순</a> <a
                  class="btn btn-app" onclick="ali_4();"><i class="fas fa-user"></i>인원적은순</a>
               <a class="btn btn-app" onclick="ali_2();"><i
                  class="fas fa-thumbs-up"></i>인기순</a> <a class="btn btn-app"
                  onclick="ali_3();"><i class="fas fa-thumbs-down"></i>비인기순</a>
            </div>
         </section>

         <div class="divLine"
            style="background: #f6755e; margin-top: 10px; margin-bottom: 20px; height: 5px; top: 450px; width: 1126.66px;"></div>

         <div class="clublist"
            style="width: 1126.66px;">
            <c:if test="${empty clubList }">
               <div class="empty" style="text-align: center;">
                  <h2>
                     <b>해당되는 동호회가 없습니다. 다시 검색해주세요</b>
                  </h2>
               </div>
            </c:if>
            <c:forEach var="club" items="${clubList }">
               <c:if test="${!empty clubList }">
                  <div class="clublist_body"
                     style="width: 20%; float: left; border: 1px dashed #bcbcbc; margin: 3px 3px 20px 3px; width: 219px;">
                     <div class="card-body box-profile" style="cursor:pointer;"onclick="OpenWindow('detail?club_no=${club.club_no}','','825','650');"> <%--onclick 붙이고 --%>
                        <div class="text-center">
                           <img class="profile-user-img img-fluid img-circle" id="thum" style="width: 100px; height: 100px;"
                             <c:if test="${club.attachThum_no > 0}">
                        src="<%=request.getContextPath()%>/attach/img?attach_no=${club.attachThum_no}"
                     </c:if>
                     <c:if test="${club.attachThum_no <= 0}">
                        src="<%=request.getContextPath()%>/resources/img/logo.png"
                     </c:if> >
                              
                        </div>

                        <h3 class="profile-username text-center"
                           style="position: relative; width: 190px; overflow: hidden; height: 31px; text-align: center; left: -5px;">${club.club_name }</h3>
                       
                        <ul class="list-group list-group-unbordered mb-3">
                           <li class="list-group-item text-center"
                              style="height: 60px; width: 198px; left: -10px;"><b
                              id="btag"> <i class="fas fa-user-alt"></i>&nbsp;&nbsp;${club.joincnt }
                                 &nbsp;&nbsp; <i class="far fa-thumbs-up"></i>&nbsp;&nbsp;${club.upcnt }
                                 &nbsp;&nbsp; <i class="fas fa-thumbs-down"></i>&nbsp;&nbsp;${club.downcnt }
                           </b></li>
                        </ul>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
            
     
         </div>
         <section class="pagination" style="width: 1126.66px;height: 68px;margin-left:35%">
       <div style="width:500px;">
               <ul class="pagination ">
                     <li class="page-item">
                        <a class="page-link" href="list${pageMaker.makeQuery(1)}" style="text-decoration: none">&lt;&lt;</a>
                        <li class="page-item"><a class="page-link" href="list<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>" style="text-decoration: none">&lt;</a></li>
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                  <li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
                     <a class="page-link" href="list${pageMaker.makeQuery(pageNum) }"
                     style="text-decoration: none">${pageNum } </a>
                  </li>
               </c:forEach>

               <li class="page-item"><a class="page-link"
                  href="list<c:if test="${pageMaker.next }">${pageMaker.makeQuery(pageMaker.cri.page+1) }</c:if><c:if test="${!pageMaker.next }">${pageMaker.makeQuery(pageMaker.cri.page) }</c:if>"style="text-decoration: none">&gt;</a></li>

               <li class="page-item"><a class="page-link"
                  href="list${pageMaker.makeQuery(pageMaker.realEndPage) }"
                  style="text-decoration: none"> &gt;&gt; </a></li>
            </ul>
         </div>
   </section>
   <div class="row" style="height: 50px;width: 1126.66px;position:relative;margin-left:5px;margin-top:00px;border: 1px solid #bfced9;border-radius:8px;">
      <div style="margin-top:15px;border-radius:4px;">
         <span class="info-box-icon bg-danger"  style="width:30px; height:30px;"><i class="far fa-star" style="height:30px;"></i></span>
      </div>
      <div style="margin-top:10px;margin-left:-20px;">
         <span class="info-box-text"
            style="font-size: 18px; height:30px;"><b>&nbsp;${member.mem_nick}&nbsp;&nbsp;님
               지역의 인기많은 동호회 리스트입니다.</b></span>
      
      </div>
   </div>
   <section class="joinclub_wrap1"
      style="margin-top: 20px; width: 1126.66px; ">
      <c:if test="${empty recommendList }">
         <div style="height:100px; background:#f5f5f5;border-top:1px solid #cfcfcf; border-bottom:1px solid #cfcfcf;margin-top:20px;">
            <p style="font-size:1.3em; font-weight:bold;text-align:center;padding-top:30px;">해당 지역에 동호회가 없습니다.</p>
         </div>
      </c:if>
      <c:if test="${!empty recommendList }">
            <c:forEach var="recommend" items="${recommendList }">
         <div class="joinclub card bg-light"
            style="width: 350px; height: 200px; float: left; margin: 0 12.5px 0 12.5px;">
            <div class="joinclub_sub text-muted border-bottom-0">&nbsp;${recommend.cate_name }</div>
            <div class="joinclub_sub_body" style="width: 350px; height: 172px;">
               <div class="sub_body" style="width: 350px; height: 172px;">
                  <div class="1" style="width: 190px; height: 172px; float: left;">
                     <h3 class="1_title" style="text-align: center; padding-top: 8px;">
                        <b>${recommend.club_name }</b>
                     </h3>
                     <ul class="actions vertical small"
                        style="text-align: center; margin-bottom: -10px;">
                        <li><a href="#" data-name="title"
                           onclick="OpenWindow('detail?club_no=${recommend.club_no}','','825','650');"
                           class="button alt icon fa-search">Detail</a></li>
                        <li><a href="#" class="button alt icon fa-check"
                           onclick="onJoin('join','${club.club_no}')">가입하기</a></li>
                     </ul>
                  </div>
                  <div class="2"
                     style="width: 160px; height: 160px; align: center; float: left; padding-right: 20px;">
                     <img class="profile-user-img img-fluid img-circle" id="thum" style="width:140px; height:140px;"
                  <c:if test="${recommend.attachThum_no > 0}">
                     src="<%=request.getContextPath()%>/attach/img?attach_no=${recommend.attachThum_no}"
                  </c:if>
                  <c:if test="${recommend.attachThum_no <= 0}">
                     src="<%=request.getContextPath()%>/resources/img/logo.png"
                  </c:if> >                    

                  </div>
               </div>
            </div>
         </div>
      </c:forEach>
      </c:if>
      
   </section>
   
      </div>
      
   </section>
  
   
   <!-- clubList End -->
   

   <!-- recommendClub Start-->
  

   
   <br>
   <br>
   <!-- recommendClub End-->

   <!-- pagination Start-->
   

 

<footer id="footer" style="position: relative; margin-top: 600px;">
      <div class="inner">
         <h2>고객 센터</h2>
         <ul class="actions">
            <li><span class="icon fa-phone"></span> (042) 254-2462</li>
            <li><span class="icon fa-envelope"></span> excuseMe@gmail.com</li>
            <li><span class="icon fa-map-marker"></span> 대전광역시 서구 둔산서로 17(양호빌딩 6층) </li>
         </ul>
      </div>
      <div class="copyright">
         &copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>. Images <a href="https://unsplash.com">Unsplash</a>.
      </div>
   </footer>



   <%--Script --%>

   <%--    <script
      src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script> --%>
   <script
      src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
   <%-- <script
      src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script> --%>
   <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
   <%-- <script
      src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
 --%>
   <script src="https://code.jquery.com/jquery-3.4.1.js"></script>



   <%--Function --%>
   <script>
   <%--subCategory selectbox에 나오기--%>
    $('#category').change(function() { 
       console.log($(this).val());
        
       if($(this).val()==0){
          $("#subCategory").html("");
          $("#subCategory").append("<option value=''>- 전체 보기 -</option>");
       }
       else{
          $.ajax({
               data:JSON.stringify({ "cate_no":$(this).val() }),
               contentType:"application/JSON",
               type: "POST",
               url: "<%=request.getContextPath()%>/club/subcategory",
               success: function(data) {
                        $("#subCategory").html("");
                        $("#subCategory").append("<option value=''>- 전체 보기 -</option>");
                        for(var sub of data){
                        $("#subCategory").append("<option>"+ sub.cate_sub_name +"</option>");
                        
                        }
               }
            });
       }
      
      });
    
    <%--- 전체 보기 - 로딩 후, 선택된 category값에 맞는 subCategory 나오기--%> 
    $(document).ready(function(){
         /* alert('로딩 완료'); */
         //console.log($(this).val());    
          $.ajax({
               data:JSON.stringify({"cate_no": $("#category option:selected").val() }),
               contentType:"application/JSON",
               type: "POST",
               traditional:true,
               url: "<%=request.getContextPath()%>/club/subcategory",
               success: function(data) {
                        $("#subCategory").html("");
                        $("#subCategory").append("<option value=''>- 전체 보기 -</option>");
                        var selected =$("#selected_sub_category").val();
                      
                        for(var sub of data){
                        $("#subCategory").append("<option>"+ sub.cate_sub_name +"</option>");
                        }
                        $("#subCategory").val(selected).prop("selected",true);
               }
            });
      });
    

    <%--subLocal --%>
   $('#local').change(function(){
      console.log(local);
      
      if($(this).val()==0){
         $("#subLocal").html("");
         $("#subLocal").append("<option value=''>- 전체 보기 -</option>");
      }else{
         $.ajax({
            data:JSON.stringify({"local_no":$(this).val()}),
            contentType:"application/JSON",
            type: "POST",
            url: "<%=request.getContextPath()%>/club/sublocal",
            success: function(data){
                  $("#subLocal").html("");
                  $("#subLocal").append("<option value=''>- 전체 보기 -</option>");
                  for(var sublo of data){
                     $("#subLocal").append("<option>"+ sublo.local_sub_name +"</option>");
            }
            },
            error: function(request,status,error){
               alert("code="+request.status+"message="+request.responseText+"error="+error);
            }
               
         });
      }
   });
   
      
   $(document).ready(function(){
      
      $.ajax({
         data:JSON.stringify({"local_no":$("#local option:selected").val()}),
         contentType:"application/JSON",
         type: "POST",
         url: "<%=request.getContextPath()%>/club/sublocal",
         success: function(data){
               $("#subLocal").html("");
               $("#subLocal").append("<option value=''>- 전체 보기 -</option>");
               var selected = $("#selected_sub_local").val();
               for(var sublo of data){
                  $("#subLocal").append("<option>"+ sublo.local_sub_name +"</option>");
               }
               $("#subLocal").val(selected).prop("selected",true);
         },
         error: function(request,status,error){
            alert("code="+request.status+"message="+request.responseText+"error="+error);
         }   
      });
   })

   <%--search --%>
    $('div#searchBtn').click(function(){
     
      var category = $('select#category option:selected' ).text();
      var local = $('select#local option:selected').text();
      
      var subcategory = $('select#subCategory option:selected').text();
      var sublocal = $('select#subLocal option:selected').text();
      
      var keyword = $('input[name="keyword"]').val(); 

      if(category=="- 전체 보기 -"){
         category = "";
      }
      if(local=="- 전체 보기 -"){
         var local = "";
      }
      if(subcategory=="- 전체 보기 -"){
         var subcategory = "";
      }
      if(sublocal=="- 전체 보기 -"){
         var sublocal = "";
      }

      var TotalCategory = category + "_" + subcategory;
      var TotalLocal = local + "_" + sublocal;

      //alert("토탈카테고리="+TotalCategory+"\n토탈로컬="+TotalLocal);
      
      searchList(TotalCategory,TotalLocal,keyword);
   }); 

   function searchList(TotalCategory,TotalLocal,keyword){
      self.location="<%=request.getContextPath()%>/club/list?category="+TotalCategory+"&local="+TotalLocal+"&keyword="+keyword;
   }
   

   <%--aligment --%>
   function ali_0(){ //0:최신순
      self.location.href="<%=request.getContextPath()%>/club/list?alignment=0";
      //$('a#ali_1').click(function(e){e.preventDefault();window.open(this.href);});
   }
   function ali_1(){ //1:오래된순
      self.location.href="<%=request.getContextPath()%>/club/list?alignment=1";
   }
   function ali_2(){ //2:업 많은 순
      self.location.href="<%=request.getContextPath()%>/club/list?alignment=2";
   }
   function ali_3(){ //3:다운 많은 순
      self.location.href="<%=request.getContextPath()%>/club/list?alignment=3";
   }
   function ali_4(){ //4:회원수 없는 순
      self.location.href="<%=request.getContextPath()%>/club/list?alignment=4";
   }
   function ali_5(){ //5:회원수 많은 순
      self.location.href="<%=request.getContextPath()%>/club/list?alignment=5";
   }
   
   window.onload =function(){
      $('a[data-name="title"]').on('click',function(e){
         e.preventDefault();
      });
   }

   function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
      winleft = (screen.width - WinWidth) /2;
      wintop = (screen.height - WinHeight) /2;
      var win = window.open(UrlStr, WinTitle, "scrollbars=no, width="+WinWidth+",height="+WinHeight+",top="+wintop+",left="+winleft+", resizable=no, status=yes");
      win.focus();
   }
   
   function CloseWindow(){
      if(conform("종료하시겠습니까?")){
         window.close();
      }
   }
   
   function onJoin(joinnexit,club_no) {
      <%-- joinnexit는 스트링으로 join 과 exit을 받아와야한다. --%>
      
      var text = "가입을";
      
      if(joinnexit == "exit")
         text = "탈퇴를";
      
      if(confirm("정말로 " + text + " 하시겠습니까?")){
         
         $.ajax({
            contentType:"application/JSON",
            type: "POST",
            url: "<%=request.getContextPath()%>/" + joinnexit + "club?mem_id=${loginUser.mem_id}&club_no="+club_no,
            cache: false,
            success: function(bool) {s
               console.log(bool);
               if(bool == false)
                  alert("당신은 이미 " + text + " 하셨습니다.");
               else
                  alert(text + " 하셨습니다.");
               location.reload();
            }
         });
         
      }
      
   }
   
</script>

  


</body>