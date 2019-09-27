<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="club" value="${dataMap.club }" />
<c:set var="member" value="${dataMap.member }" />

<head>
<title>디테일</title>
<style>
	form{
		border:1px;
	}
</style>


</head>
<body>
	<h4>동호회 상세보기</h4>
	<form name="detailForm" role="form" method="post" action="detail">
		<div id="club_no"></div>
		<label for="clubName">동호회명</label> 
		<input type="text" value="${club.club_name }" /> <br> 
		<label for="clubLocal">지역</label>
		<input type="text" value="${club.club_local }" /> <br> 
		<label for="clubCategory">카테고리</label> 
		<input type="text" value="${club.cate_name }" /> <br> 
		<label for="memberNick">닉네임</label><!-- mem_nick으로 바꿔야됨. -->
		<input type="text" value="${member.mem_nick }" /> <br>
		상세설명:<div id="clubContent">${club.club_content }</div>
		첨부파일: <input type="text" /><input type="button" value="다운로드">
		<br>
		<br>
		<br>
		<button type="button" id="wishBtn">관심등록</button> 
		<button type="button" id="signInBtn">가입하기</button> 
		<button type="button" id="cancelBtn">취소</button> 
	</form>
</body>
