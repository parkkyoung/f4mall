<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>
<!-- visual -->
<section class="subVisual">
	<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
	<h2 class="hide">상품목록</h2>

	<!-- goods list -->
	<div class="goodsList">
		<h3 class="hide">상품 리스트</h3>
		<ul class="row">
			<!-- Loop -->
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href="goods_view.html"><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike1.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키나이키나이키나이키나이키나이키나이키나이키나이키나이키나이키나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<!-- //Loop -->
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href="goods_view.html"><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike2.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href="goods_view.html"><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike3.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href="goods_view.html"><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike4.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
		</ul>
	</div>
	<!-- //goods list -->

</section>
<!-- //sub contents -->
<%@include file="template/footer.jsp" %>