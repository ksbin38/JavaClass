<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=java.time.LocalDateTime.now() %>
<div>
<h1>제목 태그 1</h1>
<h2>제목 태그 2</h2>
<h3>제목 태그 3</h3>
<h4>제목 태그 4</h4>
<h5>제목 태그 5</h5>
<h6>제목 태그 6</h6>
<p>안녕하세요.<br/>
오늘 날씨가 덥네요.</p>
</div>
<div>
<!-- ul unordered list: 순서가 관계가 없는 목록 -->
<h1>여행 물품 목록</h1>
<!-- 기호로 목록 표기됨 -->
<ul>
	<li>가방</li>
	<li>옷</li>
	<li>세면도구</li>
</ul>
</div>
<div>
<!-- ol ordered list: 순서가 정확해야하는 목록 -->
<h1>라면 끓이는 법</h1>
<!-- 숫자로 목록 표기됨 -->
<ol>
	<li>물 계량</li>
	<li>물 끓이기</li>
	<li>라면 넣기</li>
	<li>스프 넣기</li>
</ol>
</div>

<img src="https://mml.pstatic.net/www/mobile/edit/20240725_1095/upload_172190683488505iGS.gif">
<a href="">태그이동</a>
</body>
</html>