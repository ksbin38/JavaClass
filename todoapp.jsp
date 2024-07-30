<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실습 3-2</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script>
function addItem() {
	// 입력값 가져와 todo 변수에 저장
	var todo = document.getElementById("item").value;
	// <ul> 요소를 참조해서 list 변수에 저장
	let list = document.getElementById("todolist");
	// <li> 요소 생성
	var item = document.createElement("li");
	
	var btnDelete = document.createElement("button");
	btnDelete.className = "btn-close";
	
	btnDelete.onclick = function(e) {
		list.removeChild(e.target.parentNode);
	}
	
	item.innerText = todo; // 위에 value를 안썼으면 여기서 todo.value로 입력해야 된다.
	item.appendChild(btnDelete);
	list.appendChild(item);
	// 위에 value를 안썼을 시
	// todo.value = "";
	// todo.focus();
	document.getElementById("item").value = "";
	document.getElementById("item").focus();
}
</script>
</head>
<body>
	<div class="container bg-primary-subtle shadow">
		<h2>My ToDo App</h2>
		<hr>
		<div class="input-group mb-3">
			<input id="item" type="text" class="form-control" placeholder="할 일을 입력하세요.">
			<button type="button"class="btn btn-primary" onclick="addItem()">할 일 추가</button>
		</div>
		<hr>
		<ul id="todolist" class="list-group"></ul>
	</div>
</body>
</html>