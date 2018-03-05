<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- page script -->
<script>
	function goodsInsert(f){
		
		var p_name = f.p_name.value;
		var p_content= f.p_content.value;
		var p_price = f.p_price.value;
		var p_supply= f.p_supply.value;
		var p_pdate= f.p_pdate.value;
		var p_country= f.p_country.value;
		var p_material= f.p_material.value;
		var p_color= f.p_color.value;
		var sex_no= f.sex_no.value;
		var p_brand= f.p_brand.value;
		var p_size= f.size_no.value;
		
		if(p_name = ''){
			alert('상품명을 입력해주세요')
			f.p_name.focus();
			return;
		}
		if(p_content = ''){
			alert('상품 설명을 입력해주세요')
			f.p_content.focus();
			return;
		}
		if(p_pdate = ''){
			alert('제조일자를 입력해주세요')
			f.p_pdate.focus();
			return;
		}
		if(p_country = ''){
			alert('제주국을 입력해주세요')
			f.p_country.focus();
			return;
		}

		if(p_material = ''){
			alert('재질을 입력해주세요')
			f.p_material.focus();
			return;
		}
		if(sex_no = ''){
			alert('성별을 입력해주세요')
			f.sex_no.focus();
			return;
		}
		if(p_brand = ''){
			alert('브랜드명을 입력해주세요')
			f.p_brand.focus();
			return;
		}
		if(p_size = ''){
			alert('사이즈를 입력해주세요')
			f.p_size.focus();
			return;
		}
		
		f.action = 'product_insert.do';
		f.submit();
		
		swal({
			text : "상품등록이 완료되었습니다.",
			icon : "success"
		});
	};
</script>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">

		<!-- page title -->
<h1 class="page-header">상품등록</h1>
<!-- //page title -->

<!-- 상품등록 -->
<div class="panel panel-default">
	<div class="panel-heading">상품등록</div>

	<!-- 상품등록 -->
	<div class="panel-body">
		<form action="" role="form" class="panel-body">
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">상품명</label>
						<input type="text" id="p_name" name="p_name" class="form-control" placeholder="상품이름" />
					</div>
					<div class="form-group">
						<label for="">상품설명</label>
						<textarea id="p_content" name="p_content" class="form-control" rows="5" placeholder="상품설명"></textarea>
					</div>
					<div class="form-group">
						<label for="">상품가격(원)</label>
						<input type="number" id="p_price" name="p_price"  class="form-control" placeholder="숫자만 입력 가능" />
					</div>
					<div class="form-group">
						<label for="">할인가(원)</label>
						<input type="number" id="p_sale" name="p_sale"  class="form-control" placeholder="숫자만 입력 가능" />
					</div>
					<div class="form-group">
						<label for="">공급업체코드</label>
						<input type="text" id="p_supply" name="p_supply"  class="form-control" placeholder="공급업체코드" />
					</div>
					<div class="form-group">
						<label for="">제조일자</label>
						<input data-provide="datepicker" id="p_pdate" name="p_pdate" class="form-control datepicker" placeholder="YYYY-MM-DD">
					</div>
					<div class="form-group">
						<label for="">제조국가</label>
						<select id="p_country" name="p_country" class="form-control">
							<option value="">한국</option>
							<option value="">중국</option>
							<option value="">일본</option>
						</select>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">카테고리</label>
						<select id="category_no" name="category_no" class="form-control">
							<option value="1">OUTER</option>
							<option value="2">SHIRTS</option>
							<option value="3">JEANS</option>
							<option value="4">SHOES</option>
							<option value="5">ACCESSORIES</option>
							<option value="6">CHILD</option>
						</select>
					</div>
					<div class="form-group">
						<label for="">재질</label>
						<input type="text" id="p_material" name="p_material" class="form-control" placeholder="재질" />
					</div>
					<div class="form-group">
						<label for="">색상</label>
						<input type="text" id="p_color" name="p_color" class="form-control" placeholder="영어 대문자로 대표색상 한가지만 표기(ex : WHITE)" />
					</div>
					<div class="form-group">
						<label for="">성별</label>
						<div class="radio">
							<label><input type="radio" id="sex_male" name="sex_no" value="1">남자</label>
							<label><input type="radio" id="sex_female" name="sex_no" value="2">여자</label>
						</div>
					</div>
					<div class="form-group">
						<label for="">브랜드</label>
						<input type="text" id="p_brand" name="p_brand" class="form-control" placeholder="브랜드" />
					</div>
					<div class="form-group">
						<label for="">사이즈</label>
						<input type="text" id="size_no" name="size_no" class="form-control" placeholder="사이즈" />
					</div>
					<div class="form-group">
						<label for="">이미지 썸네일</label>
						<input type="file" id="p_image_m" name="p_image_m" class="form-control" />
					</div>
					<div class="form-group">
						<label for="">이미지 메인</label>
						<input type="file" id="p_image_s" name="p_image_s" class="form-control" />
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary" onclick="goodsInsert(this.form);">상품등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- // 상품등록 -->
</div>
<!-- //상품등록 -->

<%@include file="template/footer.jsp" %>