<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file= "template/header.jsp"%>

<!-- visual -->
<section class="subVisual">
    <h2>주문 상세</h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_order.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_order.jpg" alt="sub visual" class="imgMobile" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
<!-- 주문확인 -->
	<div class="orderList table-reponsive mt10">
	    <table class="table table-hover">
	        <thead>
	            <tr>
	                <th>상품이미지</th>
	                <th>상품이름</th>
	                <th>수량</th>
	                <th>상품금액</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td><a href="items_view.do?p_no=${ vo.p_no }"><img src="${ pageContext.request.contextPath }/resources/upload/${vo.p_image_m}" alt="product thumbnail" /></a></td>
                    <td><a href="items_view.do?p_no=${ vo.p_no }">${vo.p_name}</a></td>
	                <td>${vo.o_amt}개</td>
	                <td><strong class="ftRed">${vo.o_pay_amt}원</strong></td>
	            </tr>
	        </tbody>
	    </table>
	</div>
	<!-- //주문확인 -->
	
	<!-- 주문하기  -->
	<form role="form" class="form-horizontal widthM mt40">
	    <div class="form-group mt10">
	        <label class="col-lg-3 control-label">상태</label>
	        <div class="col-lg-3">
               <c:choose>
                   <c:when test="${vo.o_status == 0}"><strong class="block ftRed mt5 ft16">결제대기</strong></c:when>
                   <c:when test="${vo.o_status == 1}"><strong class="block ftBlue mt5 ft16">결제완료</strong></c:when>
                   <c:when test="${vo.o_status == 2}"><strong class="block ftBlue mt5 ft16">배송중</strong></c:when>
                   <c:when test="${vo.o_status == 3}"><strong class="block ftGreen mt5 ft16">배송완료</strong></c:when>
                   <c:when test="${vo.o_status == 4}"><strong class="block ftRed mt5 ft16">배송취소</strong></c:when>
                   <c:when test="${vo.o_status == 5}"><strong class="block ftRed mt5 ft16">주문취소</strong></c:when>
               </c:choose>
	        </div>
	    </div>
	    <div class="form-group mt10">
	        <label class="col-lg-3 control-label">결제금액(원)</label>
	        <div class="col-lg-3"><input type="text" class="form-control" value="${vo.o_pay_amt}" readonly /></div>
	    </div>
	    <div class="form-group mt10">
	        <label class="col-lg-3 control-label">결제방법</label>
	        <div class="col-lg-9">
	            <label><input type="radio" checked /> 무통장입금</label>
	            <strong class="ml10">신한은행 / 123-456-78910 / 박경민</strong>
	        </div>
	    </div>
	
	    <!-- 배송지 정보는 회원의 db에서 가져오기 -->
	    <div class="form-group">
	        <label class="col-lg-3 control-label">배송지 주소</label>
	        <div class="col-lg-4"><input type="text" id="addressNumber" class="form-control" placeholder="우편번호" value="${vo.o_zipcode}" readonly /></div>
	    </div>
	    <div class="form-group">
	        <div class="col-lg-offset-3 col-lg-7"><input type="text" id="address" class="form-control" placeholder="지번주소" value="${vo.o_addr}" readonly /></div>
	    </div>
	    <div class="form-group">
	        <div class="col-lg-offset-3 col-lg-7"><input type="text" id="address2" class="form-control" placeholder="상세주소" value="${vo.o_addr_d}" readonly /></div>
	    </div>
	    <div class="form-group">
	        <label class="col-lg-3 control-label">배송지 연락처</label>
	        <div class="col-lg-3"><input type="text" placeholder="숫자만 기입" class="form-control" value="${vo.o_tel}" readonly /></div>
	    </div>
	
	    <div class="form-group">
	        <label class="col-lg-3 control-label">기타사항</label>
	        <div class="col-lg-9"><textarea class="form-control" placeholder="기타사항" rows="6" readonly>${vo.o_remarks}</textarea></div>
	    </div>
	</form>
	<!-- //주문하기 -->
</section>
<!-- //sub contents -->

<%@include file= "template/footer.jsp"%>