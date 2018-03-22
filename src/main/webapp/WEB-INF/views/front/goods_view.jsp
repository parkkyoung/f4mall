<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>
<script>
function add_cart(f){
	
	var i_no = f.i_no.value;
	var cart_amt = f.cart_amt.value;
	if(cart_amt==''){
		alert('수량을 입력해주세요');
		return;
	}
	
	if('${ empty sessionScope.user }'=='true'){
		swal({
			text : "로그인을 해주세요!",
			icon : "info"
		}).then((value) =>{
			$("#loginPop").modal();
		})
	} else {
		var param = { 'i_no' : i_no, 'm_id' : '${ user.m_id }', 'cart_amt' : cart_amt };
		$.ajax({
			url : 'cart_insert.do',
			data: param,
			success:function(data){
				var json = eval(data);
				//json =[{'result':'success'}];
				if(json[0].result == 'fail'){
					swal({
						text : "이미 장바구니에 있는 상품입니다. 장바구니 목록으로 이동하시겠습니까?.",
						icon : "error",
						buttons : true,
						dangerMode: true,
					}).then((willMove) =>{
						if(willMove){
							location.href = 'cart_view.do?m_id=${ user.m_id }';
						}
					});
					return;
				}
				swal({
					text : "장바구니에 담았습니다. 장바구니 목록으로 이동하시겠습니까?",
					icon : "success",
					buttons : true,
					dangerMode: true,
				}).then((willMove) =>{
					if(willMove){
						location.href = 'cart_view.do?m_id=${ user.m_id }';
					}
				})

			}
		});
	}
}
</script>
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">상품상세</h2>

				<!-- 상품 상세 -->
				<div class="product">

					<!-- 상품 head -->
					<div class="row">

						<!-- 상품 이미지 -->
						<div class="col-sm-6">
                            <img src="${ pageContext.request.contextPath }/resources/upload/<c:out value="${vo.p_image_s}" />" alt="상품" class="wFull" />
						</div>
						<!-- //상품 이미지 -->

						<!-- 옵션 -->
						<div class="col-sm-6">
							<form action="" class="productOption">
								<div class="form-group goCategory">
                                    <div>★★★★★</div>
									<span>상품번호 : ${ vo.p_no }</span>
								</div>
								<div class="form-group goTitle">
									<h3>${ vo.p_name }</h3>
								</div>
								<div class="form-group">
                                    <div class="inBlock ml20">
                                       <label>제조국가</label>
                                       <div class="mt5">${ vo.p_country }</div>
                                    </div>
                                    <div class="inBlock ml20">
                                       <label>제조일자</label>
                                       <div class="mt5">${ vo.p_pdate }</div>
                                    </div>
								</div>
                                <div class="form-group">
                                    <label class="block">옵션</label>
                                    <select class="form-control wAuto right mt5"  id="i_no" name="i_no">
                                        <c:forEach var ="items_option" items="${ items_option }">
                                        <option value="${ items_option.i_no }">색상: ${ items_option.color_name } / 사이즈: ${ items_option.size_name } / 재고수량: ${ items_option.s_amt }개</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="block">수량(개)</label>
                                    <input type="number" class="form-control wAuto right text-right mt5" placeholder="수량" value="1" id="cart_amt" name="cart_amt"/>
                                </div>
								<div class="form-group goPrice">
									<del>${ vo.p_price }</del>
									<strong class="ml20">${ vo.p_sale }원</strong>
								</div>
								<div class="form-group btnBox">
								    <button type="button" class="btn btn-warning" onclick="add_cart(this.form);"><i class="fa fa-shopping-cart ftWhite"></i> 장바구니</button>
								    <button type="button" class="btn btn-primary"><i class="fa fa-credit-card ftWhite"></i> 구매하기</button>
								</div>
							</form>
						</div>
						<!-- //옵션 -->
					</div>
					<!-- //상품 head -->

					<!-- 상품설명 -->
					<div class="mt40">
						${vo.p_content }
					</div>
					<!-- //상품설명 -->

					<!-- 상품평 -->
					<div class="panel-group">
						
						<h3 class="hide">상품평</h3>

						<!-- 상품평 컨텐츠의 아이디와 상품평 타이틀의 href에 해당 상품평 넘버를 삽입 -->
						
						
						<%-- <!-- Loop -->
						<c:forEach var="items_eval" items="items_eval">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title">
									<h4 class="pull-left">
										<a data-toggle="collapse" href="#gReview01" class="block">${ items_eval.eval_title }</a>
										<small>${ eval.m_id }</small>
									</h4>
									<c:if test="${ user.m_id } == ${ items_eval.m_id }">
									<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop">수정</button> <!-- 등록자 or 관리자만 노출 -->
									</c:if>
									<div class="pull-right">${ items_eval.eval_regdate }</div>
								</div>
							</div>
							<div id="gReview01" class="collapse">
								<div class="panel-body">
									<p>${ items_eval.eval_content }</p>
								</div>
							</div>
						</div>
						</c:forEach> --%>
						<!-- //Loop -->
<!-- 

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title">
									<h4 class="pull-left">
										<a data-toggle="collapse" href="#gReview02" class="block">상품평 타이틀입니다.2</a>
										<small>작성자2</small>
									</h4>
									<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop">수정</button> 등록자 or 관리자만 노출
									<div class="pull-right">2018-03-01</div>
								</div>
							</div>
							<div id="gReview02" class="collapse">
								<div class="panel-body">
									<p>상품평 컨텐츠입니다.2</p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title">
									<h4 class="pull-left">
										<a data-toggle="collapse" href="#gReview03" class="block">상품평 타이틀입니다.3</a>
										<small>작성자3</small>
									</h4>
									<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop">수정</button> 등록자 or 관리자만 노출
									<div class="pull-right">2018-03-01</div>
								</div>
							</div>
							<div id="gReview03" class="collapse">
								<div class="panel-body">
									<p>상품평 컨텐츠입니다.</p>
								</div>
							</div>
						</div>

					</div> -->
					<!-- //상품평 -->
				</div>
				<!-- //상품 상세 -->

			</section>
			<!-- //sub contents -->
		</div>
		<%@include file="template/footer.jsp" %>