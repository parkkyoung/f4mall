<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- page title -->
<h1 class="page-header">회원목록</h1>
<!-- //page title -->

<!-- 회원목록 -->
<div class="panel panel-default">
	<div class="panel-heading">회원목록</div>
	<div class="panel-body">
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>주소</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<!-- Loop -->
				<c:forEach var = "m_list" items="${m_list }">
				<tr>
					<td><a href="member_update_form.do?m_id=<c:out value='${m_list.m_id}'/>"><c:out value="${m_list.m_id}"/></a></td>
					<td><c:out value="${m_list.m_name }"/></td>
					<td><c:out value="${m_list.m_nick }"/></td>
					<td><c:out value="${m_list.m_addr }"/></td>
					<td><c:out value="${m_list.m_regdate }"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- /.table-responsive -->
	</div>
	<!-- /.panel-body -->
</div>
<!-- //회원목록 -->

<%@include file="template/footer.jsp" %>