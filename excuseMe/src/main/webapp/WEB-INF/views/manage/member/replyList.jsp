<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="replyList" value="${dataMap.replyList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />



<head>
<meta charset="utf-8">
<title>댓글 관리</title>
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
</head>

<body class="subpage">
   <div class="text-center">
               <div class="card-header" style="background:#6499b0;margin-top:-50px;">
                  <h3 style="margin-top:10px; margin-bottom:5px; color:white;"> ${mem_name }님의 댓글 목록</h3>
               </div><!--end card-header  --> 
   </div>
   <!-- Main -->
   <section id="main" class="wrapper">
      <div class="card-body">
         <!-- Table -->
         <div class="table-wrapper" style="margin-left: 5px;margin-top:-50px;">
            <table>
               <tr>
                  <th class="text-center">동호회명</th>
                  <th class="text-center" style="width: 150px;">댓글 내용</th>
                  <th class="text-center">등록일</th>
               </tr>
               <c:if test="${empty replyList }">
                  <tr>
                     <td colspan="5" class="text-center">
                     <strong>등록한 댓글이 없습니다.</strong></td>
                  </tr>
               </c:if>
               <c:if test="${!empty replyList }">
                  <c:forEach items="${replyList }" var="reply">
                     <tr>
                        <td class="text-center">${reply.club_name }</td>
                        <td class="text-center">${reply.reply_content }</td>
                        <td class="text-center"><fmt:formatDate
                              value="${reply.reply_regDate }" pattern="yyyy-MM-dd" /></td>
                     </tr>
                  </c:forEach>
               </c:if>
            </table>
         </div>
      </div>
      
      <div class="text-center" style="float:right;margin-right:40px;"  >													
				<ul class="pagination ">
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="replyList${pageMaker.makeQuery(1)}">&lt;&lt;</a>
					</li>
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="replyList
							<c:if test="${pageMaker.prev }">
								${pageMaker.makeQuery(pageMaker.startPage-1) }
							</c:if>
						">&lt;</a>
					</li>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link"style="text-decoration:none;" href="replyList${pageMaker.makeQuery(pageNum) }" >
								${pageNum }
							</a>
						</li>
					</c:forEach>	
	
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="replyList
							<c:if test="${pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page+1) }
							</c:if>
							<c:if test="${!pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page) }
							</c:if>
						">&gt;</a>
					</li>			
	
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="replyList${pageMaker.makeQuery(pageMaker.realEndPage) }">
							&gt;&gt;
						</a>
					</li>					
				</ul>
			</div>
			 <button type="button" style="margin-left:150px;"class="button special small" id="closeBtn" onclick="CloseWindow();">닫기</button>
   </section>

   <script>
       window.onload=function(){
         $('a[data-name="member"]').on('click',function(event){
               event.preventDefault();
         });
  }
      
       function CloseWindow(){
    	      window.close();
    	   
    	   }
    	   
    
   </script>



</body>