<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!-- page title -->
<h1 class="page-header">주문목록</h1>
<!-- //page title -->

<!-- 주문목록 -->
<div class="panel panel-default">
	<div class="panel-heading">주문목록</div>
	<div class="panel-body">
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>상품코드</th>
					<th>배송지</th>
					<th>주문일자</th>
					<th>상태</th>
					<th>결제금액(원)</th>
				</tr>
			</thead>
			<tbody>
				<!-- Loop -->
				<c:forEach var="mo_list" items="${mo_list }">
				<tr>
					<td><c:out value="${mo_list.m_id }"/></a></td>
					<td><c:out value="${mo_list.i_no }"/></td>
					<td><c:out value="${mo_list.o_addr }"/></td>
					<td><c:out value="${mo_list.o_regdate }"/></td>
					<td>결제완료</td>
					<td><c:out value="${mo_list.o_pay_amt }"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- /.table-responsive -->
	</div>
	<!-- /.panel-body -->
</div>
<!-- //주문목록 -->

<%@include file="template/footer.jsp" %>