<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

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
					<th>결제금액(원)</th>
				</tr>
			</thead>
			<tbody>
				<!-- Loop -->
				<tr>
					<td><a href="member_update.html">hong00@naver.com</a></td>
					<td>0000</td>
					<td>구로구00</td>
					<td>18년00</td>
					<td>10000</td>
				</tr>
				<!-- //Loop -->
				<tr>
					<td><a href="member_update.html">hong01@naver.com</a></td>
					<td>0001</td>
					<td>구로구01</td>
					<td>18년01</td>
					<td>10001</td>
				</tr>
				<tr>
					<td><a href="member_update.html">hong02@naver.com</a></td>
					<td>0002</td>
					<td>구로구02</td>
					<td>18년02</td>
					<td>10002</td>
				</tr>
			</tbody>
		</table>
		<!-- /.table-responsive -->
	</div>
	<!-- /.panel-body -->
</div>
<!-- //주문목록 -->

<%@include file="template/footer.jsp" %>