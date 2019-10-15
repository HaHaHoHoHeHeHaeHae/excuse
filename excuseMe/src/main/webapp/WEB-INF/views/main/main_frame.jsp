<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<div id="main" class="wrapper">
      <div>
        <div class="row" style="position:relative; margin-top:-300px;">
        	<iframe id="if_list" name="if_list" frameborder="0" scrolling="0" 
        		src="<%=request.getContextPath() %>/main/main?mem_nick=${loginUser.mem_nick}" 
        		style="position: absolute; top: 0px; left: 0px; 
        		bottom: 0px; height: 1097px; width: 100%; border: 0px;">
        	</iframe>        	
        </div>
       </div>
</div>
