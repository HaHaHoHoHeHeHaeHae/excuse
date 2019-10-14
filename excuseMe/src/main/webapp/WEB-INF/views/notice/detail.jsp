<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>


</head>
<body class="subpage">


	<!-- Menu -->
	

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">


			<!-- Elements -->
		
			<div class="12u 12u$" style="height: 500px;">
				<div style="position: relative; margin-top: 20px;">
					<iframe id="if_list" name="if_list" frameborder="0" scrolling="0"
						src="<%=request.getContextPath()%>/notice/noticeDetail?not_no=${notice.not_no}&page=${page}&mem_nick=${mem_nick}"
						style="position: absolute; top: 0px; left: 0px; bottom: 0px; height: 900px; width: 100%; border: 0px;">
					</iframe>
				</div>
			</div>
		</div>
	</section>
		 

</body>

</html>