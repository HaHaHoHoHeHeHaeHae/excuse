<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<title>수정창</title>
</head>



<body>

	디테일에서 [수정]눌렀을 때:<input type="text" value="${club.club_no }"/>
	
	<form name="registForm" role="form" method="post" action="regist">
		[수정]창에서 다하고 submit할때:
		club_no:<input type="hidden" value="${club_no }" />
		club_regDate:<input type="hidden" value="${club_regDate }" />
		club_status:<input type="hidden" value="${club_status }" />
		mem_id:<input type="text" readonly value="${mem_id }" />
		club_name:<input type="text" value="${club_name }" />
		club_content:<input type="text" value="${club_content }" />
		club_local:<input type="text" value="${club_local }" />
		cate_name:<input type="text" value="${cate_name }" />
		<button type="button" onclick="onSubmit('${category}',document.resigsForm,'modify','post');">수정</button>
	</form>
<script>
 function onSubmit(category,form,url,method){
	 form.action="<%=request.getContextPath()%>/"+category+"/"+url;
	 form.method=method;
	 form.submit();
 }
</script>



</body>
