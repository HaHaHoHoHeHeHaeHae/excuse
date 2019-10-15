<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="replyList" value="${dataMap.replyList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.cri }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 개인정보수정</title>


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
		<div id="all_div">
		<div id="section_div" style="postion: relative; left: 5px; top: 18px; width: 1570px;">

			<!-- Main -->
			<section id="main" class="wrapper"> <!-- Menu --> <!-- Elements -->
			<div class="row">
				<h2 id="elements">마이페이지 - 내가 쓴 댓글</h2>
				<!-- <div class="nav nav-pills ml-auto p-2">
							<span class="button small" onclick="#">글 쓰기</span>
						</div> -->
			</div>
			<div class="card" style="position: relative; width: 1200px; height: 625px; left: 30px;">
				<div class="table-wrapper" >
            <table >
               <tr>
				  <th class="text-center" >번호</th>
                  <th class="text-center" >동호회명</th>
                  <th class="text-center" >댓글 내용</th>
                  <th class="text-center" >등록일</th>
               </tr>
               <c:if test="${empty replyList }">
                  <tr>
                     <td colspan="5" class="text-center">
                     <strong>등록한 댓글이 없습니다.</strong></td>
                  </tr>
               </c:if>
               <c:if test="${!empty replyList }">
                  <c:forEach items="${replyList }" var="reply" varStatus="status" >
                     <tr>
                     	<td class="text-center" style="height: 55px; width: 67px;">${(cri.page-1)*10+status.count }</td>
                        <td class="text-center" style="height: 55px; width: 220px;">
                      			<a href="#" onclick="OpenWindow('<%=request.getContextPath()%>/club/detail?club_no=${reply.club_no }','','825','650')">
											${reply.club_name }
										</a>
                        </td>
                        <td class="text-center" style="height: 55px; width: 723px;"><div style="height: 24px; width: 680px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                        	<a href="#" onclick="OpenWindow('<%=request.getContextPath()%>/club/detail?club_no=${reply.club_no }','','825','650')">
											${reply.reply_content }
										</a>
                        </div></td>
                        <td class="text-center" style="height: 55px; width: 190px;"><fmt:formatDate
                              value="${reply.reply_regDate }" pattern="yyyy-MM-dd" /></td>
                     </tr>
                  </c:forEach>
               </c:if>
            </table>
         </div>
			
				
				
			</div>
	
		<!-- pagination Start-->
			<div class="card-body">
				<div class="pagination justify-content-center m-0">
					<ul class="pagination ">
						<li class="page-item"><a class="page-link"
							href="myreply${pageMaker.makeQuery(1)}" style="text-decoration: none">&lt;&lt;</a>
						<li class="page-item"><a class="page-link"
							href="myreply<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
							style="text-decoration: none">&lt;</a></li>
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="pageNum">
							<li
								class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
								<a class="page-link" href="myreply${pageMaker.makeQuery(pageNum) }"
								style="text-decoration: none">${pageNum } </a>
							</li>
						</c:forEach>
	
						<li class="page-item"><a class="page-link"
							href="myreply
										<c:if test="${pageMaker.next }">
											${pageMaker.makeQuery(pageMaker.endPage+1) }
										</c:if>
										<c:if test="${!pageMaker.next }">
											${pageMaker.makeQuery(pageMaker.cri.page) }
										</c:if>
									"
							style="text-decoration: none">&gt;</a></li>
	
						<li class="page-item"><a class="page-link"
							href="myreply${pageMaker.makeQuery(pageMaker.realEndPage) }"
							style="text-decoration: none"> &gt;&gt; </a></li>
					</ul>
				</div>
			</div>

			</section>



		</div>
</div>
		<br> <br> <br>

		
		<script>
			function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
				winleft = (screen.width - WinWidth) /2;
				wintop = (screen.height - WinHeight) /2;
				var win = window.open(UrlStr, WinTitle, "scrollbars=no, width="+WinWidth+",height="+WinHeight+",top="+wintop+",left="+winleft+", resizable=no, status=yes");
				win.focus();
			}
			
			
			function myPage(url) {
				self.location.href="<%=request.getContextPath()%>/mypage/"+url;
			}
			
			$('.subButton').click(function(){
			      $('.subButton').css("background","");
			      $(this).css("background","linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0) 55%,rgba(0,0,0,0) 61%,rgba(0,0,0,0.16) 100%)");
			   });
			
		</script>
	
</body>