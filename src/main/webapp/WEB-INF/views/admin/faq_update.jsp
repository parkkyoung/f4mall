<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

<script>
function faqUpdate(f){
    
	var f_no = f.f_no.value;
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
        text : "faq 수정이 완료되었습니다.",
        icon : "success"
    }).then((value) => {
        f.action = "faq_update.do";
        f.submit();
    });
}
</script>

<!-- page title -->
<h1 class="page-header">FAQ 수정</h1>
<!-- //page title -->

<!-- page contents -->
<div class="panel panel-default">
    <div class="panel-heading">FAQ 수정</div>
    <div class="panel-body">
        <form role="form" class="panel-body">
        <input type="hidden" name="f_no" value="<c:out value='${vo.f_no}'/>" />
            <div class="form-group">
                <label for="">제목</label>
                <input type="text" name="f_name" class="form-control" placeholder="FAQ 타이틀" value="<c:out value='${vo.f_name}'/>" />
            </div>
            <div class="form-group">
                <label for="">내용</label>
                <textarea name="f_content" class="form-control" rows="10" placeholder="FAQ 설명"><c:out value="${vo.f_content}"/></textarea>
            </div>
            <div class="form-group text-right">
                <button type="button" class="btn btn-primary" onclick="faqUpdate(this.form);">FAQ 수정</button>
            </div>
        </form>
    </div>
</div>
<!-- //page contents -->

<%@include file="template/footer.jsp" %>