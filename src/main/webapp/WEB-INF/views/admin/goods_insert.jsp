<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp" %>

<!-- page script -->
<script>
	function goodsInsert(f){
		
		var p_name = f.p_name.value;
		var p_content= f.p_content.value;
        var p_price = f.p_price.value;
        var p_pdate= f.p_pdate.value;
        var p_image_m= document.getElementById("p_image_m").value;
        var p_image_s= document.getElementById("p_image_s").value;
        
		if(p_name == ''){
			swal({
				text : "상품명을 입력해주세요",
				icon : "error"
			}).then((value) =>{
				f.p_name.focus();
				return;
			});
		} else if(p_content == ''){
        	swal({
                text : "상품 설명을 입력해주세요",
                icon : "error"
            }).then((value) =>{
            	f.p_content.focus();
                return;
            });
        } else if(p_price == ''){
            swal({
                text : "상품 가격을 입력해주세요",
                icon : "error"
            }).then((value) =>{
            	f.p_price.focus();
                return;
            });
        } else if(p_pdate == ''){
            swal({
                text : "제조일자를 입력해주세요",
                icon : "error"
            }).then((value) =>{
                f.p_pdate.focus();
                return;
            });
        } else if(p_image_m == ''){
            swal({
                text : "썸네일 이미지를 등록해주세요",
                icon : "error"
            }).then((value) =>{
                return;
            });
        } else if(p_image_s == ''){
            swal({
                text : "상세 이미지를 등록해주세요",
                icon : "error"
            }).then((value) =>{
                return;
            });
		} else {
	        swal({
	            text : "상품등록이 완료되었습니다.",
	            icon : "success"
	        }).then((value) =>{
	        	f.action = 'goods_insert.do';
	            f.submit();
	        });
        };
	};
</script>

<!-- page title -->
<h1 class="page-header">상품등록</h1>
<!-- //page title -->

<!-- 상품등록 -->
<div class="panel panel-default">
	<div class="panel-heading">상품등록</div>

	<!-- form -->
	<form action="" role="form" class="panel-body" method="post" enctype="multipart/form-data">
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
			</div>
			<div class="col-lg-6">
                <div class="form-group">
                    <label for="">제조일자</label>
                    <input data-provide="datepicker" id="p_pdate" name="p_pdate" class="form-control datepicker" placeholder="YYYY-MM-DD">
                </div>
                <div class="form-group">
                    <label for="">제조국가</label>
                    <input type="text" id="p_country" name="p_country"  class="form-control" />
                </div>
				<div class="form-group">
					<label for="">이미지 썸네일</label>
					<input type="file" id="p_image_m" name="p_image" class="form-control" />
				</div>
				<div class="form-group">
					<label for="">이미지 상세</label>
                    <input type="file" id="p_image_s" name="p_image" class="form-control" />
				</div>
			</div>
			<div class="col-lg-12">
				<div class="form-group text-right">
					<button type="button" class="btn btn-primary" onclick="goodsInsert(this.form);">상품등록</button>
				</div>
			</div>
		</div>
	</form>
	<!-- // form -->
</div>
<!-- //상품등록 -->

<%@include file="template/footer.jsp" %>