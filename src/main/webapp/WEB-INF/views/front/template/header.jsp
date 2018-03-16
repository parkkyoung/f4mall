<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi">
<title>F4 Mall</title>

<!-- css -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> <!-- bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> <!-- font-awesome -->
<link href="${ pageContext.request.contextPath }/resources/front/css/flaticon.css" rel="stylesheet"> <!-- flaticon -->
<link href="${ pageContext.request.contextPath }/resources/front/css/menu.css" rel="stylesheet"> <!-- mobile left menu -->
<link href="${ pageContext.request.contextPath }/resources/front/css/common.css" rel="stylesheet"><!-- customizing -->

<!-- js -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <!-- jquery -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><!-- bootstrap -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweet alert -->
<script src="${ pageContext.request.contextPath }/resources/front/js/menu.js"></script><!-- mobile left menu -->
<script src="${ pageContext.request.contextPath }/resources/front/js/common.js"></script><!-- customizing -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

<!-- page script -->
<script>
	$(function() {
		// 게시판 리스트 말줄임
		var blSubjectWidth = 0;
		function blSubjectEllipsis() {
			if ($(window).width() > 767) {
				blSubjectWidth = $(".boardList").width() * 0.5 - 20;
				$(".blSubject a").css("width", blSubjectWidth);
			} else {
				blSubjectWidth = $(".boardList").width() * 0.7 - 20;
				$(".blSubject a").css("width", blSubjectWidth);
			}
		}
		;
		blSubjectEllipsis();
		$(window).resize(function() {
			blSubjectEllipsis();
		});
	});
    
	// 로그인
	function login(f) {
		var m_id = f.m_id.value;
		var m_pwd = f.m_pwd.value;

		if (m_id == '') {
			alert('아이디를 입력하세요');
			f.m_id.focus();
			return;
		}
		if (m_pwd == '') {
			alert('비밀번호를 입력하세요');
			f.m_pwd.focus();
			return;
		}

		$.ajax({
			url : 'login.do',
			data : {
				'm_id' : m_id,
				'm_pwd' : m_pwd
			},
			success : function(data) {
				var json = eval(data);
				if (json[0].result == 'yes') {
					swal({
						text : "로그인 성공.",
						icon : "success",
					}).then((value) => {
						location.href = '';
					});
				} else if (json[0].result == 'id_fail') {
					alert('아이디가 틀립니다');
					f.m_id.focus();
				} else if (json[0].result == 'pwd_fail') {
					alert('비밀번호가 틀립니다');
					f.m_pwd.focus();
				} else if (json[0].result == 'no') {
					alert('로그인 오류(다시 입력해주세요)');
					f.m_id.focus();
				}

			}
		});
	}
	
	// 로그아웃
	function logout(){
		swal({
			text : "로그아웃 하시겠습니까?",
			icon : "info",
			buttons : true
		}).then((willLogout) => {
			if(willLogout) location.href='logout.do';
		});
	};
