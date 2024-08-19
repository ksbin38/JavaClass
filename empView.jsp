<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.EmpVO" %>
<%
EmpVO data = (EmpVO) request.getAttribute("data");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table">
			<tbody>
				<tr>
					<td>EMPNO</td>
					<td><input type="text" name="EMPNO" value="" /></td>
				</tr>
				<tr>
					<td>ENAME</td>
					<td><input type="text" name="ENAME" value="" /></td>
				</tr>
				<tr>
					<td>JOB</td>
					<td><input type="text" name="JOB" value="" /></td>
				</tr>
				<tr>
					<td>MGR</td>
					<td><input type="text" name="MGR" value="" /></td>
				</tr>
				<tr>
					<td>HIREDATE</td>
					<td><input type="text" name="HIREDATE" value="" /></td>
				</tr>
				<tr>
					<td>SAL</td>
					<td><input type="text" name="SAL" value="" /></td>
				</tr>
				<tr>
					<td>COMM</td>
					<td><input type="text" name="COMM" value="" /></td>
				</tr>
				<tr>
					<td>DEPTNO</td>
					<td><input type="text" name="DEPTNO" value="" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>