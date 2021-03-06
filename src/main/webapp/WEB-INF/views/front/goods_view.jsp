<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

$(document).ready(function(){
	$('#cart_amt').focusout(function(event){
		var cart_amt = $(this).val();
		var i_no = $('#i_no').val();
		$.ajax({
			url : 'check_stock.do',
			data : { 'cart_amt' : cart_amt, 'i_no' : i_no },
			success : function(data){
				var json = eval(data);
				if(json[0].result == 'fail'){
					swal({
						text : "재고량 보다 많은 수량을 입력하셨습니다.",
						icon : "info"
					}).then((value) =>{
						$("#cart_amt").focus();
					});
				}
			}
		});
	});
});

function modify_review(eval_no){
	$.ajax({
		url : 'eval_one.do',
		data: {'eval_no' : eval_no},
	    dataType: "json",
		success:function(data){
			var json = eval(data);
			
			$('#mod_eval_title').val(json[0].eval_title);
			$('#mod_eval_content').val(json[0].eval_content);
		}
	})
}

function add_cart(f){
	
	var i_no = f.i_no.value;
	var cart_amt = f.cart_amt.value;

	if(cart_amt==''){
		alert('수량을 입력해주세요');
		return;
	}
	if(i_no==''){
		alert('옵션을 선택해주세요');
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
						icon : "info",
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
				}).then((willMove) =>{
					if(willMove){
						location.href = 'cart_view.do?m_id=${ user.m_id }';
					}
				})

			}
		});
	}
}

function demand_one(f){
	
	var cart_amt = f.cart_amt.value;
	var option = f.i_no.value;
	
	if('${ empty sessionScope.user }'=='true'){
		swal({
			text : "로그인을 해주세요!",
			icon : "info"
		}).then((value) =>{
			$("#loginPop").modal();
		});
		return;
		}
	if(cart_amt==''){
		swal({
			text : "수량을 입력해주세요!",
			icon : "info"
		})
		return;
	}
	if(option==''){
		swal({
			text : "옵션을 선택해주세요!",
			icon : "info"
		})
		return;
	}
	

	swal({
		text : "선택하신 상품을 주문하시겠습니까?",
		icon : "info",
		buttons : true,
	}).then((willMove) =>{
		if(willMove){
			f.action="demand_one.do";
			f.submit();
		}
	});
} 

function eval_insert(f){
	var eval_title = f.eval_title.value;
	var eval_content = f.eval_content.value;
	
	if(eval_title ==''){
		alert('상품평 제목을 입력해주세요')
		f.eval_title.focus();
	}
	if(eval_content==''){
		alert('상품평 내용을 입력해주세요')
		f.eval_content.focus();
	}
	
	f.action="insert_eval.do";
	f.submit();
	
}

