<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* css 주석 처리(스타일시트 내에서만) */
h1 {
	color: rgb(120, 0, 100);
	font-size: 40px;
}
/* h태그 폰트사이즈 통일시켜보기 */
h2, h3, h4, h5, h6 {
	font-size: 15px;
}
/* 밑줄 생기게 하는 클래스 */
.underline {
	text-decoration: underline;
}
/* 배경색 지정 */
.gray_bg {
	background-color: gray;
}
.bgyellow {
	background-color: yellow;
}
/* 아이디 셀렉터 - 가운데 정렬 시키기 */
/* 동일한 아이디는 한 페이지 내에 한개만 존재할 수 있다. */
#h1Tag {
	text-align: center;
}
/* p태그의 색상을 빨간색으로 변경 */
p {
	color: blue;
}
/* 특정 태그만 스타일을 적용할 경우 .클래스로 입력 */
.p_tag {
	color: red;
}
</style>
</head>
<body>
<div>
<!--  html 주석 처리 -->
<h1 id="h1Tag">Cascading Style Sheet</h1>
<h2>제목 태그 h2</h2>
<h3>제목 태그 h3</h3>
<h4>제목 태그 h4</h4>
<h5>제목 태그 h5</h5>
<h6>제목 태그 h6</h6>
<p>Hello World</p>
<!-- 클래스를 활용해 특정 태그만 스타일 적용 -->
<!-- 클래스 이름은 숫자나 대문자 넣지말자 -->
<p class="p_tag">추가된 p 태그입니다.</p>
<p class="underline">밑줄친 태그입니다.</p>
<!-- 클래스 중복지정 가능 -->
<p class="p_tag underline">빨간색 글씨의 밑줄 친 태그입니다.</p>
<p class="p_tag gray_bg">빨간 글씨의 배경색을 입힌 태그입니다.</p>
</div>
<form name="joinForm">
	<div>
		<!-- 사용자에게 입력 받기 -->
		<input />
	</div>
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
		<!-- 선택창(취소 안됨) -->
		<input type="radio" id="rd1" name="rd1" />
		<label for="rd1">마케팅 동의</label>
		<input type="radio" id="rd2" name="rd2" />
		<label for="rd2">마케팅 동의 안함</label>
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
<!-- 자바스크립트는 body를 닫기 전에 아래쪽에 쓸 것 -->
<script>
//가입 버튼 클릭 시 빨간색으로 색 변경
//var btn = document.getElementById("btnjoin");
//btn.addEventListener('click', function(){
//	this.style.backgroundColor = 'red'
//});
//가입버튼 클릭시 form의 모든 name값을 변수에 답고 userId가 6자 이상, 비밀번호가 8자 이상이고 비밀번호 확인란과 값이 동일한지 체크
//마케팅 동의 여부, 약관 동의 체크 여부, 직업 체크 여부, 값이 모조리 다 있으면 alert("가입 완료")
function formSubmit() {
	const userId = document.joinForm.userId.value;
	const pw = document.joinForm.pw.value;
	const pwCheck = document.joinForm.pwCheck.value;
	var chk1 = document.joinForm.radio1.value;
	var chk2 = document.joinForm.radio2.value;
	var chk3 = document.joinForm.chk.checked;
	const job = document.joinForm.job.value;
	if (userId.length < 6) {
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
	alert('회원가입이 완료되었습니다!');
	console.log('회원가입 완료');
}
const labels = document.querySelectorAll("label");
//클래스는(.클래스이름), 아이디는 (#아이디이름)으로 작성
for (let i = 0; i < labels.length; i++) {
	console.log(labels[i]);
	labels[i].style.color = 'blue';
}
const arr = ["사과", "배", "바나나", "포도"];
//'바'를 포함한 글자 찾기
const result = arr.find(item => item.includes('바'));
console.log(result);
//'바'를 포함한 글자 제외하기
const result2 = arr.filter(item => !item.includes('바'));
console.log(result2);
// Spread Operator 펼침 연산자
console.log(...arr);
//알아서 내용만 출력
//arr배열과 nums배열을 합쳐서 출력
const nums = [1, 2, 3, 4, 5];
console.log([...arr, ...nums]);
//ES 5
const arrCopy = [];
for (let i = 0; i < arr.length; i++) {
	arrCopy.push(arr[i]);
}
console.log(arrCopy);
//ES 6
const arrCopy2 = arr.map(item => item);
console.log(arrCopy2);
//스크립트에서 직접 입력해서 배경색 적용
//document.getElementById("btnjoin").style.backgroundColor = "yellow";
//클래스를 활용해서 배경색 적용
//document.getElementById("btnjoin").className = "bgyellow";
//function btnMouseOver() {
//	console.log('mouse over');
//}
//자바스크립트 주석
/**
 * 한줄 이상의 주석
 */
// ECMAScript 5
var x = 5;
var y = "5";
var z = true;
var a = 0.01;
// ECMAScript 6
let xx = 5;
xx = 555;
const MAX_VALUE = 10.0;
// 알림팝업 생성
alert('Hello');
// 회원가입 안내
let result1 = confirm('회원 가입을 하시겠습니까?');
console.log(result);

console.log(0 === false);

// 함수 선언식
function sum(a, b) {
	return a + b;
}

// 함수 표현식
let sum2 = function(a, b) {
	return a + b;
}

// 화살표 함수(arrow function)
let sum3 = (a, b) => a + b;
let msg = () => alert('msg');
let msg2 = a => alert(a);

</script>
</body>
</html>