<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="club-regist">

<div class="card-header">
	<h3 class="card-title">동호회 생성하기</h3>
	</div>
	
<div class="card-body">
				<form action="#" method="post" id="registForm">
					<div>
						<p>
							이메일 &nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
								id="mem_id_check" name="mem_id_check" value="1"> <label
								for="mem_id_check" id="mem_id_check_label">정보&nbsp비공개</label>
						</p>
					</div>

					<div class="row uniform" id="emailform">
						<div class="3u 10u$(xsmall)">
							<input type="text" name="mem_id" id="mem_id" value=""
								placeholder="아이디" maxlength="20" />
						</div>

						<div class="3u$ 12u$(xsmall)">
							<input type="text" name="email_add" id="email_add" value=""
								placeholder="@" maxlength="20" />
						</div>
						<div class="3u$ 12u$(xsmall)">
							<select name="email_address" id="email_address">
								<option value="">- 직접입력 -</option>
								<option value="@naver.com">naver.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@hotmail.com">hotmail.com</option>
								<option value="@nate.com">nate.com</option>
								<option value="@yahoo.co.kr">yahoo.co.kr</option>
							</select>
						</div>
						<div class="2u$ 12u$(xsmall)" id="checkbutton">
							<span class="button alt small" id="jungbok"
								onclick="mem_id_jungbok()">중&nbsp복&nbsp체&nbsp크</span>
						</div>
					</div>
					<div>
						<p id="mem_id_test"></p>
						<input type="hidden" id="mem_id_hidden1" value=""><input
							type="hidden" id="mem_id_hidden2" value=""><input
							type="hidden" id="mem_id_check_hidden" value="">
					</div>

					<div>
						<p>비밀번호</p>
					</div>
					<div class="row uniform">
						<div class="9u 12u$(xsmall)">
							<input type="password" name="mem_pwd" id="mem_pwd" value=""
								placeholder="비밀번호" maxlength="30" />
						</div>
					</div>
					<div>
						<p id="mem_pwd_test"></p>
						<input type="hidden" id="mem_pwd_hidden" value="">
					</div>
					<div>
						<p>비밀번호 확인</p>
					</div>
					<div class="row uniform">
						<div class="9u 12u$(xsmall)">
							<input type="password" name="mem_pwd_check" id="mem_pwd_check"
								value="" placeholder="비밀번호 확인" maxlength="30" />
						</div>
					</div>
					<div>
						<p id="mem_pwd_check_test"></p>
						<input type="hidden" id="mem_pwd_check_hidden" value="">
					</div>
					<div>
						<p>
							이름&nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
								id="mem_name_check" name="mem_name_check" value="1"> <label
								for="mem_name_check" id="mem_name_check_label">정보&nbsp비공개</label>
						</p>
					</div>
					<div class="row uniform">
						<div class="5u 12u$(xsmall)">
							<input type="text" name="mem_name" id="mem_name" value=""
								placeholder="이름" maxlength="8" />
						</div>
					</div>
					<div>
						<p id="mem_name_test"></p>
						<input type="hidden" id="mem_name_hidden" value="">
					</div>
					<div>
						<p>닉네임</p>
					</div>
					<div class="row uniform">
						<div class="5u 12u$(xsmall)">
							<input type="text" name="mem_nick" id="mem_nick"
								placeholder="닉네임" maxlength="20" />
						</div>
						<div class="2u$ 12u$(xsmall)" id="checkbutton">
							<span class="button alt small" id="jungbok"
								onclick="mem_nick_jungbok()">중&nbsp복&nbsp체&nbsp크</span>
						</div>

					</div>
					<div>
						<p id="mem_nick_test"></p>
						<input type="hidden" id="mem_nick_hidden" value=""><input
							type="hidden" id="mem_nick_check_hidden" value="">
					</div>
					<div>
						<p>
							전화번호&nbsp&nbsp&nbsp&nbsp&nbsp <input type="checkbox"
								id="mem_phone_check" name="mem_phone_check" value="1"> <label
								for="mem_phone_check" id="mem_phone_check_label">정보&nbsp비공개</label>
						</p>
					</div>
					<div class="row uniform">
						<div class="3u$ 12u$(xsmall)">
							<select name="mem_phone1" id="mem_phone1">
								<option value="fail" selected disabled>- 전화번호 -</option>
								<option value="010">010</option>
								<option value="02">02</option>
								<option value="051">051</option>
								<option value="053">053</option>
								<option value="032">032</option>
								<option value="062">062</option>
								<option value="042">042</option>
								<option value="052">052</option>
								<option value="044">044</option>
								<option value="031">031</option>
								<option value="033">033</option>
								<option value="043">043</option>
								<option value="041">041</option>
								<option value="063">063</option>
								<option value="061">061</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="064">064</option>
							</select>
						</div>
						<div class="3u 12u$(xsmall)">
							<input type="text" name="mem_phone2" id="mem_phone2" value=""
								placeholder="" maxlength="4" />
						</div>
						<div class="3u 12u$(xsmall)">
							<input type="text" name="mem_phone3" id="mem_phone3" value=""
								placeholder="" maxlength="4" />
						</div>
					</div>
					<div>
						<p id="mem_phone_test"></p>
						<input type="hidden" id="mem_phone_hidden" value="">
					</div>
					<div>
						<p>지역</p>
					</div>
					<div class="row uniform">
						<div class="4u$ 12u$(xsmall)">
							<select name="mem_local1" id="mem_local1" style="width: 100%;">

								<option value="fail" selected disabled>- 광역시, 도 -</option>
								<c:forEach var="local" items="${localList.localList}">
									<option value="${local.local_name }">${local.local_name }</option>
								</c:forEach>

							</select>
						</div>
						<div class="4u$ 12u$(xsmall)">
							<select name="mem_local2" id="mem_local2">
								<option value="" value="fail" selected disabled>- 시, 구
									-</option>
							</select>
						</div>
					</div>
					<br />
					<div>
						<p>생년월일</p>
					</div>
					<div class="row uniform">
						<div class="4u$ 9u$(xsmall)">
							<p>
								<input type="text" class="form-control" id="mem_birthDate"
							name="mem_birthDate" placeholder="년-월-일 ex) 1993-02-18">
							</p>
						</div>
					</div>
					<div>
						<p id="mem_birthDate_test"></p>
						<input type="hidden" id="mem_birthDate_hidden" value="">
					</div>
					<div>
						<p>성 별</p>
					</div>
					<div class="row uniform">
						<div class="4u 12u$(small)">
							<input type="radio" id="priority-low" name="mem_gender" checked
								value="남성"> <label for="priority-low">남&nbsp&nbsp&nbsp&nbsp성</label>
						</div>
						<div class="4u 12u$(small)">
							<input type="radio" id="priority-normal" name="mem_gender"
								value="여성"> <label for="priority-normal">여&nbsp&nbsp&nbsp&nbsp성</label>
						</div>
					</div>
				</form>
			</div>
</div>

</body>
</html>