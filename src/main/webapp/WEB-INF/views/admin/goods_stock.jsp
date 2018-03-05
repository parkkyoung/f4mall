<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- page title -->
<h1 class="page-header">상품입출고</h1>
<!-- //page title -->

<!-- 상품재고 -->
<div class="panel panel-default">
	<div class="panel-heading">재고목록</div>
	<div class="panel-body">
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품이름</th>
					<th>재고수량</th>
					<th>최신입출고일자</th>
				</tr>
			</thead>
			<tbody>
					<!-- Loop -->
					<tr>
						<td><a href="goods_update.html">0000</a></td>
						<td>나이키신발</td>
						<td>100개</td>
						<td>YYYY-MM-DD</td>
					</tr>
					<!-- //Loop -->
			</tbody>
		</table>
	</div>
</div>
<!-- //상품재고 -->

<!-- 상품입고 -->
<div class="row">
	<!-- 상품입고 목록 -->
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">입고목록</div>
			<div class="panel-body">
				<table width="100%" class="tableData table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>상품코드</th>
							<th>상품이름</th>
							<th>입고수량</th>
							<th>입고일자</th>
						</tr>
					</thead>
					<tbody>
						<!-- Loop -->
						<tr>
							<td><a href="goods_update.html">0000</a></td>
							<td>나이키신발</td>
							<td>100개</td>
							<td>YYYY-MM-DD</td>
						</tr>
						<!-- //Loop -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- // 상품입고목록 -->
	
	<!-- 입고등록 -->
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">입고등록</div>
			<div class="panel-body">
				<form action="" role="form" class="panel-body">
					<div class="form-group">
						<label for="">상품코드</label>
						<input type="text" class="form-control" placeholder="상품코드" />
					</div>
					<div class="form-group">
						<label for="">입고수량</label>
						<input type="number" class="form-control" placeholder="숫자만 입력 가능" />
					</div>
					<div class="form-group">
						<label for="">입고일자</label>
						<input data-provide="datepicker" class="form-control datepicker" placeholder="YYYY-MM-DD">
					</div>
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary">입고등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- //입고등록 -->
</div>
<!-- //상품입고 -->


<!-- 상품출고 -->
<div class="row">
	<!-- 출고목록 -->
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">출고목록</div>
			<div class="panel-body">
				<table width="100%" class="tableData table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>상품코드</th>
							<th>상품이름</th>
							<th>출고수량</th>
							<th>출고일자</th>
						</tr>
					</thead>
					<tbody>
						<!-- Loop -->
						<tr>
							<td><a href="goods_update.html">0000</a></td>
							<td>나이키신발</td>
							<td>100개</td>
							<td>YYYY-MM-DD</td>
						</tr>
						<!-- //Loop -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- // 출고목록 -->
	
	<!-- 출고등록 -->
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">출고등록</div>
			<div class="panel-body">
				<form action="" role="form" class="panel-body">
					<div class="form-group">
						<label for="">상품코드</label>
						<input type="text" class="form-control" placeholder="상품코드" />
					</div>
					<div class="form-group">
						<label for="">출고수량</label>
						<input type="number" class="form-control" placeholder="숫자만 입력 가능" />
					</div>
					<div class="form-group">
						<label for="">출고일자</label>
						<input data-provide="datepicker" class="form-control datepicker" placeholder="YYYY-MM-DD">
					</div>
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary">출고등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- // 출고등록 -->
</div>
<!-- //상품출고 -->

<%@include file="template/footer.jsp" %>