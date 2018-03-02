<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
			
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
						<a href="" class="pull-left">카테고리명</a>
						<span class="pull-right">상품번호 : 1234</span>
					</div>
					<div class="form-group">
						<h3>나이키신발</h3>
					</div>
					<div class="form-group">
						<label for="" class="control-label">배송비</label>
						<div class="">2500원</div>
					</div>
				</form>
			</div>
			<!-- //옵션 -->
		</div>
	</div>
	<!-- //상품 상세 -->

</section>
<!-- //sub contents -->
<%@include file="footer.jsp" %>