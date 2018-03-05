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
	<link href="${ pageContext.request.contextPath }/resources/front/css/menu.css" rel="stylesheet"> <!-- mobile left menu -->
	<link href="${ pageContext.request.contextPath }/resources/front/css/common.css" rel="stylesheet"> <!-- customizing -->

	<!-- js -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <!-- jquery -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- bootstrap -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweet alert -->
	<script src="${ pageContext.request.contextPath }/resources/front/js/menu.js"></script> <!-- mobile left menu -->
	<script src="${ pageContext.request.contextPath }/resources/front/js/common.js"></script> <!-- customizing -->

	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<!-- page script -->
	<script>	
		$(function(){
			// 게시판 리스트 말줄임
			var blSubjectWidth = 0;
			function blSubjectEllipsis(){
				if($(window).width() > 767){
					blSubjectWidth = $(".boardList").width() * 0.5 - 20;
					$(".blSubject a").css("width", blSubjectWidth);
				} else {
					blSubjectWidth = $(".boardList").width() * 0.7 - 20;
					$(".blSubject a").css("width", blSubjectWidth);
				}
			};
			blSubjectEllipsis();
			$(window).resize(function(){
				blSubjectEllipsis();
			});
		});
	</script>
	
	<script type="text/javascript">
		function login(f){
			var m_id  = f.m_id.value;
			var m_pwd = f.m_pwd.value;
			
			if(m_id==''){
				alert('아이디를 입력하세요');
				f.m_id.focus();
				return;
			}
			if(m_pwd==''){
				alert('비밀번호를 입력하세요');
				f.m_pwd.focus();
				return;
			}
			
			$.ajax({
				url:'login.do',
				data:{'m_id':m_id,'m_pwd':m_pwd},
				success:function(data){
					var json = eval(data);
					if(json[0].result == 'yes'){
						swal({
							text : "로그인 성공.",
							icon : "success",
						}).then((value) => {
							location.href = "product_list.do";
						});
					}else if(json[0].result == 'id_fail'){
						alert('아이디가 틀립니다');
						f.m_id.focus();
					}else if(json[0].result == 'pwd_fail'){
						alert('비밀번호가 틀립니다');
						f.m_pwd.focus();
					}else if(json[0].result == 'no'){
						alert('로그인 오류(다시 입력해주세요)');
						f.m_id.focus();
					}
				
					}
			});
		}
	</script>
</head>
<body>
	
	<!-- 스킵 네비게이션 -->
	<div class="skip-navi">
		<p><a href="#container" tabindex="0">본문 바로가기</a></p>
	</div>
	<!-- //스킵 네비게이션 -->

	<!-- Login popup -->
	<form>
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
							<div class="col-sm-10 col-xs-9"><input type="email" class="form-control" id="m_id" name="m_id" placeholder="Email"></div>
						</div>
						<div class="form-group">
							<label for="loginPw" class="col-sm-2 col-xs-3 control-label">Password</label>
							<div class="col-sm-10 col-xs-9"><input type="password" class="form-control" id="m_pwd" name="m_pwd" placeholder="Password"></div>
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
					<a href="member_join_clause.do" class="btn btn-warning">Join us</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="login(this.form);">Login</button>
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