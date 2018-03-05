<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<!-- Loop -->
				<tr>
					<td><a href="goods_update.html">0000</a></td>
					<td>나이키신발00</td>
					<td>신발</td>
					<td>10000</td>
					<td>18년</td>
				</tr>
				<!-- //Loop -->
				<tr>
					<td><a href="goods_update.html">0001</a></td>
					<td>나이키신발01</td>
					<td>신발01</td>
					<td>10001</td>
					<td>18년01</td>
				</tr>
				<tr>
					<td><a href="goods_update.html">0002</a></td>
					<td>나이키신발02</td>
					<td>신발02</td>
					<td>10002</td>
					<td>18년02</td>
				</tr>
			</tbody>
		</table>
		<!-- /.table-responsive -->
	</div>
	<!-- /.panel-body -->
</div>
<!-- //상품목록 -->

<%@include file="template/footer.jsp" %>