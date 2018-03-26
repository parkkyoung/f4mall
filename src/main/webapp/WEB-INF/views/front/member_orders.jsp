<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file= "template/header.jsp"%>

<script>
function order_cancel(o_no, m_id){
	swal({
		text : "정말 주문을 취소하시겠습니까?",
		icon : "info",
		buttons : true
	}).then((willCancel) => {
		if(willCancel) location.href = "order_cancel.do?o_no="+o_no+"&m_id="+m_id;
	});
}
</script>

<!-- visual -->
<section class="subVisual">
    <h2>주문목록</h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_order.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_order.jpg" alt="sub visual" class="imgMobile" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
   
	<!-- 주문목록 -->
	<div class="orderList table-reponsive">
	    <table class="table table-hover">
	        <thead>
	            <tr>
	                <th>상태</th>
	                <th class="mHide">주문일자</th>
	                <th class="mHide">상품이미지</th>
	                <th>상품이름</th>
	                <th class="mHide">수량</th>
	                <th class="mHide">결제금액</th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="list" items="${d_list}">
	            <tr>
	                <td>
	                   <c:choose>
                           <c:when test="${list.o_status == 0}"><span class="ftRed">결제대기</span></c:when>
                           <c:when test="${list.o_status == 1}"><span class="ftBlue">결제완료</span></c:when>
                           <c:when test="${list.o_status == 2}"><span class="ftBlue">배송중</span></c:when>
                           <c:when test="${list.o_status == 3}"><span class="ftGreen">배송완료</span></c:when>
                           <c:when test="${list.o_status == 4}">배송취소</c:when>
                           <c:when test="${list.o_status == 5}">주문취소</c:when>
	                   </c:choose>
	                </td>
	                <td class="mHide"><c:out value="${list.o_regdate}" /></td>
	                <td class="mHide"><a href="items_view.do?p_no=${ list.p_no }"><img src="${ pageContext.request.contextPath }/resources/upload/${list.p_image_m}" alt="product thumbnail" /></a></td>
	                <td><a href="items_view.do?p_no=${ list.p_no }"><c:out value="${list.p_name}" /></a></td>
	                <td class="mHide"><c:out value="${list.o_amt}" /></td>
	                <td class="mHide"><strong class="ftRed"><c:out value="${list.o_pay_amt}" />원</strong></td>
	                <td>
	                    <button type="button" class="btn btn-default btn-sm block" onclick="location.href='member_order.do?o_no=${list.o_no}'">주문정보</button>
	                    <c:if test="${list.o_status == 0}">
	                        <button type="button" class="btn btn-danger btn-sm block mt5" onclick="order_cancel(${list.o_no}, '${user.m_id}');">주문취소</button>
	                    </c:if>
	                </td>
	            </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
	<!-- //주문목록 -->
</section>
<!-- //sub contents -->

<%@include file= "template/footer.jsp"%>