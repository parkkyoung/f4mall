<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<script>
function faqInsert(f){
	
	var f_name = f.f_name.value;
	var f_content = f.f_content.value;
    
    if(f_name == ''){
        swal({
            text : "제목을 입력해주세요",
            icon : "error"
        });
        return;
    }
    
    if(f_content == ''){
        swal({
            text : "내용을 입력해주세요",
            icon : "error"
        });
        return;
    }
    
    swal({
        text : "상품등록이 완료되었습니다.",
        icon : "success"
    });
	
	f.action = "faq_insert.do";
	f.submit();
}
</script>

<!-- page title -->
<h1 class="page-header">FAQ 등록</h1>
<!-- //page title -->

<!-- page contents -->
<div class="panel panel-default">
	<div class="panel-heading">FAQ 등록</div>
	<div class="panel-body">
		<form role="form" class="panel-body">
			<div class="form-group">
				<label for="">제목</label>
				<input type="text" name="f_name" class="form-control" placeholder="FAQ 타이틀" />
			</div>
			<div class="form-group">
				<label for="">내용</label>
				<textarea name="f_content" class="form-control" rows="10" placeholder="FAQ 설명"></textarea>
			</div>
			<div class="form-group text-right">
				<button type="button" class="btn btn-primary" onclick="faqInsert(this.form);">FAQ 등록</button>
			</div>
		</form>
	</div>
</div>
<!-- //page contents -->

<%@include file="template/footer.jsp" %>