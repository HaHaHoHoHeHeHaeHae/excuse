<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

<head>
<meta charset="utf-8">
<title>회원관리</title>

</head>

<body class="subpage">
   <div style="margin-left:50px;margin-top:-88px; width:150px; border-bottom:1px solid gray;">
      <h1 style="margin:0; color:#25a1c3;">회원 관리</h1>
   </div>
   <!-- Main -->
   <section id="main" class="wrapper">
      <div class="inner" style="margin-left: -3px;">
         <!-- Elements -->
         
         <div class="row" style="margin-left:40%; margin-top:-100px;">
               <div>
                  <select name="searchType"  id="searchType" style="height:45px;margin-top:10px; ">
                     <option value="kn" ${pageMaker.cri.searchType eq 'kn' ? 'selected':'' }>전체</option>
                     <option value="k" ${pageMaker.cri.searchType eq 'k' ? 'selected':'' }>닉네임</option>
                     <option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이름</option>
                  </select> 
               </div>
               <div style="padding-left:10px;">
                  <input name="keyword" type="text" class="form-control" style="height:45px;width:280px; margin-top:10px;" placeholder="검색어를 입력하세요">
               </div>
               <ul class="actions" >
                     <li><a id="searchBtn" href="#" class="btn btn-block btn-secondary" style="height:45px; margin-top:10px; margin-left:15px; text-decoration:none; padding-top:10px;"  onclick="onSearch();">검색</a></li>
                  </ul>
         </div>
         <div class="row" style="margin-left:560px; "  >
                           <div name="aliType"  id="aliType">
                           <button style="background:#E7EDF0; color:gray; font-size:0.8em; width:50px;margin-left:7px; margin-right:5px;" type="button" id="ali1" name="ali1" onclick="ali1();" >
                           <i style="margin-left:-25px;" class="fas fa-sort-numeric-down-alt"></i>오래된순</button> 
                           <button style="background:#E7EDF0; color:gray; font-size:0.8em; width:50px;" type="button" id="ali2" name="ali2" onclick="ali2();"><i style="margin-left:-23px;"
                  class="fas fa-sort-numeric-down"></i>최신순</button>
                           </div>
                           
                        
                           <select name="sortType"  id="sortType" style="width:100px;  margin-left:20px; height:43px; text-align:center; padding-left:-100px;">
                              <option value="sort0">전체</option>
                              <option value="sort1">활성멤버</option>
                              <option value="sort2">비활성멤버</option>
                           </select>
                        </div>
         
         <div class="12u 12u$" style="height: 500px;">
            <div style="position: relative; margin-top: 30px;margin-left:30px;">
               <iframe id="if_list3" name="if_list3" frameborder="0" scrolling="0"
                  src="<%=request.getContextPath()%>/manage/member/listForm"
                  style="position: absolute; top: 0px; left: 0px; bottom: 0px; height: 660px; width: 100%; border: 0px;">
               </iframe>
            </div>
         </div>
         
      </div>
   </section>


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
   
   //멤버검색
    function onSearch(){
         
         var searchType=$('select#searchType').val();
         var keyword=$('input[name="keyword"]').val();
         
         
         searchList(searchType,keyword);
      }
    
   function searchList(searchType,keyword){
      document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/member/listForm?searchType="+ searchType + "&keyword=" + keyword;
      }
   
   
   
$("#sortType").change(function(){
    var sortVal =  $(this).val();
    var searchType=$('select#searchType').val();
   var keyword=$('input[name="keyword"]').val();
   
       /* alert(sortVal);
       alert(searchType);
       alert(keyword); */
       
       if(sortVal=='sort0'){
          document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/member/listForm?sort=0&searchType="+searchType+"&keyword="+keyword;
       }else if(sortVal=='sort1'){
          document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/member/listForm?sort=1&searchType="+searchType+"&keyword="+keyword;
       }else{
          document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/member/listForm?sort=2&searchType="+searchType+"&keyword="+keyword;
       }
});

   

   
   //회원 가입날짜 정렬
   $("#ali1").click(function(){
      
      var searchType=$('select#searchType').val();
      var keyword=$('input[name="keyword"]').val();
      var sortVal=$('select#sortType').val();
      
      if(sortVal=='sort0'){
         var sortVal ="0";
      }
      if(sortVal=='sort1'){
         var sortVal ="1";
      }
      if(sortVal=='sort2'){
         var sortVal ="2";
      }
      
      
      
      document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/member/listForm?alignment=1&sort="+sortVal+"&searchType="+searchType+"&keyword="+keyword;
   });
   
   
       $("#ali2").click(function(){
          
      var searchType=$('select#searchType').val();
      var keyword=$('input[name="keyword"]').val();
      var sortVal=$('select#sortType').val();
      
      if(sortVal=='sort0'){
         var sortVal ="0";
      }
      if(sortVal=='sort1'){
         var sortVal ="1";
      }
      if(sortVal=='sort2'){
         var sortVal ="2";
      }
      
       
      
      document.getElementById("if_list3").src="<%=request.getContextPath()%>/manage/member/listForm?alignment=2&sort="+sortVal+"&searchType="+searchType+"&keyword="+keyword;
       });
   
   </script>

</body>