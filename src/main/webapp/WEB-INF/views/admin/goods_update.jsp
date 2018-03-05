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

<!-- page title -->
<h1 class="page-header">상품상세</h1>
<!-- //page title -->

<!-- 상품상세 -->
<div class="panel panel-default">
	<div class="panel-heading">상품상세</div>

	<!-- 상품등록 -->
	<div class="panel-body">
		<form action="" role="form" class="panel-body">
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">상품코드</label>
						<input type="text" class="form-control" value="012345" readonly />
					</div>
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
					<div class="form-group">
						<label for="">공급업체코드</label>
						<input type="text" class="form-control" placeholder="공급업체코드" value="123456789" />
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
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">등록일자</label>
						<input type="text" class="form-control" value="YYYY-MM-DD" readonly />
					</div>
					<div class="form-group">
						<label for="">카테고리</label>
						<select name="" class="form-control">
							<option value="">OUTER</option>
							<option value="">SHIRTS</option>
							<option value="">JEANS</option>
							<option value="">SHOES</option>
							<option value="">ACCESSORIES</option>
							<option value="">CHILDE</option>
						</select>
					</div>
					<div class="form-group">
						<label for="">재질</label>
						<input type="text" class="form-control" placeholder="재질" value="면" />
					</div>
					<div class="form-group">
						<label for="">색상</label>
						<input type="text" class="form-control" placeholder="영어 대문자로 대표색상 한가지만 표기(ex : WHITE)" value="BLACK" />
					</div>
					<div class="form-group">
						<label for="">성별</label>
						<div class="radio">
							<label><input name="" type="radio" checked>남자</label>
							<label><input name="" type="radio">여자</label>
						</div>
					</div>
					<div class="form-group">
						<label for="">브랜드</label>
						<input type="text" class="form-control" placeholder="브랜드" value="나이키" />
					</div>
					<div class="form-group">
						<label for="">사이즈</label>
						<input type="text" class="form-control" placeholder="사이즈" class="XL, L, S" />
					</div>
					<div class="form-group">
						<label for="">이미지 썸네일</label>
						<input type="file" class="form-control" />
					</div>
					<div class="form-group">
						<label for="">이미지 메인</label>
						<input type="file" class="form-control" />
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary" onclick="goodsUpdate();">상품수정</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- // 상품등록 -->
</div>
<!-- //상품상세 -->

<%@include file="template/footer.jsp" %>
