<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">
<!-- jQuery -->
<script
   src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>
<style>

</style>

</head>
<body>
   <!-- Menu -->
<c:set var="noticeList" value="${noticeList.noticeList }"/>   
<c:set var="recommendClubList" value="${recommendClubList.recommendClubList }"/>   
<c:set var="recentClubList" value="${recentClubList.recentClubList }"/>   
   <!-- Main -->
   <section id="main" class="wrapper" style="height:1050px;">
      <div class="inner">


         <!-- Elements -->
      
            <div class ="row"id="createClub"  style="margin:0; width:100%;height:300px;">
               <div style="cursor:pointer;width:50%;height:300px;padding:0;" onclick="OpenWindow('<%=request.getContextPath() %>/club/regist', '동호회 생성', 850, 900)">
                   <img src="<%=request.getContextPath()%>/resources/img/createClub.jpg">
               </div>
               <div onclick="self.location='<%=request.getContextPath() %>/club/list'" style="cursor:pointer;width:50%;height:300px;padding:0;margin-left:-1px;">
                  <img src="<%=request.getContextPath()%>/resources/img/searchClub.jpg">
               </div>
               
            </div>
            <div class="row" style="margin-top:10px;width:100%;">
               <div id="notice" style="width:50%; height:400px;margin-left:10px;margin-top:10px;">
                  <div class="row">
                     <h3>공지 사항</h3><div style="width:320px;"></div><h5 style="cursor:pointer;margin-top:10px;color:gray;" onclick="self.location='<%=request.getContextPath()%>/notice/list'">더보기</h5>
                  </div>
                  
                  <table style="margin-top:-10px;">
                     <tbody>
                        <c:if test="${empty noticeList }">
                           <tr><td>게시글이 없습니다.</td></tr>
                        </c:if>
                        <c:if test="${!empty noticeList }">
                           <c:forEach var="notice" items="${noticeList}">
                              <tr>
                                 <td style="font-weight:bold;cursor:pointer; text-overflow: ellipsis; overflow: hidden;display: block;width:250px;white-space:nowrap;" onclick="self.location='<%=request.getContextPath()%>/notice/detail?not_no=${notice.not_no }&page=1&mem_nick=${loginUser.mem_nick}'">${notice.not_title }</td>
                                 <td><fmt:formatDate value="${notice.not_regDate }" pattern="yyyy-MM-dd"/></td>
                              </tr>
                           </c:forEach>
                        </c:if>
                     </tbody>
                  </table>
               </div>
               <div id="row recommend" style="width:48%; height:400px;margin-top:10px;">
                  <div class="row">
                     <h3>추천 동호회</h3>
                  </div>
                  <c:if test="${empty recommendClubList }">
                  <div style="background:#f5f5f5;margin-top:-10px;height:55px;border-top:1px solid #cfcfcf; border-bottom:1px solid #cfcfcf;">
                     <p style="text-align:center;margin-top:15px;font-size:1.1em; font-weight:bold;">추천 동호회가 없습니다.</p>
                  </div>
                  </c:if>
                  <c:if test="${!empty recommendClubList }">
                     <c:forEach var="recommend" items="${recommendClubList }">
                        <div class="row" style="border-bottom:1px solid #cfcfcf;margin-top:15px;margin-left:20px;" >
                           <div class="image" >
                             <img style="width:80px;height:80px;"
								<c:if test="${recommend.attachThum_no > 0}">
									src="<%=request.getContextPath() %>/attach/img?attach_no=${recommend.attachThum_no}"
								</c:if>
								<c:if test="${recommend.attachThum_no <= 0}">
									src="<%=request.getContextPath()%>/resources/img/logo.png"
								</c:if> />
                           </div>
                           <div style="width:200px;">
                              <p style="font-size:1.3em;margin-bottom:0;font-weight:bold;margin-top:15px;cursor:pointer; padding:0;" onclick="OpenWindow('detail?club_no=${recommend.club_no}','','825','650');">${recommend.club_name }</p>
                           </div>
                           <div style="margin-top:20px;">
                              <p ><fmt:formatDate value="${recommend.club_regDate }" pattern="yyyy-MM-dd"/></p>
                           </div>
                        </div>                        
                     </c:forEach>
                  </c:if>
               </div>
            </div>
            <div id="recent" style="width:100%;height:300px;">
               <div class="row newClub" >
                     <h3>신규&nbsp동호회</h3>
               </div>
               <ul style="width:100%;list-style:none; padding:0; margin:0;">
                  <c:forEach var="recentClub" items="${recentClubList}">
                     <li style="width:25%;font-weight:bold;border-left:1.5px solid gray; float:left; padding:0;font-size:1em;margin-top:10px;margin-left:10px;cursor:pointer;text-overflow: ellipsis; overflow: hidden;display: block;" onclick="OpenWindow('detail?club_no=${recentClub.club_no}','','825','650');">
                        &nbsp&nbsp&nbsp
                        ${recentClub.club_name}
                     </li>
                     <li style="width:21%;float:left; padding:0;font-size:1em;margin-top:10px;margin-left:10px;">
                        <fmt:formatDate value="${recentClub.club_regDate }" pattern="yyyy-MM-dd"/>
                     </li>
                  </c:forEach>
               </ul>
            </div>
      </div>
   </section>
   <footer id="footer" style="height:300px;padding-top:60px;">
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
   <!-- AdminLTE App -->
   <script
      src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>
   

      <!-- Bootstrap 4 -->
   <script
      src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
      
   <script src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
   <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
   <script src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
    
   <!-- date-range-picker -->
   <script src="<%=request.getContextPath()%>/resources/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>
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
</body>
</html>