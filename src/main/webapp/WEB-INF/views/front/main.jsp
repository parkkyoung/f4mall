<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="header.jsp" %>
			
<!-- visual -->
<section class="mainVisual">
	<video autoplay="" muted="" preload="true" loop="" class="wFull"><source src="${ pageContext.request.contextPath }/resources/front/img/visual.mp4" type="video/mp4"></video>
</section>
<!-- //visual -->

<!-- main contents -->
<section class="main container">
	<h2 class="hide">메인</h2>
	<!-- category -->
	<div class="category">
		<ul class="row">
			<li class="col-sm-4 col-xs-12">
				<a href="">
					<img src="${ pageContext.request.contextPath }/resources/front/img/img_main_category1.jpg" alt="Category MEN" class="wFull" />
					<span>MEN</span>
				</a>
			</li>
			<li class="col-sm-4 col-xs-12">
				<a href="">
					<img src="${ pageContext.request.contextPath }/resources/front/img/img_main_category2.jpg" alt="Category Accessory" class="wFull" />
					<span>ACCESSORY</span>
				</a>
			</li>
			<li class="col-sm-4 col-xs-12">
				<a href="">
					<img src="${ pageContext.request.contextPath }/resources/front/img/img_main_category3.jpg" alt="Category Women" class="wFull" />
					<span>WOMEN</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- //category -->

	<div class="banner mt70"><img src="${ pageContext.request.contextPath }/resources/front/img/img_main_banner1.jpg" alt="banner" class="wFull" /></div>

	<!-- goods list -->
	<div class="goodsList mt70">
		<h3 class="hide">상품 리스트</h3>
		<ul class="row">
			<!-- Loop -->
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/front/img/sample/nike1.jpg" alt="상품" class="wFull" /></a>
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
					<a href=""><img src="${ pageContext.request.contextPath }/resources/front/img/sample/nike2.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/front/img/sample/nike3.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/front/img/sample/nike4.jpg" alt="상품" class="wFull" /></a>
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

	<div class="banner mt70"><img src="${ pageContext.request.contextPath }/resources/front/img/img_main_banner2.jpg" alt="banner" class="wFull" /></div>

	<!-- goods list -->
	<div class="goodsList mt70">
		<h3 class="hide">상품 리스트</h3>
		<ul class="row">
			
			<%-- <li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike5.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike6.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike7.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li>
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike8.jpg" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>나이키</h4>
					<span>&#x20a9;20,000</span>
				</div>
			</li> --%>
			<!-- Loop -->
			<c:forEach var="product" items="${ p_list }">
			
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href="product_view.do?p_no=${ product.p_no }"><img src="${ pageContext.request.contextPath }/resources/front/img/sample/${ product.p_image_m }" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4>${ product.p_name }</h4>
					<span>&#x20a9;<fmt:formatNumber value="${ product.p_price }"/></span>
				</div>
			</li>
			</c:forEach>
			<!-- //Loop -->
		</ul>
	</div>
	<!-- //goods list -->

</section>
<!-- //main contents -->
<%@include file="footer.jsp" %>