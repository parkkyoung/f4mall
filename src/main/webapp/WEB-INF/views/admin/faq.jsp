<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

<script>
function faqDelete(idx){
	swal({
		text : "삭제되었습니다.",
		icon : "success",
	});
	location.href= "faq_delete.do?f_no="+idx;
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
						<a data-toggle="collapse" href="#faq${list.f_no}" class="pull-left" style="padding-top:8px;">${list.f_name}</a>
                        <div class="pull-right">
                            <div style="margin-right:10px;padding-top:8px;">${list.f_regdate }</div>
                            <a href="faq_update.html" class="btn btn-outline btn-warning">수정</a>
                            <button class="btn btn-warning" onclick="faqDelete(${list.f_no});">삭제</button>
                        </div>
					</h4>
				</div>
				<div id="faq${list.f_no}" class="collapse">
					<div class="panel-body">
						<p>${list.f_content }</p>
                        <div>no : ${list.f_no}</div>
                        <div>ip : ${list.f_ip}</div>
                        <div>작성자 : ${list.m_id}</div>
					</div>
				</div>
			</div>
			</c:forEach>

		</div>
	</div>
</div>
<!-- //page contents -->
				
<%@include file="template/footer.jsp" %>
