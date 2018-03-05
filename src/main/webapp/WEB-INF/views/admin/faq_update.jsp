<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- page title -->
<h1 class="page-header">FAQ 수정</h1>
<!-- //page title -->

<!-- page contents -->
<div class="panel panel-default">
	<div class="panel-heading">FAQ 수정</div>
	<div class="panel-body">
		<form action="" role="form" class="panel-body">
			<div class="form-group">
				<label for="">FAQ 번호</label>
				<input type="text" class="form-control" value="00001" readonly />
			</div>
			<div class="form-group">
				<label for="">등록일자</label>
				<input type="text" class="form-control" value="YYYY-MM-DD" readonly />
			</div>
			<div class="form-group">
				<label for="">제목</label>
				<input type="text" class="form-control" placeholder="FAQ 타이틀" value="faq 타이틀입니다." />
			</div>
			<div class="form-group">
				<label for="">내용</label>
				<textarea class="form-control" rows="10" placeholder="FAQ 설명">faq 내용입니다.</textarea>
			</div>
			<div class="form-group text-right">
				<button type="button" class="btn btn-primary">FAQ 수정</button>
			</div>
		</form>
	</div>
</div>
<!-- //page contents -->

<%@include file="template/footer.jsp" %>
