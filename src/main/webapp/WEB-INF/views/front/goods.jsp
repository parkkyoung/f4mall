<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp" %>

<!-- visual -->
<section class="subVisual">
    
    <%-- 카테고리별 --%>
    <c:if test="${not empty param.category_name}">
    <h2><c:out value="${param.category_name}"/></h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_<c:out value='${param.category_name}'/>.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_<c:out value='${param.category_name}'/>.jpg" alt="sub visual" class="imgMobile" />
    </c:if>
    
    <%-- 성별 --%>
    <c:if test="${not empty param.sex_name}">
    <h2><c:out value="${param.sex_name}"/></h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_<c:out value='${param.sex_name}'/>.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_<c:out value='${param.sex_name}'/>.jpg" alt="sub visual" class="imgMobile" />
    </c:if>
    
    <%-- 브랜드별 --%>
    <c:if test="${not empty param.brand_name}">
    <h2><c:out value="${param.brand_name}"/></h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_default.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_default.jpg" alt="sub visual" class="imgMobile" />
    </c:if>
    
    <%-- 이 외 기본 --%>
    <c:if test="${empty param.category_name and empty param.sex_name and empty param.brand_name}">
    <h2>SHOES</h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_default.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_default.jpg" alt="sub visual" class="imgMobile" />
    </c:if>
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
	<!-- goods list -->
	<div class="productList">
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