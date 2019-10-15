<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cateList" value="${dataMap.cateList }" />
<c:set var="localList" value="${dataMap.localList }" />


<head>
<meta charset="utf-8">
<title>동호회 목록</title>


</head>
<body class="subpage">

      <!-- Main -->
   <div style="margin-left:50px;margin-top:-88px; width:200px; border-bottom:1px solid gray;">
         <h1 style="margin:0; color:#25a1c3;">동호회 리스트</h1>
   </div>   
   
   <section class="search" style="margin-top:40px;background:#e8f4ff;margin-left:10%; width: 80%;border-right: 2px solid #bfced9;border-bottom: 2px solid #bfced9;border-radius:8px;">
      <div class="row" style="padding-left:19%;padding-top:10px;  ">
         <p style="font-size:1.2em; font-weight: bold;margin-bottom:0; margin-top: 5px; color: #768d99;">카테고리</p>
         
         <div class="select" >
         <!-- category1 -->
            <select id="category" class="form-control" style="width:200px;">
               <option selected>- 전체 보기 -</option>
               <c:forEach var="cate1" items="${cateList}">
                  <c:if test="${!empty cateList }">
                     <option value="${cate1.cate_no }">${cate1.cate_name }</option>
                  </c:if>
               </c:forEach>
            </select>
         </div>
                     
         <div class="label">
            <div class="select">
               <!-- category2 -->
               <select id="subCategory" class="form-control" style="width:200px;">
                  <option selected>- 전체 보기 -</option>
               </select>
            </div>
         </div>
      </div>
      <div class="row" style="padding-left:19%;padding-top:10px; ">
         <p style="font-size:1.2em; font-weight: bold; margin-top: 5px; color: #768d99;">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</p>
         <div class="select">
            <select id="local" class="form-control" style="width:200px;margin-left:-1px;">
               <option selected>- 전체 보기 -</option>
               <c:forEach var="local" items="${localList }">
                  <c:if test="${!empty localList }">
                     <option value="${local.local_no}">${local.local_name }</option>
                  </c:if>
               </c:forEach>
            </select>
         </div>
         <div class="label">
            <div class="select">
               <select id="sublocal" class="form-control" style="width:200px;">
                  <option selected>- 전체 보기 -</option>
               </select>
            </div>
         </div>
      </div>
      <div class="search3" >
         <div class="row" style="margin-left:17%;">
            <div>
               <p style="font-size:1.2em;margin-top:-15px; font-weight: bold; color: #768d99;">동호회명</p>
            </div>
            <div>
               <input name="keyword" type="text" class="form-control" style="background:white;width:421px;height:40px;margin-top:-20px;"placeholder="검색어를 입력하세요">
            </div>
         </div>
         <ul class="actions" style="margin-bottom:20px;">
            <li><a id="searchBtn" href="#" class="button small" style="width:200px; margin-left:170%; " onclick="onSearch();">검색</a></li>
         </ul>
      </div>
   </section>
   <section class="sort">
      <div class="row"  style="margin-left:690px;" >
          <div name="aliType"  id="aliType">
            <button style="background:#E7EDF0; margin-top: 20px; color:gray; font-size:0.8em; width:50px;" type="button" id="ali1" name="ali1" value="#ccf" onclick=a(this)><i
               style="margin-left:-25px;"   class="fas fa-sort-numeric-down-alt"></i>오래된순</button> 
            <button  style="background:#E7EDF0; color:gray; font-size:0.8em; width:50px; margin-top: 20px; margin-left:10px;" type="button" id="ali2" name="ali2" value="#ccf" onclick=a(this)><i
               style="margin-left:-23px;"   class="fas fa-sort-numeric-down"></i>최신순</button>
         
         
         </div> 
         
         
         
         
         
         <select name="sortType"  id="sortType" style="width:100px; text-align:center; margin-left:20px; margin-top:20px; margin-bottom:4px; height:43px;">
                        <option value="sort0">전체</option>
                        <option value="sort1">운영중</option>
                        <option value="sort2">운영중지</option>

                     </select>
      </div>
   </section>

   <div class="inner">


         <!-- Elements -->
      
         <div class="12u 12u$" style="height: 500px;">
            <div style="position: relative; margin-top: 0px;">
               <iframe id="if_list3" name="if_list3" frameborder="0" scrolling="0"
                  src="<%=request.getContextPath()%>/manage/club/clubListTable"
                  style="position: absolute; top: 0px; left: 0px; bottom: 0px; height: 650px; width: 100%; border: 0px;">
               </iframe>
            </div>
         </div>
   </div>
                  
            
                  

         

   

   

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
   winleft = (screen.width - WinWidth) / 2;
   wintop = (screen.height - WinHeight) / 2;
   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
                         +", height="+ WinHeight +", top="+ wintop +", left=" 
                         + winleft + ", resizable=no, status=yes"  );
    win.focus() ; 
}