var star = "";

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
				<input type="hidden" value="${ user.m_id }" name="m_id">
					<div class="form-group goCategory">
                                 <div class="starRating mt5" id="total_eval_score">
                                 	<div id="product_star"></div>
                                 	<script>
                                 		var starCount = ${ avg_score };
                                 		var star = "";
                                 		for(var i=0;i<starCount;i++){
                                 			star = star+"★";
                                 		}
                                 		$("#product_star").text(star);
                                 	</script>
						</div>
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
                                 
                                 <c:if test="${ not empty items_option }">
                                  <select class="form-control wAuto right mt5"  id="i_no" name="i_no">
                                  	<c:forEach var ="items_option" items="${ items_option }">
                                      		<option value="${ items_option.i_no }">색상: ${ items_option.color_name } / 사이즈: ${ items_option.size_name } / 재고수량: ${ items_option.s_amt }개</option>
                                     	</c:forEach>
                                  </select>
                                	</c:if>
                                 <c:if test="${ empty items_option }">
                               		<strong class="ml20 ftRed">판매가 완료된 상품입니다</strong>
                               	</c:if>
                             </div>
                             <div class="form-group">
                                 <label class="block">수량(개)</label>
                                 <input type="number" class="form-control wAuto right text-right mt5" placeholder="수량" id="cart_amt" name="cart_amt" value="1" />
								<script>
								if(${ empty items_option }) $("#cart_amt").attr("readonly", true).val("");
								</script>
                             </div>
					<div class="form-group goPrice">
						<del>${ vo.p_price }</del>
						<strong class="ml20">${ vo.p_sale }원</strong>
					</div>
					<div class="form-group btnBox">
					    <button type="button" id="sendCart" class="btn btn-warning" onclick="add_cart(this.form);"><i class="fa fa-shopping-cart ftWhite"></i> 장바구니</button>
					    <button type="button" id="sendSale" class="btn btn-primary" onclick="demand_one(this.form);return false;"><i class="fa fa-credit-card ftWhite"></i> 구매하기</button>
						<script>
						if(${ empty items_option }){
							$("#sendCart, #sendSale").hide();
						}
						</script>
						<c:if test="${ empty items_option }">
							<strong>판매가 완료됬어요 ㅠㅠ</strong>
						</c:if>
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
			<c:if test="${ not empty possible_eval }">
			<form action="">
			<input type="hidden" value="${ vo.p_no }" name="p_no">
			<input type="hidden" value="${ user.m_id }" name="m_id">
				<div class="mt40">
					<div class="form-group">
						<div class="starRating mt5" id="eval_score" name="eval_score">
							<label for="star01" class="on">★</label><input type="radio" id="star01" name="eval_score" value="1" />
							<label for="star02" class="on">★</label><input type="radio" id="star02" name="eval_score" value="2" />
							<label for="star03" class="on">★</label><input type="radio" id="star03" name="eval_score" value="3" checked />
							<label for="star04">★</label><input type="radio" id="star04" name="eval_score" value="4" />
							<label for="star05">★</label><input type="radio" id="star05" name="eval_score" value="5" />
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="상품평 제목" id="eval_title" name="eval_title"/>
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="5" placeholder="상품평 내용" id="eval_content" name="eval_content"></textarea>
					</div>
					<div class="form-group btnBox">
						<button type="button" class="btn btn-primary" onclick="eval_insert(this.form);">상품평 등록</button>
					</div>
				</div>
			</form>
			</c:if>
			<div class="mt40">
				<c:forEach var="items_eval" items="${ items_eval }">
				<c:if test="${ items_eval.p_no == vo.p_no }">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<h4 class="pull-left">
								<a data-toggle="collapse" href="#gReview${items_eval.eval_no}" class="block">${ items_eval.eval_title }</a>
								<small>${ items_eval.m_id }</small>
								<span id="personal_eval_${ items_eval.eval_no }"></span>
	                                  	<script>
	                                  		var starCount = ${ items_eval.eval_score };
	                                  		star = "";
	                                  		for(var i=0;i<starCount;i++){
	                                  			star = star+"★";
	                                  		}
	                                  		$("#personal_eval_${ items_eval.eval_no }").text(star);
	                                  	</script>
							</h4>
							<c:if test="${ user.m_id == items_eval.m_id }">
							<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop" onclick="modify_review(${items_eval.eval_no})">수정</button> <!-- 등록자 or 관리자만 노출 -->
							</c:if>
							<div class="pull-right">${ items_eval.eval_regdate }</div>
						</div>
					</div>
					<div id="gReview${items_eval.eval_no}" class="collapse">
						<div class="panel-body">
							<p>${ items_eval.eval_content }</p>
						</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
			</div>
		
			<!-- review popup -->
			<form action="">
			<div class="modal fade" id="reviewPop" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">상품평 수정</h4>
						</div>
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label for="" class="col-sm-2 col-xs-3 control-label">제목</label>
									<div class="col-sm-10 col-xs-9"><input type="text" class="form-control" placeholder="상품평 제목" value="상품평 제목" id="mod_eval_title"/></div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-2 col-xs-3 control-label">내용</label>
									<div class="col-sm-10 col-xs-9"><textarea class="form-control" rows="3" placeholder="상품평 내용" id="mod_eval_content">상품평 내용이 삽입됩니다.</textarea></div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-2 col-xs-3 control-label">별점</label>
									<div class="starRating mt5 col-sm-10 col-xs-9">
										<label for="star06" class="on">★</label><input type="radio" id="star06" name="eval_score" value="1" />
										<label for="star07" class="on">★</label><input type="radio" id="star07" name="eval_score" value="2" />
										<label for="star08" class="on">★</label><input type="radio" id="star08" name="eval_score" value="3" checked />
										<label for="star09">★</label><input type="radio" id="star09" name="eval_score" value="4" />
										<label for="star10">★</label><input type="radio" id="star10" name="eval_score" value="5" />
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">수정</button>
						</div>
					</div>
				</div>
			</div>
			</form>
			<!-- //review popup -->
		</div>
		<!-- // 상품평 -->
	</div>
	<!-- //상품 상세 -->
</section>
<!-- //sub contents -->
<%@include file="template/footer.jsp" %>