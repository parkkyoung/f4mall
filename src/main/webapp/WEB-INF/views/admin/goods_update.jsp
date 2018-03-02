<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

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
	<script>
		function goodsUpdate(){
			swal({
				text : "상품수정이 완료되었습니다.",
				icon : "success"
			});
		};
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
				<h1 class="page-header">상품상세</h1>
				<!-- //page title -->
				
				<!-- 상품상세 -->
				<div class="panel panel-default">
					<div class="panel-heading">상품상세</div>

					<!-- 상품등록 -->
					<div class="panel-body">
						<form action="" role="form" class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="">상품코드</label>
										<input type="text" class="form-control" value="012345" readonly />
									</div>
									<div class="form-group">
										<label for="">상품명</label>
										<input type="text" class="form-control" placeholder="상품이름" value="나이키신발" />
									</div>
									<div class="form-group">
										<label for="">상품설명</label>
										<textarea class="form-control" rows="5" placeholder="상품설명">어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고</textarea>
									</div>
									<div class="form-group">
										<label for="">상품가격(원)</label>
										<input type="number" class="form-control" placeholder="숫자만 입력 가능" value="99999" />
									</div>
									<div class="form-group">
										<label for="">할인가(원)</label>
										<input type="number" class="form-control" placeholder="숫자만 입력 가능" value="1" />
									</div>
									<div class="form-group">
										<label for="">공급업체코드</label>
										<input type="text" class="form-control" placeholder="공급업체코드" value="123456789" />
									</div>
									<div class="form-group">
										<label for="">제조일자</label>
										<input data-provide="datepicker" class="form-control datepicker" placeholder="YYYY-MM-DD" value="2018-02-28">
									</div>
									<div class="form-group">
										<label for="">제조국가</label>
										<select name="" class="form-control">
											<option value="" selected>한국</option>
											<option value="">중국</option>
											<option value="">일본</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="">등록일자</label>
										<input type="text" class="form-control" value="YYYY-MM-DD" readonly />
									</div>
									<div class="form-group">
										<label for="">카테고리</label>
										<select name="" class="form-control">
											<option value="">OUTER</option>
											<option value="">SHIRTS</option>
											<option value="">JEANS</option>
											<option value="">SHOES</option>
											<option value="">ACCESSORIES</option>
											<option value="">CHILDE</option>
										</select>
									</div>
									<div class="form-group">
										<label for="">재질</label>
										<input type="text" class="form-control" placeholder="재질" value="면" />
									</div>
									<div class="form-group">
										<label for="">색상</label>
										<input type="text" class="form-control" placeholder="영어 대문자로 대표색상 한가지만 표기(ex : WHITE)" value="BLACK" />
									</div>
									<div class="form-group">
										<label for="">성별</label>
										<div class="radio">
											<label><input name="" type="radio" checked>남자</label>
											<label><input name="" type="radio">여자</label>
										</div>
									</div>
									<div class="form-group">
										<label for="">브랜드</label>
										<input type="text" class="form-control" placeholder="브랜드" value="나이키" />
									</div>
									<div class="form-group">
										<label for="">사이즈</label>
										<input type="text" class="form-control" placeholder="사이즈" class="XL, L, S" />
									</div>
									<div class="form-group">
										<label for="">이미지 썸네일</label>
										<input type="file" class="form-control" />
									</div>
									<div class="form-group">
										<label for="">이미지 메인</label>
										<input type="file" class="form-control" />
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group text-right">
										<button type="button" class="btn btn-primary" onclick="goodsUpdate();">상품수정</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- // 상품등록 -->
				</div>
				<!-- //상품상세 -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>
