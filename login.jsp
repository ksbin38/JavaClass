<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<style>
form {
	padding: 15px 20px;
	border-radius: 10px;
	/* border 중앙 정렬 */
	margin: auto;
	width: 35%;
}
</style>
</head>
<body>
<form name="loginForm" class="bg-success-subtle" method="post" action="/loginAction" onsubmit="return validateForm(event)">
	<div class="bg-success-subtle">
		<!-- "텍스트"라는 라벨 클릭시 해당 입력창으로 알아서 넘어가게 하기 -->
		<label for="userID">아이디</label>
		<input type="text" id="userID" name="userID" placeholder="아이디를 입력하세요" />
	</div>
	<div class="bg-success-subtle">
		<!-- 입력값이 안보이게 입력 받기 -->
		<label for="userPW">비밀번호</label>
		<input id="userPW" type="password" name="userPW" placeholder="비밀번호를 입력하세요" />
	</div>
	<div>
		<button type="submit">로그인</button>
	</div>
</form>
<script>
function formSubmit() {
	const userID = document?.loginForm?.userID.value.trim();
	const userPW = document?.loginForm?.pw?.value.trim();
	
	if (!userID) {
		alert('아이디를 입력하세요.');
		return false;
	}
	if (!userPW) {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	return true;
}
</script>
</body>
</html>