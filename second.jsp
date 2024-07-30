<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
h2 {
	/* 가장자리의 둥근 정도 */
	border-radius: 5px;
	background-color: wheat;
	/* 텍스트를 정렬할 위치 */
	text-align: center;
	/* 줄간격처럼 위아래의 여백 설정, 텍스트와 border 사이의 간격(상하 좌우), 4개 한번에 적으면 (상 우 하 좌) */
	padding: 15px 0;
	/* border 테두리 설정 */
	border: 5px solid red;
}
form {
	padding: 15px 20px;
	border-radius: 10px;
	/* border 중앙 정렬 */
	margin: auto;
	width: 50%;
	background-color: SandyBrown;
}
.result {
	/* 숨김 처리 */
	/* 숨긴걸 보이게 할 때: block */
	display: none;
}
</style>
</head>
<body>
<h2>회원 가입</h2>
<form name="joinForm">
	<!-- div 태그를 입력해야 입력받는 텍스트상자가 아래줄로 내려감 -->
	<div>
		<!-- "텍스트"라는 라벨 클릭시 해당 입력창으로 알아서 넘어가게 하기 -->
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="userId" />
	</div>
	<div>
		<!-- 입력값이 안보이게 입력 받기 -->
		<label for="pw">비밀번호</label>
		<input id="pw" type="password" name="pw" />
	</div>
	<div>
		<label for="pwCheck">비밀번호 확인</label>
		<input id="pwCheck" type="password" name="pwCheck" />
	</div>
	<div>
		<!-- 선택지 중 하나만 선택되는 태그(name을 붙여야된다) -->
		<input type="radio" name="radio1" id="radio1" value="Y" />
		<label for="radio1">마케팅 동의</label>
		<input type="radio" name="radio2" id="radio2" value="N" />
		<label for="radio2">마케팅 동의 안함</label>
	</div>
	<div>
		<!-- 체크박스 생성(취소 가능) -->
		<input type="checkbox" id="chk" name="chk" />
		<label for="chk">약관에 동의</label>
	</div>
	<div>
		<!-- 선택박스 생성 -->
		<label for="job">직업</label>
		<select id="job" name="job">
			<!-- 선택되는 값에 value로 값을 부여 -->
			<option value="">선택하세요</option>
			<option value="dev">개발자</option>
			<option value="stu">학생</option>
		</select>
	</div>
	<div>
		<!-- 버튼 만들기 -->
		<button type="button" id="btnjoin" onClick="formSubmit()">가입</button>
		<!-- <button type="button" id="btnjoin" onClick="formSubmit()" onMouseOver="btnMouseOver()">줄줄이 늘여서 적는것: 인라인 방식 -->
		<button type="submit">제출</button>
		<!-- button type 종류: button: 클릭에 대한 행동을 취함, submit: 엔터를 눌러도 작동을 하는 버튼 -->
		<a href="">취소</a>
	</div>
</form>
<div id="result" class="result">
<h2>가입 완료</h2>
<p>아이디: <span id="resultId"></span></p>
<p> 마케팅 동의 여부: <span id="resultMk"></span></p>
</div>
<!-- 자바스크립트는 body를 닫기 전에 아래쪽에 쓸 것 -->
<script>
//가입버튼 클릭시 form의 모든 name값을 변수에 답고 userId가 6자 이상, 비밀번호가 8자 이상이고 비밀번호 확인란과 값이 동일한지 체크
//마케팅 동의 여부, 약관 동의 체크 여부, 직업 체크 여부, 값이 모조리 다 있으면 alert("가입 완료")
function formSubmit() {
	const userId = document?.joinForm?.userId.value;
	const pw = document?.joinForm?.pw?.value;
	const pwCheck = document?.joinForm?.pwCheck?.value;
	var chk1 = document?.joinForm?.radio1.value;
	var chk2 = document?.joinForm?.radio2.value;
	var chk3 = document?.joinForm?.chk.checked;
	const job = document?.joinForm?.job.value;
	
	if (userId?.trim()?.length < 6) {
		alert('아이디는 6자 이상 입력하세요.');
		return;
	}
	if (!userId) {
		alert('아이디를 입력하세요.');
		return;
	}
	if (!pw || pw !== pwCheck) {
		alert('비밀번호를 확인하세요.');
		return;
	}
	if (pw?.trim()?.length < 8) {
		alert('비밀번호를 8자 이상 입력하세요.');
		return;
	}
	if (chk1 !== "Y" && chk2 !== "N") {
		alert('마케팅 동의가 필요합니다.');
		return;
	}
	if (chk3 === false) {
		alert('약관에 동의하세요.');
		return;
	}
	if (job === "") {
		alert('직업을 선택하세요.');
		return;
	}
	console.log('회원가입 완료');
	
	document.getElementById('resultId').innerHTML = userId;
	document.getElementById('resultMk').innerHTML = chk1 === "Y"? "동의": "미동의";
	document.getElementById('result').style.display = 'block';
}

// 회원가입 안내
let result1 = confirm('회원 가입을 하시겠습니까?');
console.log(result1);

</script>
</body>
</html>