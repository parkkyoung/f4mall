<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file= "template/header.jsp"%>

<!-- contents -->
		<div id="container">
			
			<!-- visual -->
			<section class="subVisual">
				<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">장바구니</h2>

				<!-- 장바구니 -->
				<div class="orderList table-reponsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" class="checkController" data-controller="checkAll"></th>
								<th>상품이미지</th>
								<th>상품이름</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>할인금액</th>
								<th>담은날</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<!-- Loop -->
							
						<c:forEach var="cart" items="c_view">
							<tr>
								<td><input type="checkbox" class="checkMember" data-target="checkAll"></td>
								<td><a href=""><img src="http://placehold.it/150x150" alt="" /></a></td>
								<td><a href="">${ cart.p_name }</a></td>
								<td><input type="number" value="1" class="form-control inBlock w50 text-center" /></td>
								<td><del>${ cart.p_price }</del>원</td>
								<td><strong class="ftRed">${ cart.p_sale }원</strong></td>
								<td>YYYY-MM-DD</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<!-- //Loop -->
							<!-- <tr>
								<td><input type="checkbox" class="checkMember" data-target="checkAll"></td>
								<td><a href=""><img src="http://placehold.it/150x150" alt="" /></a></td>
								<td><a href="">나이키신발</a></td>
								<td><input type="number" value="1" class="form-control inBlock w50 text-center" /></td>
								<td><del>20,000</del>원</td>
								<td><strong class="ftRed">10,000원</strong></td>
								<td>YYYY-MM-DD</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr> -->
						</c:forEach>
						</tbody>
					</table>
					<div class="btnBox">
						<button type="button" class="btn btn-primary" onclick="location.href='order.html';">구매하기</button>
					</div>
				</div>
				<!-- //장바구니 -->

			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->
		
		<%@include file="template/footer.jsp" %>