</script>
</head>
<body>

	<!-- 스킵 네비게이션 -->
	<div class="skip-navi">
		<p>
			<a href="#container" tabindex="0">본문 바로가기</a>
		</p>
	</div>
	<!-- //스킵 네비게이션 -->
	
	<!-- cart popup -->
    <div class="modal fade" id="cartPop" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">장바구니</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="checkController" data-controller="checkAll"></th>
                                <th class="mHide">상품이미지</th>
                                <th>상품이름</th>
                                <th>수량</th>
                                <th class="mHide">상품금액</th>
                                <th>할인금액</th>
                                <th class="mHide">담은날</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Loop -->
                            <c:forEach var="header_cart" items="${ header_cart_list }">
                            <tr>
                                <td><input type="checkbox" class="checkMember" data-target="checkAll"></td>
                                <td class="mHide"><a href=""><img src="${ pageContext.request.contextPath }/resources/front/img/sample/${ header_cart.p_image_m }" alt="" /></a></td>
                                <td><a href="">${ header_cart.p_name }</a></td>
                                <td><input type="number" value="${ header_cart.cart_amt }" class="form-control inBlock text-center" /></td>
                                <td class="mHide"><del>${ header_cart.p_price }</del>원</td>
                                <td><strong class="ftRed">${ header_cart.p_sale }원</strong></td>
                                <td class="mHide">${ header_cart.cart_regdate }</td>
                                <td><button type="button" class="btn btn-danger btn-xs">삭제</button></td>
                            </tr>
                            </c:forEach>
                            <!-- //Loop -->
                            <!-- <tr>
                                <td><input type="checkbox" class="checkMember" data-target="checkAll"></td>
                                <td class="mHide"><a href=""><img src="http://placehold.it/50x50" alt="" /></a></td>
                                <td><a href="">나이키신발</a></td>
                                <td><input type="number" value="1" class="form-control inBlock text-center" /></td>
                                <td class="mHide"><del>20,000</del>원</td>
                                <td><strong class="ftRed">10,000원</strong></td>
                                <td class="mHide">YYYY-MM-DD</td>
                                <td><button type="button" class="btn btn-danger btn-xs">삭제</button></td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="location.href='order.html';">구매하기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- //cart popup -->

	<!-- Login popup -->
	<form>
		<div class="modal fade" id="loginPop" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">

							<!-- 로그인이 안되어 있을 경우에만 출력 -->
							<c:if test="${ empty user }">
								<div class="form-group">
									<label for="loginId" class="col-sm-2 col-xs-3 control-label">Email</label>
									<div class="col-sm-10 col-xs-9">
										<input type="email" class="form-control" id="m_id" name="m_id"
											placeholder="Email" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="loginPw" class="col-sm-2 col-xs-3 control-label">Password</label>
									<div class="col-sm-10 col-xs-9">
										<input type="password" class="form-control" id="m_pwd"
											name="m_pwd" placeholder="Password" value="">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10 col-xs-offset-3 col-xs-9">
										<div class="checkbox">
											<label><input type="checkbox"> Remember me</label>
										</div>
									</div>
								</div>
							</c:if>

						</div>
					</div>
					<div class="modal-footer">
						<p>관리자 계정</p>
						<p>admin@f4mall.com</p>
						<p>f4mall</p>
						<a href="member_join_clause.do" class="btn btn-warning">Join
							us</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary"
							onclick="login(this.form);">Login</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- //Login popup -->

	<!-- 모바일 gnb -->
	<nav id="c-menu--push-left" class="c-menu c-menu--push-left">
	<h3 class="hide">모바일 메뉴</h3>
	<button type="button" class="btnClose c-menu__close">GNB Close</button>


	<!-- 미 로그인 노출 -->
	<c:if test="${ empty user }">
	<div class="mHead tCenter">
		<button type="button" title="login" data-toggle="modal" data-target="#loginPop" class="btn btn-primary">로그인을 해주세요! <i class="fa fa-lock ftWhite"></i></button>
	</div>
	</c:if>
	<!-- 로그인 후에 노출 -->
	<c:if test="${ not empty user }">	
	<div class="mHead">
		<div class="imgBox">
			<img src="http://placehold.it/50x50" alt="profile" class="wFull" />
		</div>
		<div class="txtBox">
			<strong>[${ user.m_name }]</strong>님 어서오세요!
		</div>
	</div>
	</c:if>

	<div class="mContents">

		<!-- 개인정보 // 로그인 후에 노출 -->
		<c:if test="${ not empty user }">
		<div class="mList halfList">
            <dl>
                <dt>MY PAGE</dt>
                <dd><button type="button" data-toggle="modal" data-target="#cartPop"><i class="fa fa-shopping-cart"></i><div>장바구니</div></button></dd>
                <dd><a href="member_orders.do"><i class="fa fa-list-alt"></i><div>주문내역</div></a></dd>
                <dd><a href="member.do"><i class="fa fa-user"></i><div>회원정보</div></a></dd>
                <dd><button type="button" onclick="logout();"><i class="fa fa-unlock"></i><div>로그아웃</div></button></dd>
            </dl>
        </div>
		</c:if>
		<!-- //개인정보 -->

		<!-- category -->
		<div class="mList">
            <dl>
                <dt>CATEGORY</dt>
                <dd><a href="product_list.do"><i class="flaticon-sneaker"></i><div>RUNNINGS</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-sport-shoe"></i><div>SNEAKERS</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-men-shoe"></i><div>OXFORDS</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-hiking-boot"></i><div>WALKERS</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-high-heel-3"></i><div>HEELS</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-sandal"></i><div>SLIPPERS</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-football-shoe"></i><div>MEN</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-ugg-boot"></i><div>UNISEX</div></a></dd>
                <dd><a href="product_list.do"><i class="flaticon-girls-flat-shoe"></i><div>WOMEN</div></a></dd>
            </dl>
        </div>
		<!-- //category -->

		<!-- brand -->
		<div class="mList brandList">
            <dl>
                <dt>BRAND</dt>
                <dd class="brand01"><a href="product_list.do"><div>NIKE</div></a></dd>
                <dd class="brand02"><a href="product_list.do"><div>ADIDAS</div></a></dd>
                <dd class="brand03"><a href="product_list.do"><div>NEWBALANCE</div></a></dd>
                <dd class="brand04"><a href="product_list.do"><div>SODA</div></a></dd>
                <dd class="brand05"><a href="product_list.do"><div>FERRAGAMO</div></a></dd>
                <dd class="brand06"><a href="product_list.do"><div>KUMKANG</div></a></dd>
                <dd class="brand07"><a href="product_list.do"><div>CHRISTIAN LOUBOUTIN</div></a></dd>
                <dd class="brand08"><a href="product_list.do"><div>ELCANTO</div></a></dd>
                <dd class="brand09"><a href="product_list.do"><div>RACHELCOX</div></a></dd>
            </dl>
        </div>
		<!-- //brand -->
	</div>
	</nav>
	<!-- //모바일 gnb -->

	<div id="c-mask" class="c-mask"></div>
	<!-- /c-mask -->

	<div id="wrap" class="o-wrapper">

		<!-- header -->
		<header id="header">

		<div class="head">
			<button type="button" class="btnGnb">메뉴</button>
			<h1>
				<a href="index.do" title="HOME">F4 Mall</a>
			</h1>
			<div class="util">
				<input type="text" class="textSerch" />
				<button type="button" class="btnSerch">
					<i class="fa fa-search fa-w-16"></i>
				</button>
				
                <!-- 로그인 후에 노출 -->
				<c:if test="${ not empty user }">
				<button type="button" title="cart" data-toggle="modal" data-target="#cartPop"><i class="fa fa-shopping-cart"></i></button>
				<%-- <a href="cart_view.do?m_id=${ user.m_id }" title="cart"><i class="fa fa-shopping-cart"></i></a> --%>
				<a href="member.do" title="user"><i class="fa fa-user"></i></a>
				<button type="button" title="logout"><i class="fa fa-unlock" onclick="logout();"></i></button>
				</c:if>
				<!-- 로그인 후에 노출 -->
				
                <!-- 미 로그인 시에 노출 -->
                <c:if test="${ empty user }">
				<button type="button" title="login" data-toggle="modal" data-target="#loginPop"><i class="fa fa-lock"></i></button>
				</c:if>
                <!-- //미 로그인 시에 노출 -->
				
                <!-- 관리자 접속시에 노출 -->
				<c:if test="${ user.m_grade eq 1 }">
				<a href="admin/index.do"><i class="fa fa-wrench fa-w-16"></i></a>
				</c:if>
				
			</div>
		</div>

		<!-- pc gnb --> 
		<nav class="gnb">
		<ul>
			<li><a href="product_list.do">OUTER</a></li>
			<li><a href="product_list.do">SHIRTS</a></li>
			<li><a href="product_list.do">JEANS</a></li>
			<li><a href="product_list.do">SHOES</a></li>
			<li><a href="product_list.do">ACCESSORIES</a></li>
			<li><a href="product_list.do">CHILDE</a></li>
			<li class="active"><a href="profile.do">PROFILE</a></li>
            <li><a href="board_list.do">COMMUNITY</a></li>
            <li><a href="faq.do">FAQ</a></li>
		</ul>
		</nav> 
		<!-- //pc gnb --> 
		
		</header>
		<!-- //header -->

		<!-- contents -->
		<div id="container">