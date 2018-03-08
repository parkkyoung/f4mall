<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

<!-- page title -->
<h1 class="page-header">상품목록</h1>
<!-- //page title -->

<!-- 상품목록 -->
<div class="panel panel-default">
	<div class="panel-heading">상품목록</div>
	<div class="panel-body">
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>카테고리</th>
					<th>상품가격(원)</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${p_list}">
				<tr>
					<td><c:out value="${list.p_no}" /></td>
					<td><a href="goods_update_form.do?p_no=<c:out value='${list.p_no}'/>"><c:out value="${list.p_name}" /></a></td>
					<td><c:out value="${list.category_no}" /></td>
					<td><c:out value="${list.p_price}" /></td>
					<td><c:out value="${list.p_entry}" /></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!-- //상품목록 -->

<%@include file="template/footer.jsp" %>