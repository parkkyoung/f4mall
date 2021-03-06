<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file= "template/header.jsp"%>

<script>
function demand_list(f){
	
	var checked=false;
	
	if(f.i_no.length==undefined){
		checked = f.i_no.checked;
	}else{
		for(var i=0; i<f.i_no.length; i++){
			if(f.i_no[i].checked){
				checked = true;
				break;
			}
		}
	}
	if(checked == false){
		alert('주문하실 상품을 입력해주세요.');
		return;
	}
	
	if(confirm('장바구니에 있는 상품들을 주문하시겠습니까?')==false)return;
	
	f.action="demand_list.do";
	f.submit();
	
	
} 

function update_cart(i_no,cart_amt_i_no){
	var cart_amt = document.getElementById(cart_amt_i_no).value;
	console.log(cart_amt);
	$.ajax({
		url : 'check_stock.do',
		data : { 'cart_amt' : cart_amt, 'i_no' : i_no, 'm_id' : '${ user.m_id }' },
		success : function(data){
			var json = eval(data);
			if(json[0].result == 'fail'){
				swal({
					text : "재고량 보다 많은 수량을 입력하셨습니다.",
					icon : "info"
				}).then((value) =>{
					location.href="update_cart.do?i_no=" + i_no + "&m_id=" + encodeURIComponent('${ user.m_id }') + "&cart_amt=" + document.getElementById(cart_amt_i_no).value;
				});
			}
		}
	});
}

</script>

<!-- visual -->
<section class="subVisual">
	<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
	<h2 class="hide">장바구니</h2>

	<!-- 장바구니 -->
	<form>
	<input type="hidden" name="m_id" value="${ user.m_id }">
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
				
				<c:forEach var="cart" items="${ c_view }">
					<tr>
						<td><input type="checkbox" class="checkMember" data-target="checkAll" name="i_no" id="i_no" value="${ cart.i_no }"></td>
						<td><a href=""><img src="${ pageContext.request.contextPath }/resources/upload/${ cart.p_image_m }" alt="" /></a></td>
						<td><a href="">${ cart.p_name }</a><br>
									[${ cart.color_name }] ,${ cart.size_name }</td>
						<td>
						      <input type="number" value="${ cart.cart_amt }" id="cart_amt_${ cart.i_no }" class="form-control inBlock w50 text-center" /><br>
						      <input type="button" value="수정" class="btn btn-primary" onclick="update_cart('${ cart.i_no }','cart_amt_${ cart.i_no }'); return false;">
						</td>
						
						<td><del>${ cart.p_price }</del>원</td>
						<td><strong class="ftRed">${ cart.p_sale }원</strong></td>
						<td>${ cart.cart_regdate }</td>
                        <td><button type="button" class="btn btn-danger" onclick="delete_cart(${ cart.cart_no }, '${ cart.m_id }');">삭제</button></td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
			<div class="btnBox">
				<button type="button" class="btn btn-primary" onclick="demand_list(this.form);return false;">구매하기</button>
			</div>
			
	</div>
	</form>
	<!-- //장바구니 -->

</section>
<!-- //sub contents -->
		
<%@include file="template/footer.jsp" %>