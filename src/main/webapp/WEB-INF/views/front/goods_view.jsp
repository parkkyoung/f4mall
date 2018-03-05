<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
function add_cart(p_no){
	var param = { 'p_no' : p_no, 'm_id' : '${ user.id }' };
	$.ajax({
		url : 'cart_insert.do',
		data: param,
		success:function(data){
			var json = eval(data);
			//json =[{'result':'success'}];
			if(json[0].result == 'fail'){
				alert('이미 장바구니에 담겨져 있습니다');
				return;
			}
			
			//장바구니 담기 성공
			if(confirm('장바구니 담기 성공\n장바구니 보기로 이동하시겠습니까?')==false){
				return;
			}
			location.href='cart_list.do';
		}
	});
}
</script>
<!-- visual -->
<section class="subVisual">
	<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
	<h2 class="hide">상품상세</h2>

	<!-- 상품 상세 -->
	<div class="goods">
		<div class="row">

			<!-- 캐러셀 -->
			<div class="col-sm-6">
				<div id="carousel" class="carousel slide" data-ride="carousel">

					<!-- 캐러셀 인디케이터 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel" data-slide-to="0" class="active"></li>
						<li data-target="#carousel" data-slide-to="1"></li>
					</ol>

					<!-- 캐러셀 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active"><img src="http://placehold.it/400x400" alt="" class="wFull" /></div>
						<div class="item"><img src="http://placehold.it/400x400" alt="" class="wFull" /></div>
					</div>

				</div>
			</div>
			<!-- //캐러셀 -->

			<!-- 옵션 -->
			<div class="col-sm-6">
				<form action="" class="goodsOption form-horizontal">
					<div class="form-group clearFix">
						<a href="" class="pull-left">${ vo.category_no }</a>
						<span class="pull-right">상품번호 : ${ vo.p_no }</span>
					</div>
					<div class="form-group">
						<h3>${ vo.p_name }</h3>
					</div>
					<div class="form-group">
						<label for="" class="control-label">배송비</label>
						<div class="">${ vo.p_price }</div>
					</div>
					<input type="button" value="장바구니" onclick="add_cart(this.form);">
				</form>
			</div>
			<!-- //옵션 -->
		</div>
	</div>
	<!-- //상품 상세 -->

</section>
<!-- //sub contents -->
<%@include file="footer.jsp" %>