<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
function add_cart(p_no){
	var param = { 'p_no' : p_no, 'm_id' : '${ user.id }' };
	$.ajax({
		url : 'cart_insert.do',
		data: param,
		success:function(data){
			var json = eval(data);
			//json =[{'result':'success'}];
			if(json[0].result == 'fail'){
				alert('장바구니 담기에 실패했습니다. 다시 시도해 주세요');
				return;
			}
			
			//장바구니 담기 성공
			if(confirm('장바구니 담기 성공\n장바구니 보기로 이동하시겠습니까?')==false){
				return;
			}
			location.href='cart_list.do';
		}
	});
}
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi">
	<title>F4 Mall</title>

	<!-- css -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> <!-- bootstrap -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> <!-- font-awesome -->
	<link href="css/menu.css" rel="stylesheet"> <!-- mobile left menu -->
	<link href="css/common.css" rel="stylesheet"> <!-- customizing -->

	<!-- js -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <!-- jquery -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- bootstrap -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweet alert -->
	<script src="js/menu.js"></script> <!-- mobile left menu -->
	<script src="js/common.js"></script> <!-- customizing -->

	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	
	<!-- 스킵 네비게이션 -->
	<div class="skip-navi">
		<p><a href="#container" tabindex="0">본문 바로가기</a></p>
	</div>
	<!-- //스킵 네비게이션 -->

	<!-- review popup -->
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
							<div class="col-sm-10 col-xs-9"><input type="text" class="form-control" placeholder="상품평 제목" value="상품평 제목" /></div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 col-xs-3 control-label">내용</label>
							<div class="col-sm-10 col-xs-9"><textarea class="form-control" rows="5" placeholder="상품평 내용">상품평 내용이 삽입됩니다.</textarea></div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 col-xs-3 control-label">별점</label>
							<div class="starRating mt5 col-sm-10 col-xs-9">
								<label for="star01" class="on">★</label><input type="radio" id="star01" name="star" value="1" />
								<label for="star02" class="on">★</label><input type="radio" id="star02" name="star" value="2" />
								<label for="star03" class="on">★</label><input type="radio" id="star03" name="star" value="3" />
								<label for="star04" class="on">★</label><input type="radio" id="star04" name="star" value="4" />
								<label for="star05" class="on">★</label><input type="radio" id="star05" name="star" value="5" checked />
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
	<!-- //review popup -->

	<!-- Login popup -->
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
					<a href="join.html" class="btn btn-warning">Join us</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Login</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //Login popup -->
	
	<!-- 모바일 gnb -->
	<nav id="c-menu--push-left" class="c-menu c-menu--push-left">
		<h3 class="hide">모바일 메뉴</h3>
		<button type="button" class="btnClose c-menu__close">GNB Close</button>

		
		<!-- 미 로그인 노출 -->
		<!-- <div class="mHead tCenter">
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
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>SHOES</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>OUTER</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>JEANS</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>SHIRTS</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>ACCESSORIES</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>CHILDE</div></a></dd>
				</dl>
			</div>
			<!-- //category -->
			
			<!-- brand -->
			<div class="mList">
				<dl>
					<dt>BRAND</dt>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>NIKE</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>ADIDAS</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>ZARA</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>DESCENTE</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>NEWBALANCE</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>CALVINKLEIN</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>TOMMY</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>LACOSTE</div></a></dd>
					<dd><a href="goods.html"><i class="fa fa-user"></i><div>UNDERARMOUR</div></a></dd>
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
				<h1><a href="index.html" title="HOME">F4 Mall</a></h1>
				<div class="util">
					<input type="text" class="textSerch" />
					<button type="button" class="btnSerch"><i class="fa fa-search fa-w-16"></i></button>
					<a href="" title="cart"><i class="fa fa-shopping-cart"></i></a> <!-- 로그인 후에 노출 -->
					<a href="" title="user"><i class="fa fa-user"></i></a> <!-- 로그인 후에 노출 -->
					<button type="button" title="login" data-toggle="modal" data-target="#loginPop"><i class="fa fa-lock"></i></button> <!-- 미 로그인 시에 노출 -->
					<a href="../admin/index.html"><i class="fa fa-wrench fa-w-16"></i></a> <!-- 관리자 접속시에 노출 -->
				</div>
			</div>

			<!-- pc gnb -->
			<nav class="gnb">
			<ul>
				<li><a href="goods.html">OUTER</a></li>
				<li><a href="goods.html">SHIRTS</a></li>
				<li><a href="goods.html">JEANS</a></li>
				<li><a href="goods.html">SHOES</a></li>
				<li><a href="goods.html">ACCESSORIES</a></li>
				<li><a href="goods.html">CHILDE</a></li>
				<li class="active"><a href="profile.html">PROFILE</a></li>
				<li><a href="board.html">COMMUNITY</a></li>
			</ul>
			</nav>
			<!-- //pc gnb -->
		</header>
		<!-- //header -->

		<!-- contents -->
		<div id="container">
			
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">상품상세</h2>

				<!-- 상품 상세 -->
				<div class="goods">

					<!-- 상품 head -->
					<div class="row">

						<!-- 캐러셀 -->
						<div class="col-sm-6">
							<div id="carousel" class="carousel slide" data-ride="carousel">

								<!-- 캐러셀 인디케이터 -->
								<ol class="carousel-indicators">
									<li data-target="#carousel" data-slide-to="0" class="active"></li>
									<li data-target="#carousel" data-slide-to="1"></li>
								</ol>

								<!-- 캐러셀 -->
								<div class="carousel-inner" role="listbox">
									<div class="item active"><img src="http://placehold.it/555x555" alt="" class="wFull" /></div>
									<div class="item"><img src="http://placehold.it/555x555" alt="" class="wFull" /></div>
								</div>

							</div>
						</div>
						<!-- //캐러셀 -->

						<!-- 옵션 -->
						<div class="col-sm-6">
							<form action="" class="goodsOption form-horizontal">
								<div class="form-group goCategory">
									<a href="">카테고리명</a>
									<span>상품번호 : 1234</span>
								</div>
								<div class="form-group goTitle">
									<h3>나이키신발</h3>
									<div>★★★★★</div>
								</div>
								<div class="form-group">
									<label for="">배송비</label>
									<div class="mt5">2500원</div>
								</div>
								<div class="form-group">
									<label for="">제조일자</label>
									<div class="mt5">2018-03-02</div>
								</div>
								<div class="form-group">
									<label for="">제조국가</label>
									<div class="mt5">한국</div>
								</div>
								<div class="form-group goPrice">
									<del>20,000원</del><br />
									<strong>10,000원</strong>
								</div>
								<div class="form-group btnBox">
									<div class="col-xs-4"><input type="number" placeholder="수량" class="form-control text-right" /></div>
									<div class="col-xs-4"><button type="button" class="btn btn-warning btn-lg btn-block"><i class="fa fa-shopping-cart ftWhite"></i> 장바구니</button></div>
									<div class="col-xs-4"><button type="button" class="btn btn-primary btn-lg btn-block"><i class="fa fa-credit-card ftWhite"></i> 구매하기</button></div>
								</div>
							</form>
						</div>
						<!-- //옵션 -->
					</div>
					<!-- //상품 head -->

					<!-- 상품설명 -->
					<div class="mt40">
						<img src="http://placehold.it/1300x5000" alt="" class="wFull" />
					</div>
					<!-- //상품설명 -->

					<!-- 상품평 -->
					<div class="panel-group">
						
						<h3 class="hide">상품평</h3>

						<!-- 상품평 컨텐츠의 아이디와 상품평 타이틀의 href에 해당 상품평 넘버를 삽입 -->
						<!-- Loop -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title">
									<h4 class="pull-left">
										<a data-toggle="collapse" href="#gReview01" class="block">상품평 타이틀입니다.</a>
										<small>작성자</small>
									</h4>
									<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop">수정</button> <!-- 등록자 or 관리자만 노출 -->
									<div class="pull-right">2018-03-01</div>
								</div>
							</div>
							<div id="gReview01" class="collapse">
								<div class="panel-body">
									<p>상품평 컨텐츠입니다.</p>
								</div>
							</div>
						</div>
						<!-- //Loop -->

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title">
									<h4 class="pull-left">
										<a data-toggle="collapse" href="#gReview02" class="block">상품평 타이틀입니다.2</a>
										<small>작성자2</small>
									</h4>
									<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop">수정</button> <!-- 등록자 or 관리자만 노출 -->
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
									<button class="btn btn-outline btn-warning pull-right" data-toggle="modal" data-target="#reviewPop">수정</button> <!-- 등록자 or 관리자만 노출 -->
									<div class="pull-right">2018-03-01</div>
								</div>
							</div>
							<div id="gReview03" class="collapse">
								<div class="panel-body">
									<p>상품평 컨텐츠입니다.</p>
								</div>
							</div>
						</div>

					</div>
					<!-- //상품평 -->
				</div>
				<!-- //상품 상세 -->

			</section>
			<!-- //sub contents -->
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

					<!-- category -->
					<div class="footInfo mt40 col-lg-3 col-md-6 col-sm-12">
						<dl>
							<dt>CATEGORY</dt>
							<dd><a href="goods.html">OUTER</a></dd>
							<dd><a href="goods.html">SHIRTS</a></dd>
							<dd><a href="goods.html">JEANS</a></dd>
							<dd><a href="goods.html">SHOES</a></dd>
							<dd><a href="goods.html">ACCESSORIES</a></dd>
							<dd><a href="goods.html">CHILDE</a></dd>
						</dl>
					</div>
					<!-- //category -->

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