<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

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
	
	<!-- page script -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 다음 우편 -->
	<script>
	function findAddress() {
		new daum.Postcode({
			oncomplete: function(data) {
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
				if(data.userSelectedType === 'R'){
					//법정동명이 있을 경우 추가한다.
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('addressNumber').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('address2').focus();
			}
		}).open();
	}

	// 회원가입
	function join(f){
		
		// 비밀번호 유효성 체크
		var m_pwd_pattern  = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		
		// 값 얻어오기
		var m_id 	  = f.m_id.value();
		var m_pwd 	  = f.m_pwd.value();
		var m_name 	  = f.m_name.value();
		var m_zipcode = f.m_zipcode.value();
		var m_addr    = f.m_addr.value();
		var m_addr_d  = f.m_addr_d.value();
		var m_tel 	  = f.m_tel.value();
		
		// 값 체크
		if(m_id==''){
			alert('아이디를 입력해주세요');
			f.m_id.focus();
			return;
		}
		
		if(m_pwd=='' || !(m_pwd_pattern.test(m_pwd))){
			alert('비밀번호를 확인해주세요');
			f.m_pwd.focus();
			return;
		}
		
		
		if(m_name==''){
			alert('이름을 확인해주세요');
			f.m_name.focus();
			return;
		}
		
		if(m_zipcode==''){
			alert('우편번호를 입력 해주세요');
			f.m_zipcode.focus();
			return;
		}
		
		if(m_addr==''){
			alert('주소를 확인해주세요');
			f.m_addr.focus();
			return;
		}
		
		if(m_addr_d==''){
			alert('상세주소를 확인해주세요');
			f.m_addr_d.focus();
			return;
		}
		
		if(m_tel==''){
			alert('전화번호를 확인해주세요');
			f.m_tel.focus();
			return;
		}
		
		
		$('#m_id').keyup(function(event){
		      var m_id= $(this).val();
		      var m_id_pattern   = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			  //console.log('id값 ='+id);
		      if(!(m_id_pattern.test(m_id))){
		         $('#m_id_msg').html('이메일형식을 입력해주세요.').css('color','red');
		         return;
		      }
		      
		      //서버로 id전송(Ajax통신)
		      $.ajax({
		         url:'check_id.do',
		         data:{'m_id':m_id},
		         success:function(data){
		            // data="[{'result':'yes'}]";
		            var json = eval(data);
		            // var json=[{'result':'yes'}];    => 배열이다
		            if(json[0].result == 'yes'){
		               $('#m_id_msg').html('사용 가능한 아이디입니다').css('color','blue');
		               
		            }else{
		               $('#id_msg').html('이미 사용중인 아이디입니다').css('color','red');
		               
		               /* $("#m_pwd").change(function(){
		   			$.ajax({
		   				//어쩌고저쩌고
		   				if(true) $(this).addClass("alert-success").removeClass("alert-danger"); // 성공
		   				else $(this).addClass("alert-danger").removeClass("alert-success"); // 실패
		   			});
		   			
		   		}) */
		   		
		            }
		         }
		      });
		   });
	
		
		
		swal({
			text : "회원가입이 완료되었습니다.",
			icon: "success",
		}).then((value) => {
			location.href = "main.jsp";
		});
	};
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
					<a href="join.html" class="btn btn-warning">Join us</a>
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
			<section class="subVisual">
				<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<form>
			<section class="sub container">
				<h2 class="hide">회원가입</h2>
				<div class="form-horizontal">
					<div class="form-group">
						<label for="id" class="col-sm-4 control-label">ID</label>
						<div class="col-sm-6">
							<input type="text" id="m_id" class="form-control alert alert-success" placeholder="메일 주소" />
							<span id="m_id_msg"></span>
							<p class="mt5">메일 주소로 작성해주세요</p>
						</div>
					</div>

					<!-- 패스워드 유효성검사 체크 후에 완료되면 .alert-success 실패하면 alert-danger 추가 -->
					<div class="form-group">
						<label for="pw" class="col-sm-4 control-label">Password</label>
						<div class="col-sm-4">
							<input type="password" id="m_pwd" class="form-control alert alert-success" placeholder="비밀번호" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<input type="password" class="form-control alert alert-danger" placeholder="비밀번호 확인" />
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-4 control-label">이름</label>
						<div class="col-sm-4">
							<input type="text" id="m_name" class="form-control" placeholder="이름" />
						</div>
					</div>
					<div class="form-group">
						<label for="btnNumber" class="col-sm-4 col-xs-12 control-label">주소</label>
						<div class="col-sm-4 col-xs-8">
							<input type="text" id="m_zipcode" class="form-control" placeholder="우편번호" readonly />
						</div>
						<div class="col-sm-4 col-xs-4">
							<button type="button" id="btnNumber" class="btn btn-warning" onclick="findAddress()">주소찾기</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-6">
							<input type="text" id="m_addr" class="form-control" placeholder="도로명주소" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-6">
							<input type="text" id="m_addr_d" class="form-control" placeholder="상세주소" />
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="col-sm-4 control-label">핸드폰번호</label>
						<div class="col-sm-4">
							<input type="tel" id="m_tel" class="form-control" placeholder="01012345678" />
							<p class="mt5">괄호(-) 없이 숫자만 입력해주세요</p>
						</div>
					</div>
					<div class="form-group btnBox">
						<button type="button" class="btn btn-primary btn-lg" onclick="join(this.form);">회원가입</button>
					</div>
				</div>
			</section>
			</form>
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