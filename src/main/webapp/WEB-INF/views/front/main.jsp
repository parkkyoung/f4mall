<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="template/header.jsp" %>
			
<!-- visual -->
<section class="mainVisual">
	<video autoplay="" muted="" preload="true" loop="" class="wFull"><source src="${ pageContext.request.contextPath }/resources/front/img/visual.mp4" type="video/mp4"></video>
</section>
<!-- //visual -->

<!-- main contents -->
<section class="main container">
	<h2 class="hide">메인</h2>
	
	<!-- 성별 카테고리 -->
	<div class="mainSex">
		<ul class="row">
			<li class="col-sm-4 col-xs-12">
				<a href="product_list.do?sex_name=men">
					<img src="${ pageContext.request.contextPath }/resources/front/img/img_main_sex1.jpg" alt="Sex MEN" class="wFull" />
					<span>MEN</span>
				</a>
			</li>
			<li class="col-sm-4 col-xs-12">
				<a href="product_list.do?sex_name=unisex">
					<img src="${ pageContext.request.contextPath }/resources/front/img/img_main_sex2.jpg" alt="Sex Unisex" class="wFull" />
					<span>UNISEX</span>
				</a>
			</li>
			<li class="col-sm-4 col-xs-12">
				<a href="product_list.do?sex_name=women">
					<img src="${ pageContext.request.contextPath }/resources/front/img/img_main_sex3.jpg" alt="Sex Women" class="wFull" />
					<span>WOMEN</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- //성별 카테고리 -->

    <!-- NIKE -->
    <div class="banner mt40"><a href="product_list.do?brand_name=nike"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner01.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">NIKE</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list01 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //NIKE -->

    <!-- ADIDAS -->
    <div class="banner mt40"><a href="product_list.do?brand_name=adidas"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner02.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">ADIDAS</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list02 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                    <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //ADIDAS -->

    <!-- NEWBALANCE -->
    <div class="banner mt40"><a href="product_list.do?brand_name=newbalance"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner03.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">NEWBALANCE</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list03 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //NEWBALANCE -->

    <!-- SODA -->
    <div class="banner mt40"><a href="product_list.do?brand_name=soda"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner04.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">SODA</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list04 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //SODA -->

    <!-- FERRAGAMO -->
    <div class="banner mt40"><a href="product_list.do?brand_name=ferragamo"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner05.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">FERRAGAMO</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list05 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //FERRAGAMO -->

    <!-- KUMKANG -->
    <div class="banner mt40"><a href="product_list.do?brand_name=kumkang"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner06.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">KUMKANG</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list06 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //KUMKANG -->

    <!-- CHRISTIAN LOUBOUTIN -->
    <div class="banner mt40"><a href="product_list.do?brand_name=christian louboutin"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner07.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">CHRISTIAN LOUBOUTIN</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list07 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //CHRISTIAN LOUBOUTIN -->

    <!-- ELCANTO -->
    <div class="banner mt40"><a href="product_list.do?brand_name=elcanto"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner08.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">ELCANTO</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list08 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //ELCANTO -->

    <!-- RACHELCOX -->
    <div class="banner mt40"><a href="product_list.do?brand_name=rachelcox"><img src="${ pageContext.request.contextPath }/resources/front/img/banner/img_main_banner09.jpg" alt="banner" class="wFull" /></a></div>
    <div class="productList mt40">
        <h3 class="hide">RACHELCOX</h3>
        <ul class="row">
        
            <c:forEach var="list" items="${ list09 }" begin="0" end="3">
            <li class="col-md-3 col-xs-6">
                <div class="imgBox">
                    <a href="items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }"><img src="${ pageContext.request.contextPath }/resources/upload/${ list.p_image_m }" alt="상품" class="wFull" /></a>
                   <button type="button" class="btnCart" onclick="location.href='items_view.do?p_no=${ list.p_no }&m_id=${ user.m_id }'"><i class="fa fa-shopping-cart"></i></button>
                </div>
                <div class="txtBox">
                    <h4>${ list.p_name }</h4>
                    <span>&#x20a9;<fmt:formatNumber value="${ list.p_price }"/></span>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
    <!-- //RACHELCOX -->
    
</section>
<!-- //main contents -->
<%@include file="template/footer.jsp" %>