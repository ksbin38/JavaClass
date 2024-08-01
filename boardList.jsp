<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Boards" %>
<%
List<Boards> list = (List<Boards>) request.getAttribute("boardList");
%>

<table class="table">
	<thead>
		<tr>
			<th scope="col">
				<div class="form-check">
					<input type="checkbox" id="chkAll">
				</div>
			</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
	<% for(Boards item : list) { %>
		<tr>
			<th scope="row">
				<input type="checkbox" class="chk" id="chk1" value="<%=item.getIdx() %>">
			</th>
		    <td><a href="/boardView?idx=<%=item.getIdx()%>"><%=item.getTitle() %></a></td>
		    <td><%=item.getRegUser() %></td>
		    <td><%=item.getRegDate() %></td>
	  	</tr>
  	<% } %>
	</tbody>
</table>
<% if(userID != null && !userID.equals("")) { %>
<div class="d-grid gap-2 d-flex justify-content-between">
	<button type="button" class="btn btn-danger">선택 삭제</button>
	<a herf="/boardWrite" class="btn btn-success">글쓰기</a>
</div>
<% } %>

<script>
	// 전체 체크박스
	const toggler = document.getElementById('chkAll');
	// 개별 체크박스
	const checks = document.querySelectorAll('.chk');
	
	toggler.addEventListener('click', function(event) {
		const checked = event.target.checked
		for(let i = 0; i < checks.length; i++) {
			checks[i].checked = checked;
		}
	});
	
	document.getElementById('btnDelete').addEventListener('click', function() {
		let isChecked = false;
		let idxs = "";
		for (let i = 0; i < checks.length; i++) {
			if (checks[i].checked) {
				isChecked = true;
				idxs += checks[i].value + ",";
			}
		}
		if (!isChecked) {
			alert('삭제할 게시물을 선택하세요.');
			return;
		}
		idxs = idxs.substring(0, idxs.length - 1);
		window.location.href = "/boardDelete?idxs=" + idxs;
	});
</script>
<%@ include file="includes/footer.jsp" %>