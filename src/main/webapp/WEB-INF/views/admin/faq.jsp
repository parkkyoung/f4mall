<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

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
						<a href="faq_update.html" class="btn btn-outline btn-warning pull-right">수정</a>
						<div class="pull-right" style="margin-right:10px;padding-top:8px;">${list.f_regdate }</div>
					</h4>
				</div>
				<div id="faq${list.f_no}" class="collapse">
					<div class="panel-body">
						<p>${list.f_content }</p>
					</div>
				</div>
			</div>
			</c:forEach>

		</div>
	</div>
</div>
<!-- //page contents -->
				
<%@include file="template/footer.jsp" %>
