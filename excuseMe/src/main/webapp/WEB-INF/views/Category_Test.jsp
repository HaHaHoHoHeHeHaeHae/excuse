<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀랙트 테스트한다</title>
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
<p>
edddddddddddddddddd
</p>
	<select class="form-control col-sm-4" name="searchType" id="category">
		<option selected disabled>대분류</option>

		<c:forEach items="${categoryList }" var="category" varStatus="status" >
			<option id="sub_cate${status.count}" value="${category.cate_no }"  >${category.cate_name }</option>
											
		</c:forEach>						
	</select>
	
	<select id="subCategory">
		<option selected disabled >소분류</option>
		
		
			
						
	</select>
	
	
	<script>
	$('#category').change(function() { 
		/* alert('sssssssssssssssssssssssssssssssssssssssssss'); */ 
		<%-- self.location="<%=request.getContextPath()%>/subcategory" --%>
		
	/* 	var go = ; */
		/* var gogo ={
				
		
		} */
		/* alert(go); */
		$.ajax({
			data:JSON.stringify({"cate_no":$(this).val()}),
			contentType:"application/JSON",
			type: "POST",
			url: "<%=request.getContextPath()%>/subcategory",
			cache: false,
			success: function(data) {
				console.log(data);
				$("#subCategory").html("");
				
				$("#subCategory").append("<option selected disabled >소분류</option>");
				for(var sub of data){
					console.log(sub.cate_sub_name);
					$("#subCategory").append("<option>"+sub.cate_sub_name+"</option>");
				}
			}
		});
	
	});

	</script>
</body>
</html>

