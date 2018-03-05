<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- page script -->
<script>
	function goodsUpdate(){
		swal({
			text : "상품수정이 완료되었습니다.",
			icon : "success"
		});
	};
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상품상세</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">상품상세</div>

			<!-- 상품등록 -->
			<form action="" role="form" class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<label for="">상품명</label>
							<input type="text" class="form-control" placeholder="상품이름" value="나이키신발" />
						</div>
						<div class="form-group">
							<label for="">상품설명</label>
							<textarea class="form-control" rows="5" placeholder="상품설명">어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고</textarea>
						</div>
						<div class="form-group">
							<label for="">상품가격(원)</label>
							<input type="number" class="form-control" placeholder="숫자만 입력 가능" value="99999" />
						</div>
						<div class="form-group">
							<label for="">할인가(원)</label>
							<input type="number" class="form-control" placeholder="숫자만 입력 가능" value="1" />
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label for="">공급업체코드</label>
							<input type="text" class="form-control" placeholder="공급업체코드" value="123456789" />
						</div>
						<div class="form-group">
							<label for="">이미지 썸네일</label>
							<input type="file" class="form-control" />
						</div>
						<div class="form-group">
							<label for="">이미지 메인</label>
							<input type="file" class="form-control" />
						</div>
						<div class="form-group">
							<label for="">제조일자</label>
							<input data-provide="datepicker" class="form-control datepicker" placeholder="YYYY-MM-DD" value="2018-02-28">
						</div>
						<div class="form-group">
							<label for="">제조국가</label>
							<select name="" class="form-control">
								<option value="" selected>한국</option>
								<option value="">중국</option>
								<option value="">일본</option>
							</select>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="form-group text-right">
							<button type="button" class="btn btn-primary btn-lg" onclick="goodsUpdate();">상품수정</button>
						</div>
					</div>
				</div>
			</form>
			<!-- // 상품등록 -->
		</div>
		<!-- // panel -->
	</div>
	<!-- // col -->
</div>
<!-- // row -->

<%@include file="template/footer.jsp" %>