<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
			<c:forEach var="list" items="${p_list}">
			<li class="col-md-3 col-xs-6">
				<div class="imgBox">
					<a href="goods_view.html"><img src="http://placehold.it/300x300" alt="상품" class="wFull" /></a>
					<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
				</div>
				<div class="txtBox">
					<h4><c:out value="${list.p_name}" /></h4>
					<span>&#x20a9;<c:out value="${list.p_price}" /></span>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<!-- //goods list -->

</section>
<!-- //sub contents -->
<%@include file="template/footer.jsp" %>