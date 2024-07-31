<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Users" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동과 GET, POST 처리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<style>
#aLogin {
	/* 가장자리의 둥근 정도 */
	border-radius: 5px;
	/* 텍스트를 정렬할 위치 */
	text-align: center;
	/* 줄간격처럼 위아래의 여백 설정, 텍스트와 border 사이의 간격(상하 좌우), 4개 한번에 적으면 (상 우 하 좌) */
	padding: 15px 0;
}
#aLogout {
	/* 가장자리의 둥근 정도 */
	border-radius: 5px;
	/* 텍스트를 정렬할 위치 */
	text-align: center;
	align: right;
}
form {
	padding: 15px 20px;
	border-radius: 10px;
	/* border 중앙 정렬 */
	margin: auto;
	width: 60%;
}
</style>
</head>
<body>
<!-- 아래처럼 이용하면 자바코드 사용가능 -->
<form name="indexForm" method="post">
<%
HttpSession sess = request.getSession();
String userID = (String) sess.getAttribute("userID");
//Cookie[] cookies = request.getCookies();
//String userID = "";
//if(cookies != null) {
//	for(Cookie item : cookies) {
//		if(item.getName().equals("userID")) {
//			userID = item.getValue();
//		}
//	}
//}
List<Users> userList = new ArrayList<>();

if(userID != null && !userID.equals("")) {
	userList = (List<Users>) request.getAttribute("userList");
} 
%>

<% for(Users user : userList) { %>
<div style="text-align: center">번호: <%=user.getIdx() %>, 아이디: <%=user.getUserID() %>, 비밀번호: <%=user.getUserPW() %></div>
<% } %>

<% if(userID != null && !userID.equals("")) { %>
	<h1 style="text-align: center"><%=userID %>님 로그인</h1>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<a href="/logout" class="bg-success btn btn-primary me-md-2" id="aLogout">로그아웃</a>
	</div>
	
<% } else { %>
<div class="d-grid gap-2 col-6 mx-auto">
	<a href="/login.jsp" class="bg-success btn btn-primary me-md-2" id="aLogin">로그인</a>
</div>
<% } %>
</form>
</body>
</html>