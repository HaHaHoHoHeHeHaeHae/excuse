<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

</head>
<body class="subpage">


	<!-- Menu -->
	<nav id="menu"></nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">


			<!-- Elements -->
			<div class = "row">
				<h2 id="elements">공지사항</h2>
				<c:if test="${loginUser.mem_nick eq 'admin'}">
				<div class="nav nav-pills ml-auto p-2">
					<span class="button alt small" onclick="self.location='<%=request.getContextPath()%>/notice/list_admin'">모든 공지사항 보기</span>
				</div>
				<div class="nav nav-pills ml-auto p-2">
					<span class="button small" onclick="self.location='<%=request.getContextPath()%>/notice/regist'">글 쓰기</span>
				</div>
				
				</c:if>
			</div>
			<div class="row 200%">
				<div class="12u">
					<!-- Table -->

					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>첨부파일</th>
									<c:if test="${loginUser.mem_nick eq 'admin'}">
										<th>수정</th>
										<th>삭제</th>
									</c:if>
								</tr>
							</thead>

							<tbody>
								
								<c:if test="${empty noticeList}">
									<tr>
										<td></td>
										<td>등록된 게시글이 없습니다.</td>
										<td></td>
										<td></td>
										<td></td>

										<td></td>
										<td></td>
									</tr>
								</c:if>
								<c:if test="${!empty noticeList}">
									<c:forEach var="notice" items="${noticeList }">
										<tr>
											<td>${notice.not_no.substring(1) }</td>
											<td>
												<a href="#" data-name="title" style="white-space:nowrap;text-overflow: ellipsis; overflow: hidden;display: block;width:350px;" onclick="self.location='<%=request.getContextPath()%>/notice/detail?not_no=${notice.not_no }&page=${pageMaker.cri.page }&mem_nick=${loginUser.mem_nick}'">${notice.not_title }</a>
											</td>
											<td><fmt:formatDate value="${notice.not_regDate }" pattern="yyyy-MM-dd"/></td>
											<td>${notice.not_viewCnt }</td>
											<c:if test="${empty notice.attachList}">
												<td>&nbsp</td>
											</c:if>
											<c:if test="${!empty notice.attachList}">
												<td><ion-icon name="document"></ion-icon></td>
											</c:if>
											
											<c:if test="${loginUser.mem_nick eq 'admin'}">
												<td><div style="cursor:pointer;" onclick="self.location='<%=request.getContextPath()%>/notice/modify?not_no=${notice.not_no }'"><ion-icon name="build"  ></ion-icon></div></td>
												<td><div style="cursor:pointer;" onclick="deleteNotice('${notice.not_no}');"><ion-icon name="trash"></ion-icon></div></td>
											</c:if>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>

						</table>
					</div>
					<div class="card-footer clearfix">
						<div class="pagination justify-content-center m-0">
							<ul class="pagination ">
								<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(1)}" style="text-decoration:none">&lt;&lt;</a>
								<li class="page-item"><a class="page-link" href="list<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.cri.page-1) }</c:if>" style="text-decoration:none">&lt;</a>
								</li>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
									<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>"`>
										<a class="page-link" href="list${pageMaker.makeQuery(pageNum) }" style="text-decoration:none">${pageNum } </a>
									</li>
								</c:forEach>

								<li class="page-item"><a class="page-link"
									href="list
									<c:if test="${pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.cri.page+1) }
									</c:if>
									<c:if test="${!pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.cri.page) }
									</c:if>
								" style="text-decoration:none">&gt;</a>
								</li>

								<li class="page-item"><a class="page-link"
									href="list${pageMaker.makeQuery(pageMaker.realEndPage) }"style="text-decoration:none">
										&gt;&gt; </a></li>

							</ul>
						</div>
					</div>

				</div>
			</div>

		</div>
	</section>
	<script>
	function deleteNotice(no){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/remove",
			data:{not_no: no},
			type:"POST",
			success:function(){
				alert("글이 삭제되었습니다.");
				window.location.reload();
			},
			error:function(){
				alert("서버 오류입니다. 다시 시도해주세요.");
			}
		});
	}
		
	</script>
</body>
</html>