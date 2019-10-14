<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer id="footer" style="height:300px;padding-top:60px;margin-top:100px;">
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
	 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
	<!-- date-range-picker -->
	<script src="<%=request.getContextPath()%>/resources/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>
<%@include file="./notice_footer_js.jsp" %>
