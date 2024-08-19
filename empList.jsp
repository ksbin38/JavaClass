<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="vo.EmpVO" %>
<%
List<EmpVO> list = (List<EmpVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">사원번호</th>
		      <th scope="col">사원명</th>
		      <th scope="col">부서</th>
		      <th scope="col">직속상관 사원번호</th>
		      <th scope="col">입사일</th>
		      <th scope="col">급여</th>
		      <th scope="col">수당</th>
		      <th scope="col">부서번호</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<%
		  		for (EmpVO vo : list) {
		  	%>
			  	<tr>
			      <th scope="row"><%=vo.getId() %></th>
			      <td><%=vo.getEmpNo() %></td>
			      <td><a href="/empView?empNo=<%=vo.getEmpNo() %>"><%=vo.geteName() %></td>
			      <td><%=vo.getJob() %></td>
			      <td><%=vo.getMgr() %></td>
			      <td><%=vo.getHireDate() %></td>
			      <td><%=vo.getSal() %></td>
			      <td><%=vo.getComm() %></td>
			      <td><%=vo.getDeptNo() %></td>
			    </tr>
		  	<% } %>
		  </tbody>
		</table>
	</div>
</body>
</html>