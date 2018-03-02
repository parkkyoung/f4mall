<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi">
	<title>F4 Mall</title>

	<!-- css -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> <!-- bootstrap -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> <!-- font-awesome -->
	<link href="${ pageContext.request.contextPath }/resources/f4/css/main/menu.css" rel="stylesheet"> <!-- mobile left menu -->
	<link href="${ pageContext.request.contextPath }/resources/f4/css/main/common.css" rel="stylesheet"> <!-- customizing -->

	<!-- js -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <!-- jquery -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- bootstrap -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweet alert -->
	<script src="${ pageContext.request.contextPath }/resources/f4/js/menu.js"></script> <!-- mobile left menu -->
	<script src="${ pageContext.request.contextPath }/resources/f4/js/common.js"></script> <!-- customizing -->

	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<script>
		$(function(){
			$(".btnCart").click(function(){
				swal({
					text : "장바구니에 저장되었습니다!",
					icon: "success",
				});
			});
		});
	</script>

</head>
<body>
	<!-- Login -->
	<div class="modal fade" id="loginPop" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="loginId" class="col-sm-2 col-xs-3 control-label">Email</label>
							<div class="col-sm-10 col-xs-9"><input type="email" class="form-control" id="loginId" placeholder="Email"></div>
						</div>
						<div class="form-group">
							<label for="loginPw" class="col-sm-2 col-xs-3 control-label">Password</label>
							<div class="col-sm-10 col-xs-9"><input type="password" class="form-control" id="loginPw" placeholder="Password"></div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10 col-xs-offset-3 col-xs-9">
								<div class="checkbox">
									<label><input type="checkbox"> Remember me</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="join.jsp" class="btn btn-warning">Join us</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Login</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //Login -->
	
	<!-- 모바일 gnb -->
	<nav id="c-menu--push-left" class="c-menu c-menu--push-left">
		<h3 class="hide">모바일 메뉴</h3>
		<button type="button" class="btnClose c-menu__close">GNB Close</button>

		
		<!-- 미 로그인 노출 -->
		<!-- <div class="mHead text-center">
			<button type="button" title="login" data-toggle="modal" data-target="#loginPop" class="btn btn-primary">로그인을 해주세요! <i class="fa fa-lock ftWhite"></i></button>
		</div> -->
		
		<!-- 로그인 후에 노출 -->
		<div class="mHead">
			<div class="imgBox"><img src="http://placehold.it/50x50" alt="profile" class="wFull" /></div>
			<div class="txtBox"><strong>박경민</strong>님 어서오세요!</div>
		</div>

		<div class="mContents">
			
			<!-- 개인정보 // 로그인 후에 노출 -->
			<div class="mList">
				<dl>
					<dt>MY PAGE</dt>
					<dd><a href=""><i class="fa fa-shopping-cart"></i><div>장바구니</div></a></dd>
					<dd><a href=""><i class="fa fa-list-alt"></i><div>주문내역</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>회원정보</div></a></dd>
				</dl>
			</div>
			<!-- //개인정보 -->
			
			<!-- category -->
			<div class="mList">
				<dl>
					<dt>CATEGORY</dt>
					<dd><a href=""><i class="fa fa-user"></i><div>SHOES</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>OUTER</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>JEANS</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>SHIRTS</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>ACCESSORIES</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>CHILDE</div></a></dd>
				</dl>
			</div>
			<!-- //category -->
			
			<!-- brand -->
			<div class="mList">
				<dl>
					<dt>BRAND</dt>
					<dd><a href=""><i class="fa fa-user"></i><div>NIKE</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>ADIDAS</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>ZARA</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>DESCENTE</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>NEWBALANCE</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>CALVINKLEIN</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>TOMMY</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>LACOSTE</div></a></dd>
					<dd><a href=""><i class="fa fa-user"></i><div>UNDERARMOUR</div></a></dd>
				</dl>
			</div>
			<!-- //brand -->
		</div>
	</nav>
	<!-- //모바일 gnb -->

	<div id="c-mask" class="c-mask"></div><!-- /c-mask -->

	<div id="wrap" class="o-wrapper">

		<!-- header -->
		<header id="header">

			<div class="head">
				<button type="button" class="btnGnb">메뉴</button>
				<h1><a href="main.jsp" title="HOME">F4 Mall</a></h1>
				<div class="util">
					<input type="text" class="textSerch" />
					<button type="button" class="btnSerch"><i class="fa fa-search fa-w-16"></i></button>
					<a href="" title="cart"><i class="fa fa-shopping-cart"></i></a> <!-- 로그인 후에 노출 -->
					<a href="" title="user"><i class="fa fa-user"></i></a> <!-- 로그인 후에 노출 -->
					<button type="button" title="login" data-toggle="modal" data-target="#loginPop"><i class="fa fa-lock"></i></button> <!-- 미 로그인 시에 노출 -->
					<a href="../admin/main.jsp"><i class="fa fa-wrench fa-w-16"></i></a> <!-- 관리자 접속시에 노출 -->
				</div>
			</div>

			<!-- pc gnb -->
			<nav class="gnb">
			<ul>
				<li><a href="">HOME</a></li>
				<li><a href="">OUTER</a></li>
				<li><a href="">SHIRTS</a></li>
				<li><a href="">JEANS</a></li>
				<li><a href="">SHOES</a></li>
				<li><a href="">ACCESSORIES</a></li>
				<li><a href="">CHILDE</a></li>
				<li><a href="">CONTACT</a></li>
			</ul>
			</nav>
			<!-- //pc gnb -->
		</header>
		<!-- //header -->

		<!-- contents -->
		<div id="container">
			
			<!-- visual -->
			<section class="mainVisual">
				<video autoplay="" muted="" preload="true" loop="" class="wFull"><source src="${ pageContext.request.contextPath }/resources/f4/img/visual.mp4" type="video/mp4"></video>
			</section>
			<!-- //visual -->
			
			<!-- main contents -->
			<section class="main container">
				<h2 class="hide">메인</h2>
				<!-- category -->
				<div class="category">
					<ul class="row">
						<li class="col-sm-4 col-xs-12">
							<a href="">
								<img src="${ pageContext.request.contextPath }/resources/f4/img/img_main_category1.jpg" alt="Category MEN" class="wFull" />
								<span>MEN</span>
							</a>
						</li>
						<li class="col-sm-4 col-xs-12">
							<a href="">
								<img src="${ pageContext.request.contextPath }/resources/f4/img/img_main_category2.jpg" alt="Category Accessory" class="wFull" />
								<span>ACCESSORY</span>
							</a>
						</li>
						<li class="col-sm-4 col-xs-12">
							<a href="">
								<img src="${ pageContext.request.contextPath }/resources/f4/img/img_main_category3.jpg" alt="Category Women" class="wFull" />
								<span>WOMEN</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- //category -->

				<div class="banner mt70"><img src="${ pageContext.request.contextPath }/resources/f4/img/img_main_banner1.jpg" alt="banner" class="wFull" /></div>

				<!-- goods list -->
				<div class="goodsList mt70">
					<h3 class="hide">상품 리스트</h3>
					<ul class="row">
						<!-- Loop -->
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike1.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키나이키나이키나이키나이키나이키나이키나이키나이키나이키나이키나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
						<!-- //Loop -->
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike2.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike3.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike4.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
					</ul>
				</div>
				<!-- //goods list -->

				<div class="banner mt70"><img src="${ pageContext.request.contextPath }/resources/f4/img/img_main_banner2.jpg" alt="banner" class="wFull" /></div>

				<!-- goods list -->
				<div class="goodsList mt70">
					<h3 class="hide">상품 리스트</h3>
					<ul class="row">
						
						<%-- <li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike5.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
						
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike6.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike7.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li>
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/nike8.jpg" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>나이키</h4>
								<span>&#x20a9;20,000</span>
							</div>
						</li> --%>
						<!-- Loop -->
						<c:forEach var="product" items="${ p_list }">
						<li class="col-md-3 col-xs-6">
							<div class="imgBox">
								<a href=""><img src="${ pageContext.request.contextPath }/resources/f4/img/sample/${ product.p_image_m }" alt="상품" class="wFull" /></a>
								<button type="button" class="btnCart"><i class="fa fa-shopping-cart"></i></button>
							</div>
							<div class="txtBox">
								<h4>${ product.p_name }</h4>
								<span>&#x20a9;<fmt:formatNumber value="${ product.p_price }"/></span>
							</div>
						</li>
						</c:forEach>
						<!-- //Loop -->
					</ul>
				</div>
				<!-- //goods list -->

			</section>
			<!-- //main contents -->
		</div>
		<!-- //contents -->

		<!-- footer -->
		<footer id="footer" class="container">
			<div class="foot">
				<div class="row">
					<!-- about us & sns -->
					<div class="footAbout mt40 col-lg-3 col-md-6 col-sm-12">
						<h3>F4 Mall</h3>
						<p>고구려는 부여의 왕자라 전해지는 고주몽이 건국하였다. 부여와의 투쟁 속에서 성장하였고, 산간지대에 위치한 고구려의 지리적 사정으로 인한 부족한 식량 사정과 부족한 논밭 문제를 해결하기 위해 주변의 비옥한 영토를 정복하는 적극적인 정복 활동과 대규모 정복전쟁을 벌였다. 중국 사서에서는 약탈로 인해 신나라 왕망의 분노를...</p>
						<div class="snsBox">
							<a href=""><i class="fa fa-twitter"></i></a>
							<a href=""><i class="fa fa-facebook"></i></a>
							<a href=""><i class="fa fa-pinterest"></i></a>
							<a href=""><i class="fa fa-instagram"></i></a>
						</div>
					</div>
					<!-- //about us & sns -->

					<!-- information -->
					<div class="footInfo mt40 col-lg-3 col-md-6 col-sm-12">
						<dl>
							<dt>INFORMATION</dt>
							<dd><a href="">OUTER</a></dd>
							<dd><a href="">SHIRTS</a></dd>
							<dd><a href="">JEANS</a></dd>
							<dd><a href="">SHOES</a></dd>
							<dd><a href="">CONTACT</a></dd>
							<dd><a href="">ACCESSORIES</a></dd>
							<dd><a href="">CHILDE</a></dd>
						</dl>
					</div>
					<!-- //information -->

					<!-- address -->
					<div class="footAdrs mt40 col-lg-3 col-md-6 col-sm-12">
						<h4>ADDRESS</h4>
						<address>
							<span>COMPANY : F4 Entertainment</span>
							<span>OWNER : Junpyo Gu</span>
							<span>CALL CENTER : 1577-1577</span>
							<span>ADDRESS : 평양 직할시 정은동 주석궁 401호</span>
							<span>LICENSE NUMBER : [012-34-56789]</span>
							<strong>Copyright (c) by f4mall.com. All Right Reserved</strong>
						</address>
					</div>
					<!-- //address -->

					<!-- call -->
					<div class="footCall mt40 col-lg-3 col-md-6 col-sm-12">
						<h4>GET IN TOUCH</h4>
						<div><i class="fa fa-home"></i><span>평양 직할시 정은동 주석궁 401호</span></div>
						<div><i class="fa fa-phone"></i><span>1577-1577</span></div>
						<div><i class="fa fa-envelope"></i><span>rudals0731@naver.com</span></div>
					</div>
					<!-- //call -->
				</div>
			</div>
		</footer>
		<!-- //footer -->
	</div>
</body>
</html>