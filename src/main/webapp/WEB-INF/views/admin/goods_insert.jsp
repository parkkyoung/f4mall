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
	<script>
		function goodsInsert(f){
			
			var p_name = f.p_name.value;
			var p_content= f.p_content.value;
			var p_price = f.p_price.value;
			var p_supply= f.p_supply.value;
			var p_pdate= f.p_pdate.value;
			var p_country= f.p_country.value;
			var p_material= f.p_material.value;
			var p_color= f.p_color.value;
			var sex_no= f.sex_no.value;
			var p_brand= f.p_brand.value;
			var p_size= f.size_no.value;
			
			if(p_name = ''){
				alert('상품명을 입력해주세요')
				f.p_name.focus();
				return;
			}
			if(p_content = ''){
				alert('상품 설명을 입력해주세요')
				f.p_content.focus();
				return;
			}
			if(p_pdate = ''){
				alert('제조일자를 입력해주세요')
				f.p_pdate.focus();
				return;
			}
			if(p_country = ''){
				alert('제주국을 입력해주세요')
				f.p_country.focus();
				return;
			}

			if(p_material = ''){
				alert('재질을 입력해주세요')
				f.p_material.focus();
				return;
			}
			if(sex_no = ''){
				alert('성별을 입력해주세요')
				f.sex_no.focus();
				return;
			}
			if(p_brand = ''){
				alert('브랜드명을 입력해주세요')
				f.p_brand.focus();
				return;
			}
			if(p_size = ''){
				alert('사이즈를 입력해주세요')
				f.p_size.focus();
				return;
			}
			
			f.action = 'product_insert.do';
			f.submit();
			
			swal({
				text : "상품등록이 완료되었습니다.",
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
				<h1 class="page-header">상품등록</h1>
				<!-- //page title -->
				
				<!-- 상품등록 -->
				<div class="panel panel-default">
					<div class="panel-heading">상품등록</div>

					<!-- 상품등록 -->
					<div class="panel-body">
						<form action="" role="form" class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="">상품명</label>
										<input type="text" id="p_name" name="p_name" class="form-control" placeholder="상품이름" />
									</div>
									<div class="form-group">
										<label for="">상품설명</label>
										<textarea id="p_content" name="p_content" class="form-control" rows="5" placeholder="상품설명"></textarea>
									</div>
									<div class="form-group">
										<label for="">상품가격(원)</label>
										<input type="number" id="p_price" name="p_price"  class="form-control" placeholder="숫자만 입력 가능" />
									</div>
									<div class="form-group">
										<label for="">할인가(원)</label>
										<input type="number" id="p_sale" name="p_sale"  class="form-control" placeholder="숫자만 입력 가능" />
									</div>
									<div class="form-group">
										<label for="">공급업체코드</label>
										<input type="text" id="p_supply" name="p_supply"  class="form-control" placeholder="공급업체코드" />
									</div>
									<div class="form-group">
										<label for="">제조일자</label>
										<input data-provide="datepicker" id="p_pdate" name="p_pdate" class="form-control datepicker" placeholder="YYYY-MM-DD">
									</div>
									<div class="form-group">
										<label for="">제조국가</label>
										<select id="p_country" name="p_country" class="form-control">
											<option value="">한국</option>
											<option value="">중국</option>
											<option value="">일본</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="">카테고리</label>
										<select id="category_no" name="category_no" class="form-control">
											<option value="1">OUTER</option>
											<option value="2">SHIRTS</option>
											<option value="3">JEANS</option>
											<option value="4">SHOES</option>
											<option value="5">ACCESSORIES</option>
											<option value="6">CHILD</option>
										</select>
									</div>
									<div class="form-group">
										<label for="">재질</label>
										<input type="text" id="p_material" name="p_material" class="form-control" placeholder="재질" />
									</div>
									<div class="form-group">
										<label for="">색상</label>
										<input type="text" id="p_color" name="p_color" class="form-control" placeholder="영어 대문자로 대표색상 한가지만 표기(ex : WHITE)" />
									</div>
									<div class="form-group">
										<label for="">성별</label>
										<div class="radio">
											<label><input type="radio" id="sex_male" name="sex_no" value="1">남자</label>
											<label><input type="radio" id="sex_female" name="sex_no" value="2">여자</label>
										</div>
									</div>
									<div class="form-group">
										<label for="">브랜드</label>
										<input type="text" id="p_brand" name="p_brand" class="form-control" placeholder="브랜드" />
									</div>
									<div class="form-group">
										<label for="">사이즈</label>
										<input type="text" id="size_no" name="size_no" class="form-control" placeholder="사이즈" />
									</div>
									<div class="form-group">
										<label for="">이미지 썸네일</label>
										<input type="file" id="p_image_m" name="p_image_m" class="form-control" />
									</div>
									<div class="form-group">
										<label for="">이미지 메인</label>
										<input type="file" id="p_image_s" name="p_image_s" class="form-control" />
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group text-right">
										<button type="button" class="btn btn-primary" onclick="goodsInsert(this.form);">상품등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- // 상품등록 -->
				</div>
				<!-- //상품등록 -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>