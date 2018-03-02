<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<li><a href="index.html">HOME</a></li>
				<li><a href="goods.html">OUTER</a></li>
				<li><a href="goods.html">SHIRTS</a></li>
				<li><a href="goods.html">JEANS</a></li>
				<li><a href="goods.html">SHOES</a></li>
				<li><a href="goods.html">ACCESSORIES</a></li>
				<li><a href="goods.html">CHILDE</a></li>
				<li class="active"><a href="profile.html">PROFILE</a></li>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall.git
			</ul>
			</nav>
			<!-- //pc gnb -->
		</header>
		<!-- //header -->

		<!-- contents -->
		<div id="container">
			
			<!-- visual -->
			<section class="subVisual">
				<img src="img/img_f4.jpg" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">프로필</h2>

				<div class="profile">

					<!-- 경민 -->
					<div class="box">
						<div class="imgBox"><img src="img/img_profile01.jpg" alt="chopin" class="wFull" /></div>
						<div class="txtBox">
							<dl>
								<dt>Chopin</dt>
								<dd>
									<strong>NAME</strong>
									<span>박경민</span>
								</dd>
								<dd>
									<strong>CLASS</strong>
									<span>PL</span>
								</dd>
								<dd>
									<strong>WORK</strong>
									<span>Design, Publish, Controller</span>
								</dd>
								<dd>
									<strong>HOMEPAGE</strong>
									<span><a href="http://chopin77.dothome.co.kr/" target="_blank">http://chopin77.dothome.co.kr/</a></span>
								</dd>
								<dd>
									<strong>BLOG</strong>
									<span><a href="https://blog.naver.com/rudals0731/" target="_blank">https://blog.naver.com/rudals0731/</a></span>
								</dd>
								<dd>
									<strong>INTRODUCE</strong>
									<span>
										나의 총끝은 빛나고<br />방아쇠는 심판을 내린다<br />기꺼이 적에게 복수하고<br />증오엔 증오로 되갚으니<br />오 신이시여<br />나를 당신곁에 두시고<br />성인들 중에 세우소서<br /><br />남의 피를 쏟게 하는 자<br />자기 피도 쏟게 하리라<br /><br />그것이 신의 뜻이라.
									</span>
								</dd>
							</dl>
						</div>
					</div>
					<!-- //경민 -->

					<!-- 덕원 -->
					<div class="box">
						<div class="imgBox"><img src="img/img_profile02.jpg" alt="chopin" class="wFull" /></div>
						<div class="txtBox">
							<dl>
								<dt>DUCK</dt>
								<dd>
									<strong>NAME</strong>
									<span>서덕원</span>
								</dd>
								<dd>
									<strong>CLASS</strong>
									<span>PM</span>
								</dd>
								<dd>
									<strong>WORK</strong>
									<span>Planning, Database, Controller</span>
								</dd>
								<dd>
									<strong>INTRODUCE</strong>
									<span>
										적군의 숨통을 노리는 매의 눈빛<br /><br /> 매일 수련에 수련을 거듭하고 있는 브라이언 킴 대위라고 한다.<br /> 던전고수 기분좋나요와는 절친한 친구다.<br /> 어서 전쟁이 일어나야 내 실력을 뽐낼건데..(후훗)<br /><br />하지만 나는 나라를 위해 싸우지않는다.<br />내가 사랑하는 여자를 위해 목숨을 걸뿐.. 후훗..
									</span>
								</dd>
							</dl>
						</div>
					</div>
					<!-- //덕원 -->

					<!-- 훈철 -->
					<div class="box">
						<div class="imgBox"><img src="img/img_profile03.jpg" alt="chopin" class="wFull" /></div>
						<div class="txtBox">
							<dl>
								<dt>HOON</dt>
								<dd>
									<strong>NAME</strong>
									<span>신훈철</span>
								</dd>
								<dd>
									<strong>CLASS</strong>
									<span>UTILITY</span>
								</dd>
								<dd>
									<strong>WORK</strong>
									<span>Planning, Database, Controller</span>
								</dd>
								<dd>
									<strong>INTRODUCE</strong>
									<span>
										나 던전 초고수다<br />원코인 클리어도 못하는 새끼들아<br />내 현란한 모닝스타 솜씨를 봐라 
									</span>
								</dd>
							</dl>
						</div>
					</div>
					<!-- //훈철 -->

					<!-- 봉성 -->
					<div class="box">
						<div class="imgBox"><img src="img/img_profile04.jpg" alt="chopin" class="wFull" /></div>
						<div class="txtBox">
							<dl>
								<dt>BBONG</dt>
								<dd>
									<strong>NAME</strong>
									<span>김봉성</span>
								</dd>
								<dd>
									<strong>CLASS</strong>
									<span>ACE</span>
								</dd>
								<dd>
									<strong>WORK</strong>
									<span>Database, Controller, Resources</span>
								</dd>
								<dd>
									<strong>INTRODUCE</strong>
									<span>
										목전(目前)의 상대에게 치명적인 공격을 !!<br /><br />난 제국군의 기사 발리언트(27)라고 한다.<br />던전고수 기분좋나요와 브라이언 킴 대위와는 깊은 우정을 나눈 관계다<br />목전의 상대에겐 치명적인 공격을!! 그리고 강인한 나의 플레이터 아머(Plate Armor)와<br />라운드 쉴드(Round shield)에겐 신의 축복을 !!<br />목전의 상대에게 자비를 베풀지 않는 기사 발리언트다<br />설령 상대가 7살난 어린아이라 할지라도..
									</span>
								</dd>
							</dl>
						</div>
					</div>
					<!-- //봉성 -->
				</div>
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