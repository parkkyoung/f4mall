<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

<script>
// faq 삭제
function faqDelete(idx){
	swal({
		text : "삭제하시겠습니까?",
		icon : "info",
		buttons: true,
	}).then((willDelete) =>{
		if(willDelete){
			swal({
				text : "삭제되었습니다.",
				icon : "success"
			}).then((value) =>{
				location.href= "faq_delete.do?f_no="+idx;
			})
		}
	});
}
</script>

<!-- page title -->
<h1 class="page-header">FAQ 목록</h1>
<!-- //page title -->

<!-- page contents -->
<div class="panel panel-default">
	<div class="panel-heading">FAQ 목록</div>
	<div class="panel-body">
		<div class="panel-group">
			
			<c:forEach var="list" items="${f_list}">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title clearfix">
						<a data-toggle="collapse" href="#faq<c:out value='${list.f_no}'/>" class="pull-left" style="padding-top:8px;"><c:out value="${list.f_name}"/></a>
                        <div class="pull-right">
                            <div style="display:inline-block;margin-right:10px;padding-top:8px;"><c:out value="${list.f_regdate }"/></div>
                            <a href="faq_update_form.do?f_no=<c:out value='${list.f_no }'/>" class="btn btn-warning">수정</a>
                            <button class="btn btn-danger" onclick="faqDelete(<c:out value='${list.f_no}'/>);">삭제</button>
                        </div>
					</h4>
				</div>
				<div id="faq${list.f_no}" class="collapse">
					<div class="panel-body">
						<p>${list.f_content}</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- //page contents -->
				
<%@include file="template/footer.jsp" %>
