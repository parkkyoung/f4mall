<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi">
	<title>F4 Mall Admin</title>
	
	<!-- css -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> <!-- bootstrap -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> <!-- font-awesome -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.4/metisMenu.min.css" rel="stylesheet"> <!-- menu -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/css/sb-admin-2.min.css" rel="stylesheet"> <!-- sbadmin -->
	<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet"> <!-- datatables(bootstrap) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet"> <!-- datepicker -->

	<!-- js -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <!-- jquery -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweet alert -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- bootstrap -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.4/metisMenu.min.js"></script> <!-- menu -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/js/sb-admin-2.min.js"></script> <!-- sbadmin-->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> <!-- datatables -->
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script> <!-- datatables(bootstrap) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script> <!-- datepicker -->
	<script src="${ pageContext.request.contextPath }/resources/f4/js/admin/common.js"></script> <!-- customizing -->

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
	</script>
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">F4 Mall Admin</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li><a href="../front/index.html"><i class="fa fa-shopping-bag fa-fw"></i> 쇼핑몰</a></li>
				<li><a href=""><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a></li>

			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</li>
						<li>
							<a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
						</li>
						<li>
							<a href="#"><i class="fa fa-user fa-fw"></i> 회원관리<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="member.html">회원목록</a></li>
								<li><a href="member_insert.html">회원등록</a></li>
								<li><a href="member_order.html">주문목록</a></li>
							</ul>
						</li>
						<li>
							<a href="#"><i class="fa fa-user fa-fw"></i> 상품관리<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="goods.html">상품목록</a></li>
								<li><a href="goods_insert.html">상품등록</a></li>
								<li><a href="goods_stock.html">상품입출고</a></li>
							</ul>
						</li>
						<li>
							<a href="#"><i class="fa fa-table fa-fw"></i> FAQ<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="faq.html">FAQ 목록</a></li>
								<li><a href="faq_insert.html">FAQ 등록</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<!-- //Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">

				<!-- page title -->
				<h1 class="page-header">회원등록</h1>
				<!-- //page title -->
				
				<!-- 회원등록 -->
				<div class="panel panel-default">
					<div class="panel-heading">회원등록</div>
					<div class="panel-body">
						<form action="" role="form" class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="">ID</label>
										<input type="text" class="form-control" placeholder="메일 주소" />
									</div>
									<div class="form-group">
										<label for="">패스워드</label>
										<input type="password" class="form-control" placeholder="비밀번호" />
									</div>
									<div class="form-group">
										<input type="password" class="form-control" placeholder="비밀번호 확인" />
									</div>
									<div class="form-group">
										<label for="">이름</label>
										<input type="text" class="form-control" placeholder="이름" />
									</div>
									<div class="form-group">
										<label for="">핸드폰번호</label>
										<input type="number" class="form-control" placeholder="괄호(-)없이 숫자만 입력" />
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="">주소</label>
										<div class="row">
											<div class="col-xs-8">
												<input type="text" id="addressNumber" class="form-control" placeholder="우편번호" readonly />
											</div>
											<div class="col-xs-4">
												<button type="button" class="btn btn-warning" onclick="findAddress()">주소찾기</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<input type="text" id="address" class="form-control" placeholder="지번주소" />
									</div>
									<div class="form-group">
										<input type="text" id="address2" class="form-control" placeholder="상세주소" />
									</div>
									<div class="form-group">
										<label for="">이미지</label>
										<input type="file" class="form-control" />
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group text-right">
										<button type="button" class="btn btn-primary">회원등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- //회원등록 -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>
