<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">

		<!-- page title -->
<h1 class="page-header">FAQ 등록</h1>
<!-- //page title -->

<!-- page contents -->
<div class="panel panel-default">
	<div class="panel-heading">FAQ 등록</div>
	<div class="panel-body">
		<form action="" role="form" class="panel-body">
			<div class="form-group">
				<label for="">제목</label>
				<input type="text" class="form-control" placeholder="FAQ 타이틀" />
			</div>
			<div class="form-group">
				<label for="">내용</label>
				<textarea class="form-control" rows="10" placeholder="FAQ 설명"></textarea>
			</div>
			<div class="form-group text-right">
				<button type="button" class="btn btn-primary">FAQ 등록</button>
			</div>
		</form>
	</div>
</div>
<!-- //page contents -->

<%@include file="template/footer.jsp" %>