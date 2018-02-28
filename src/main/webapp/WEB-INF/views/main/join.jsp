<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<link href="${ pageContext.request.contextPath }/resources/f4/css/menu.css" rel="stylesheet"> <!-- mobile left menu -->
	<link href="${ pageContext.request.contextPath }/resources/f4/css/common.css" rel="stylesheet"> <!-- customizing -->

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
</head>
<body>
	<!-- 이용약관 popup -->
	<div class="modal fade" id="termsPop1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">이용약관</h4>
				</div>
				<div class="modal-body">
					<p>고구려는 부여의 왕자라 전해지는 고주몽이 건국하였다. 부여와의 투쟁 속에서 성장하였고, 산간지대에 위치한 고구려의 지리적 사정으로 인한 부족한 식량 사정과 부족한 논밭 문제를 해결하기 위해 주변의 비옥한 영토를 정복하는 적극적인 정복 활동과 대규모 정복전쟁을 벌였다. 중국 사서에서는 약탈로 인해 신나라 왕망의 분노를 일으켰다고[3] 하고 있으며, 고구려측 기록에서는 내용은 비슷하나 고구려후 추가 아닌 장수 연비(延丕)가 사망한 것으로 나타나 있다. 그 후 고구려는 태조왕 때 왕족인 계루부(桂婁部)를 포함한 소노부(消奴部)·절노부(絶奴部)·순노부(順奴部)·관노부(灌奴部) 등 다섯 부족으로 이루어진 연맹 왕국으로 성장했다. 고구려는 이때부터 본격적인 고대 국가로 발전하게 된다. 《삼국사기(三國史記)》〈고구려본기(高句麗本紀)〉에 따르면 기원전 37년 부여계인 동명왕(東明王)이 졸본(卒本)에 도읍해 나라의 이름을 졸본부여로 한 것이 기원이며, 《위서(魏書)》에 따르면 흘승골성(紇升骨城)[4]에 도읍했다고 한다. 그러나 이규보의 〈동명왕편(東明王篇)〉에 언급된 건국 신화 혹은 그 이후의 여러 가지 정황에 의해, 고구려는 멸망한 고조선(古朝鮮) 및 부여(夫餘) 출신의 유이민과 그 지역의 토착 세력이 결합해 이뤄진 국가로 추정되는 등, 건국연대가 더 높았을 것이라는 설이 제시되기도 한다. 기원후 3년에는 동명성왕의 아들 유리왕이 국내성(國內城)으로 천도하고 위나암성(尉那巖城)을 쌓았다. 고구려는 국가적 체계를 마련하고 계속해서 주변 유목 부족과 연맹체 침략하여 북옥저와 졸본, 국내성 주변의 지역을 흡수하였다. 고구려가 이렇게 성장하자 이에 대항하는 국가가 늘었다. 농안을 근거지로 성장한 부여는 기원전 6년과 13년 침공하고 복속하기를 요구하였다. 그러나 오히려 세력을 키운 고구려가 21년, 부여 정벌을 감행하여 부여왕 (대소왕)을 죽이고 돌아왔다. 이후 부여는 고구려를 섣불리 침공하는 일이 없어졌다. 부여를 물리친 고구려는 더욱 영토를 넓혀갔다. 그러자 28년 한나라가 이에 위협을 느껴 군사를 일으켰다. 하지만 고구려는 국내성에서 농성을 펼치며 막아냈고, 32년 낙랑국도 일시적으로 정복하는 등 만주와 북부 한반도에서 위세를 떨쳤다. 53년에 즉위한 태조왕(太祖王) 때에 이르러 고구려의 5부족은 중앙 행정 단위인 5부로 통합되었다. 이에 따라 고구려는 내부 자치권을 제외한 군사권과 외교권이 왕에게 귀속되는 고대 국가로 발전하였고, 이후로 소노부 왕가가 물러나고 계루부 출신의 고씨가 독점적으로 왕위를 계승하였다. 따라서 고구려의 진정한 건국은 태조 때로 본다. 그는 주위의 여러 부족을 정복하여 동으로는 옥저·동예(東濊), 남으로는 살수(薩水), 북으로는 부여(夫餘)를 압박하고, 서로는 한의 요동군·현도군과 대립하였다. 그리하여 1세기에서 2세기에 걸쳐 고구려는 고대 정복국가로서의 위세를 떨치게 되었다. 태조왕 이후에도 각 부족은 서서히 중앙 귀족으로 흡수되었고, 197년에 즉위한 산상왕(山上王) 때에 이르러서는 왕위의 형제상속이 배제되고 부자 상속제가 확립되어 왕권이 더욱 강해졌다. 이러한 왕권 강화의 배경에는 영토 확장이 있었는데, 기본적으로 약탈 경제 위주였던 고구려가 동해안의 옥저를 무력으로 복속케 하고 한사군에 대한 원정 및 약탈을 행하면서 경제적으로 성장을 이루었기 때문이다. 이러한 정복 활동은 246년(동천왕 16년) 위나라(魏)의 관구검(毌丘儉)이 침공하면서 일시적으로 위축되었다.[5] 빈농이 늘어나고 귀족의 노예가 되는 자유민이 증가하자, 고국천왕은 194년에 봄에 곡식을 빌리고 가을에 갚게하는 진대법(賑貸法)을 실시하여 빈농을 구제하는 정책을 펼쳤다. 또한 고국천왕(故國川王)은 왕위의 형제 상속을 부자 상속으로 확립하여 왕권을 강화하였다. 산상왕(山上王) 때에 이르러서야 왕위의 부자 상속제가 확고히 되었다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- // 이용약관 popup -->

	<!-- 개인정보 수집 및 이용 안내 popup -->
	<div class="modal fade" id="termsPop2" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">개인정보 수집 및 이용 안내</h4>
				</div>
				<div class="modal-body">
					<p>백제건국 시기에 관해 일반적으로 김부식의《삼국사기》기록에 실린 온조설화에 따라 기원전 18년에 부여 또는 고구려 계통의 유민 세력과 한강 유역의 토착 세력의 결합으로 성립된 것으로 보고 있으나 백제 초대 국왕인 비류왕과 온조왕은 고구려 추모왕(동명성왕)과 소서노의 아들이며, 최초의 백제의 이름은 십제였다. 우수한 철기 문화를 보유한 고구려 유민 집단이 지배층을 형성하였다. 《삼국사기》의 백제 건국 설화에 따르면 졸본부여 사람인 비류와 온조가 남쪽으로 함께 내려온 뒤 비류는 미추홀에, 온조는 하남위례성에 각기 도읍을 정하고 나라를 세웠으며, 비류가 죽자 그 신하와 백성이 모두 위례성으로 옮겨오므로 비로소 백제(百濟)라는 큰 나라로 성장했다고 한다. 온조설화 외에 비류 혹은 구태, 도모가 건국 했다는 비류설화, 구태설화도 전해져 온다. 온조집단이 한강유역에 정착하였을 때 이 지역은 직산-천안을 중심으로한 목지국 중심의 마한에 속하여 있어 마한으로부터 100리의 땅을 할애받아 십제를 세우고 미추홀 지역의 비류집단과 연맹을 형성하여 초고왕때 지역연맹의 맹주가 되어 백제라고 이름을 고쳤다. 백제는 한강 유역으로 세력을 확장하려던 한나라의 군현의 공격을 막아내면서 차츰 성장해 나갔다. 3세기 중엽 고이왕 때 한강 유역을 완전히 장악하였고, 소금의 산지였던 인천까지 영향권에 넣었다.[2]또한 이때부터 중국 산동지역에 영향력을 행사하기 시작한다. 고이왕 시기 고대 한반도에서는 큰 정치적 변화가 일어났다. 246년에 진한(辰韓)의 8국을 분할하는 문제로 마한과 낙랑·대방군(樂浪·帶方郡) 사이에 전쟁이 일어난 것이다. 이 전쟁에서 마한은 대방태수(帶方太守)를 전사시키는 전과를 올렸지만 결국 패배하였고 이로 말미암아 목지국(目支國)의 위상이 약화되었다. 이러한 상황을 이용하여 백제는 기존의 마한 54개 부족연맹체의 우두머리였던 목지국을 제압하고, 새로이 마한의 맹주국이 되었다. 중국과의 무역로를 확보한 백제는 중국 대륙의 선진 문물들을 받아들여 정치 체제를 정비하였다. 이 무렵 백제는 16관등과 공복제정함과 함께 6좌평과 상좌평까지 제정(260년)하는 등 지배 체제를 정비하여 중앙 집권 국가의 토대를 형성하였다. 그러나 고이왕 이후 낙랑과 계속되는 대결에서 298년에는 책계왕이 살해되었으며, 304년에는 분서왕이 살해되었다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- // 개인정보 수집 및 이용 안내 popup -->

	<!-- 개인정보 처리위탁 popup -->
	<div class="modal fade" id="termsPop3" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">개인정보 처리위탁</h4>
				</div>
				<div class="modal-body">
					<p>신라(新羅, 기원전 57년 ~ 935년)는 고구려, 백제와 함께 고대 한반도의 삼국 시대를 구성하였던 국가로, 세계적으로 오래 존속한 왕조들 중 하나로 꼽힌다. 진한에 소속된 소국 중 하나인 경주 지역의 사로국(斯盧國)이 그 시초이며, 박혁거세가 나라를 세웠다고 알려져 있다. 또한 신라(新羅)라는 국호는 ‘왕의 덕업이 날로 새로워져서 사방을 망라한다’라는 의미로 서기 503년 지증왕 때에 정해졌다. 삼국 중 가장 먼저 세워졌지만, 국가의 틀을 갖추는 데는 가장 늦었다. 6세기경 법흥왕 때 불교를 받아들여 왕권 강화와 백성의 단결을 꾀하였으며, 진흥왕 대에 이르러 첫 번째 전성기를 맞아 6세기중엽 한강 유역을 차지하였다. 중국을 통일한 수(隨)와 그 뒤의 당(唐)과 동맹(나·당 연합)을 맺어 660년에 백제를, 668년에는 고구려를 차례로 멸망시켰다. 또한, 당나라와 연합의 파기 이후 당나라와의 전쟁에서 승리하여 당나라를 한반도 밖으로 몰아내는 데 성공하였다. 대동강 이남으로부터, 원산만에 이르는 지역을 차지하여[3] 형식적으로는 삼국 통일을 달성하게 되었다. 이후 698년 발해가 건국되면서 발해와 함께 남북국 시대를 이루었다. 통일 이후 신라는 9주 5소경을 설치하고 고도의 중앙 집권 체계를 확립하였다. 집사부 장관인 시중의 권한이 강화되어 왕권의 전제화가 실현되었다. 신문왕은 녹읍을 폐지하였으며, 유학 교육을 위해 국학을 설립하였다. 진골 귀족과 대결 세력이었던 6두품이 왕권과 결탁하여 상대적으로 부각되었으나, 골품제는 유지되었고 진골 귀족의 고위직 독점은 여전하였다. 또한, 이 시기는 섬세하고 화려한 불교 유적과 유물들이 건축·제작된 시기이기도 하다. 그러나 말기에 이르러 왕과 귀족이 사치스러운 생활을 하고, 내부 분열이 이는 와중에 지방에서 자리 잡고 있던 호족의 세력이 성장하여, 900년 견훤이 후백제를, 901년 궁예가 태봉을 세우면서 후삼국 시대가 시작되었다. 후삼국으로의 분열 및 부정부패의 만연 등으로 국력이 쇠락한 신라는 경순왕 때인 935년 고려에 스스로 복속하기로 하면서 56대 992년(사로국 포함) 만에 멸망했다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- // 개인정보 처리위탁 popup -->

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
				<h1><a href="index.jsp" title="HOME">F4 Mall</a></h1>
				<div class="util">
					<input type="text" class="textSerch" />
					<button type="button" class="btnSerch"><i class="fa fa-search fa-w-16"></i></button>
					<a href="" title="cart"><i class="fa fa-shopping-cart"></i></a> <!-- 로그인 후에 노출 -->
					<a href="" title="user"><i class="fa fa-user"></i></a> <!-- 로그인 후에 노출 -->
					<button type="button" title="login" data-toggle="modal" data-target="#loginPop"><i class="fa fa-lock"></i></button> <!-- 미 로그인 시에 노출 -->
					<a href="../admin/main.html"><i class="fa fa-wrench fa-w-16"></i></a> <!-- 관리자 접속시에 노출 -->
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
			<section class="subVisual">
				<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">회원가입</h2>
				<div class="form-horizontal">
					<div class="form-group">
						<div class="col-sm-12">
							<label class="ft24"><input type="checkbox" class="checkController" data-controller="checkTerms"> 전체동의</label>
						</div>
					</div>
					<div class="form-group mt20">
						<div class="col-sm-12">
							<label><input type="checkbox" class="checkMember" data-target="checkTerms"> 이용약관</label>
							<button type="button" class="btn btn-default ml10" data-toggle="modal" data-target="#termsPop1">내용보기</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<label><input type="checkbox" class="checkMember" data-target="checkTerms"> 개인정보 수집 및 이용 안내</label>
							<button type="button" class="btn btn-default ml10" data-toggle="modal" data-target="#termsPop2">내용보기</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<label><input type="checkbox" class="checkMember" data-target="checkTerms"> 개인정보 처리위탁</label>
							<button type="button" class="btn btn-default ml10" data-toggle="modal" data-target="#termsPop3">내용보기</button>
						</div>
					</div>
					<div class="form-group btnBox">
						<a href="join2.jsp" class="btn btn-primary btn-lg">다음</a>
					</div>
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