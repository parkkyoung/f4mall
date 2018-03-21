<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function stock_in(f){
	
/* 	alert(f.in_sregdate.value); */
	
	var i_no = f.in_ino.value;
	var s_amt = f.in_samt.value;
	var s_regdate = f.in_sregdate.value;
	
	if(i_no==''){
		alert('상품코드를 입력해주세요');
		f.in_ino.focus();
		return;
	}
	if(s_amt == ''){
		alert('수량을 입력해주세요')
		f.in_samt.focus();
		return
	}
	if(s_regdate == ''){
		alert('입고 일자를 입력해주세요')
		return
	}
	
	f.action='goods_stock_in.do';
	f.submit();
	
}

function stock_out(f){
	var i_no = f.out_ino.value;
	var s_amt = f.out_samt.value;
	var s_regdate = f.out_sregdate.value;
	
	if(i_no==''){
		alert('상품코드를 입력해주세요');
		f.out_ino.focus();
		return;
	}
	if(s_amt == ''){
		alert('수량을 입력해주세요')
		f.out_samt.focus();
		return
	}
	if(s_regdate == ''){
		alert('입고 일자를 입력해주세요')
		return
	}
	
	f.action='goods_stock_out.do';
	f.submit();
	
}
</script>

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
				<c:forEach var="inv" items="${ map.inv_list }">
					<tr>
						<td>${ inv.i_no }</td>
						<td>${ inv.p_name }<br>(${ inv.color_name },${ inv.size_name })</td>
						<td>${ inv.s_amt }</td>
						<td>${ inv.s_regdate }</td>
					</tr>
				</c:forEach>
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
						<c:forEach var="in" items="${ map.in_list }">
						<tr>
							<td>${ in.i_no }</td>
							<td>${ in.p_name }<br>(${ in.color_name },${ in.size_name })</td>
							<td>${ in.s_amt }</td>
							<td>${ in.s_regdate }</td>
						</tr>
						</c:forEach>
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
						<input type="text" class="form-control" placeholder="상품코드" name="i_no" id="in_ino" value="${ item_no }"/>
					</div>
					<div class="form-group">
						<label for="">입고수량</label>
						<input type="number" class="form-control" placeholder="숫자만 입력 가능" name="s_amt" id="in_samt"/>
					</div>
					<div class="form-group">
						<label for="">입고일자</label>
						<input data-provide="datepicker" class="form-control datepicker" placeholder="YYYY-MM-DD" name="s_regdate" id="in_sregdate">
					</div>
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary" onclick="stock_in(this.form);">입고등록</button>
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
						<c:forEach var="out" items="${ map.out_list }">
						<tr>
							<td>${ out.i_no }</td>
							<td>${ out.p_name }<br>(${ out.color_name },${ out.size_name })</td>
							<td>${ out.s_amt }</td>
							<td>${ out.s_regdate }</td>
						</tr>
						</c:forEach>
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
						<input type="text" class="form-control" placeholder="상품코드" name="i_no" id="out_ino"/>
					</div>
					<div class="form-group">
						<label for="">출고수량</label>
						<input type="number" class="form-control" placeholder="숫자만 입력 가능" name="s_amt" id="out_samt"/>
					</div>
					<div class="form-group">
						<label for="">출고일자</label>
						<input data-provide="datepicker" class="form-control datepicker" placeholder="YYYY-MM-DD" name="s_regdate" id="out_sregdate">
					</div>
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary" onclick="stock_out(this.form);">출고등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- // 출고등록 -->
</div>
<!-- //상품출고 -->

<%@include file="template/footer.jsp" %>