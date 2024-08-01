<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<!-- bootstrap 스타일 여러 jsp파일에 적용시키기 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<%
HttpSession sess = request.getSession();
String userID = (String) sess.getAttribute("userID");
%>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/index.jsp">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/boardList">게시판</a>
				</li>
	        <% if(userID != null && !userID.equals("")) { %>
		        <li class="nav-item">
		        	<a class="nav-link active" aria-current="page" href="#"><%=userID %>님 로그인</a>
		        </li>
		        <li class="nav-item">
					<a class="nav-link" href="/logout">로그아웃</a>
				</li>
				
			<% } else { %>
				<li class="nav-item">
					<a class="nav-link" href="/login.jsp">로그인</a>
				</li>
			<% } %>
			</ul>
		</div>
	</div>
</nav>