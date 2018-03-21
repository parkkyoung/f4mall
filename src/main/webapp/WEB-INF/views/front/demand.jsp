<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function demand_insert(f){
	var m_zipcode = f.m_zipcode.value;
	var m_addr = f.m_addr.value;
	var m_addr_d = f.m_addr_d.value;
	var o_tel = f.cellphone.value;
	var m_name = f.m_name.value;
	
	if(m_zipcode ==''){
		alert('우편번호를 입력해주세요');
		f.addressNumber.focus();
		return;
	}
	if(m_name ==''){
		alert('받으시는 분 성함을 입력해주세요');
		f.addressNumber.focus();
		return;
	}
	if(m_addr == ''){
		alert('지번주소를 입력해주세요');
		f.address.focus();
		return;
	}
	if(m_addr_d == ''){
		alert('상세주소를 입력해주세요');
		f.address2.focus();
		return;
	}
	if(o_tel == ''){
		alert('연락처를 입력해주세요');
		f.cellphone.focus();
		return;
	}
	
	f.action="demand_insert.do";
	f.submit();
}

<!-- 다음 우편 -->
function findAddress() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('m_addr').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('m_addr_d').focus();
		}
	}).open();
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
						<label class="col-lg-3 control-label">받으시는 분</label>
						<div class="col-lg-offset-3 col-lg-7"><input type="text" id="m_name" class="form-control" placeholder="받으시는 분" value="${ user.m_name }" name="o_name" /></div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">배송지 주소</label>
						<div class="col-lg-4"><input type="text" id="m_zipcode" class="form-control" placeholder="우편번호" value="${ user.m_zipcode }" name="o_zipcode" readonly /></div>
						<div class="col-lg-3"><button type="button" class="btn btn-primary" onclick="findAddress();">주소찾기</button></div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-7"><input type="text" id="m_addr" class="form-control" placeholder="지번주소" value="${ user.m_addr }" name="o_addr" /></div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-7"><input type="text" id="m_addr_d" class="form-control" placeholder="상세주소" value="${ user.m_addr_d }" name="o_addr_d" /></div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">배송지 연락처</label>
						<div class="col-lg-3"><input type="text" placeholder="숫자만 기입" class="form-control" value="${ user.m_tel }" name="o_tel" id="cellphone"/></div>
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