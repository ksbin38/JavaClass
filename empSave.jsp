<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 저장</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form method="post" action="/empSave">
		
		  <div class="mb-3">
		    <label for="EMPNO" class="form-label">사원번호</label>
		    <input type="text" class="form-control" id="EMPNO" name="EMPNO">
		  </div>
		  <div class="mb-3">
		    <label for="ENAME" class="form-label">사원명</label>
		    <input type="text" class="form-control" id="ENAME" name="ENAME">
		  </div>
		  <div class="mb-3">
		    <label for="JOB" class="form-label">부서</label>
		    <input type="text" class="form-control" id="JOB" name="JOB">
		  </div>
		  <div class="mb-3">
		    <label for="MGR" class="form-label">직속상관사번</label>
		    <input type="text" class="form-control" id="MGR" name="MGR">
		  </div>
		  <div class="mb-3">
		    <label for="SAL" class="form-label">급여</label>
		    <input type="text" class="form-control" id="SAL" name="SAL">
		  </div>
		  <div class="mb-3">
		    <label for="COMM" class="form-label">수당</label>
		    <input type="text" class="form-control" id="COMM" name="COMM">
		  </div>
		  <div class="mb-3">
		    <label for="DEPTNO" class="form-label">부서번호</label>
		    <input type="text" class="form-control" id="DEPTNO" name="DEPTNO">
		  </div>
		  
		  <button type="submit" class="btn btn-primary">저장</button>
		</form>
	</div>
</body>
</html>