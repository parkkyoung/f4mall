<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <link href="${ pageContext.request.contextPath }/resources/admin/css/common.css" rel="stylesheet"> <!-- customizing -->

    <!-- js -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <!-- jquery -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweet alert -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.4/metisMenu.min.js"></script> <!-- menu -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/js/sb-admin-2.min.js"></script> <!-- sbadmin-->
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> <!-- datatables -->
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script> <!-- datatables(bootstrap) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script> <!-- datepicker -->
    <script src="${ pageContext.request.contextPath }/resources/admin/js/common.js"></script> <!-- customizing -->
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
                <a class="navbar-brand" href="index.do">F4 Mall Admin</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li><a href="../index.do"><i class="fa fa-shopping-bag fa-fw"></i> 쇼핑몰</a></li>
                <li><a href="../logout.do"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a></li>

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
                            <a href="index.do"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> 회원관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="member_list.do">회원목록</a></li>
                                <li><a href="member_insert_form.do">회원등록</a></li>
                                <li><a href="member_orders.do">주문목록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-shopping-cart fa-fw"></i> 상품관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="goods_list.do">상품목록</a></li>
                                <li><a href="goods_insert_form.do">상품등록</a></li>
                                <li><a href="goods_stock_form.do">상품입출고</a></li>
                                <li><a href="goods_review.do">상품평</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> FAQ<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="faq_list.do">FAQ 목록</a></li>
                                <li><a href="faq_insert_form.do">FAQ 등록</a></li>
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