</script>

<script>
<%--subCategory --%>
$('#category').change(function() { 
     $.ajax({
        data:JSON.stringify({ "cate_no":$(this).val() }),
        contentType:"application/JSON",
        type: "POST",
        url: "<%=request.getContextPath()%>/club/subcategory",
        success: function(data) {
                 $("#subCategory").html("");
                 $("#subCategory").append("<option>- 전체 보기 -</option>");
                 for(var sub of data){
                 $("#subCategory").append("<option>"+ sub.cate_sub_name +"</option>");
                 }
        }
     });
  });

<%--subLocal --%>
$('#local').change(function(){
   
   console.log(local);
   $.ajax({
      data:JSON.stringify({"local_no":$(this).val()}),
      contentType:"application/JSON",
      type: "POST",
      url: "<%=request.getContextPath()%>/club/sublocal",
      success: function(data){
            $("#sublocal").html("");
            $("#sublocal").append("<option>- 전체 보기 -</option>");
            for(var sublo of data){
            $("#sublocal").append("<option>"+ sublo.local_sub_name +"</option>");
      }
      },
      error: function(request,status,error){
         alert("code="+request.status+"message="+request.responseText+"error="+error);
      }
         
   });
});

<%--search --%>
   function onSearch(){
   
   var category = $('select#category option:selected' ).text();
   var local = $('select#local option:selected').text();
   var keyword = $('input[name="keyword"]').val(); 
   
   if(category=="- 전체 보기 -"){
      var category = "";
   }
   if(local=="- 전체 보기 -"){
      var local = "";
   }
   
   searchList(category,local,keyword);
}


function searchList(category,local,keyword){
   document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/club/clubListTable?category="+category+"&local="+local+"&keyword="+keyword;
}


$("#sortType").change(function(){
    var sortVal =  $(this).val();
    var category = $('select#category option:selected').text();
   var local = $('select#local option:selected').text();
   var keyword=$('input[name="keyword"]').val();
   
   if(category=="- 전체 보기 -"){
      var category = "";
   }
   if(local=="- 전체 보기 -"){
      var local = "";
   }
       //alert(sortVal);
       //alert(category);
       //alert(local);
       if(sortVal=='sort1'){
          document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/club/clubListTable?sort=1&category="+category+"&local="+local+"&keyword="+keyword;
       }else if(sortVal=='sort0'){
          document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/club/clubListTable?category="+category+"&local="+local+"&keyword="+keyword;
       }else{
          document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/club/clubListTable?sort=2&category="+category+"&local="+local+"&keyword="+keyword;
       }
});



//동호회 가입 정렬
$('#ali1').click(function(){
   //ali1.style.background=ali1.value;
   var category = $('select#category option:selected').text();
   var local = $('select#local option:selected').text();
   var keyword=$('input[name="keyword"]').val();
   var sortVal= $('select#sortType').val();
   
   if(category=="- 전체 보기 -"){
      var category = "";
   }
   if(local=="- 전체 보기 -"){
      var local = "";
   }
   if(sortVal=="sort0"){
      var sortVal = "0";
   }
   if(sortVal=="sort1"){
      var sortVal = "1";
   }
   if(sortVal=="sort2"){
      var sortVal = "2";
   }
   
   //alert(sortVal);
   /* alert(category);
   alert(local);
   alert(keyword);  */
   document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/club/clubListTable?alignment=1&sort="+sortVal+"&category="+category+"&local="+local+"&keyword="+keyword;
});

$('#ali2').click(function(){
   //ali2.style.background=ali2.value;
    var category = $('select#category option:selected').text();
   var local = $('select#local option:selected').text();
   var keyword=$('input[name="keyword"]').val();
   var sortVal= $('select#sortType').val();
   
   if(category=="- 전체 보기 -"){
      var category = "";
   }
   if(local=="- 전체 보기 -"){
      var local = "";
   }
   if(sortVal=="sort0"){
      var sortVal = "0";
   }
   if(sortVal=="sort1"){
      var sortVal = "1";
   }
   if(sortVal=="sort2"){
      var sortVal = "2";
   }
   
   document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/club/clubListTable?alignment=0&sort="+sortVal+"&category="+category+"&local="+local+"&keyword="+keyword;
});

      
      
   </script>
   
   

   </body>