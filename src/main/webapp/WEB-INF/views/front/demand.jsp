<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function demand_insert(f){
	f.action="demand_insert.do";
	f.submit();
}
</script>

		<!-- contents -->
		<div id="container">
			
			<!-- visual -->
			<section class="subVisual">
				<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<section class="sub container">
			<form role="form" class="form-horizontal widthM" action="">
			<input type="hidden" name="m_id" value=${ user.m_id }>
				<h2 class="hide">주문하기</h2>

				<!-- 주문확인 -->
				<h3>주문정보</h3>
				<div class="orderList table-reponsive mt10">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>상품이미지</th>
								<th>상품이름</th>
								<th>수량</th>
								<th>총상품금액</th>
								<th>총할인금액</th>
							</tr>
						</thead>
						<tbody>
							<!-- Loop -->
							<c:forEach var="d_list" items="${ d_list }">
							<input type="hidden" name="i_no" value="${ d_list.i_no }">
							<input type="hidden" name="cart_amt" value="${ d_list.cart_amt }">
							<tr>
								<td><a href=""><img src="${ pageContext.request.contextPath }/resources/front/img/sample/${ d_list.p_image_m }" alt="" /></a></td>
								<td><a href="">${ d_list.p_name }</a><br>
									[${ d_list.color_name }] ,${ d_list.size_name }</td>
								<td><input type="text" value="${ d_list.cart_amt }" class="form-control inBlock w50 text-center" readonly/></td>
								<td><del>${ d_list.price_total }</del>원</td>
								<td><strong class="ftRed">${ d_list.sale_total }원</strong></td>
							</tr>
							</c:forEach>
							<!-- //Loop -->
							<!-- <tr>
								<td><a href=""><img src="http://placehold.it/150x150" alt="" /></a></td>
								<td><a href="">나이키신발</a></td>
								<td><input type="number" value="1" class="form-control inBlock w50 text-center" /></td>
								<td><del>20,000</del>원</td>
								<td><strong class="ftRed">10,000원</strong></td>
							</tr> -->
						</tbody>
					</table>
				</div>
				<!-- //주문확인 -->
				
				<!-- 주문하기  -->
				<h3 class="mt40">정보 입력</h3>
				
					
					<div class="form-group mt10">
						<label class="col-lg-3 control-label">총결제금액(원)</label>
						<div class="col-lg-3"><input type="text" class="form-control" value="${ sales_price }" name="o_pay_amt" readonly /></div>
					</div>
					<div class="form-group mt10">
						<label class="col-lg-3 control-label">결제방법</label>
						<div class="col-lg-9">
							<label><input type="radio" name="o_payment" checked /> 무통장입금</label>
							<strong class="ml10">신한은행 / 123-456-78910 / 박경민</strong>
						</div>
					</div>

					<!-- 배송지 정보는 회원의 db에서 가져오기 -->
					<div class="form-group">
						<label class="col-lg-3 control-label">배송지 주소</label>
						<div class="col-lg-4"><input type="text" id="addressNumber" class="form-control" placeholder="우편번호" value="${ user.m_zipcode }" name="o_zipcode" readonly /></div>
						<div class="col-lg-3"><button type="button" class="btn btn-primary" onclick="findAddress();">주소찾기</button></div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-7"><input type="text" id="address" class="form-control" placeholder="지번주소" value="${ user.m_addr }" name="o_addr" /></div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-7"><input type="text" id="address2" class="form-control" placeholder="상세주소" value="${ user.m_addr_d }" name="o_addr_d" /></div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">배송지 연락처</label>
						<div class="col-lg-3"><input type="text" placeholder="숫자만 기입" class="form-control" value="${ user.m_tel }" name="o_tel"/></div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">기타사항</label>
						<div class="col-lg-9"><textarea class="form-control" placeholder="기타사항" rows="6" name="o_remarks"></textarea></div>
					</div>

					<div class="form-group btnBox">
						<button type="button" class="btn btn-default">취소</button>
						<button type="button" class="btn btn-primary" onclick="demand_insert(this.form);">구매하기</button>
					</div>
				</form>
				<!-- //주문하기 -->
			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->

<%@include file="template/footer.jsp"%>