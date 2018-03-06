<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file= "template/header.jsp"%>
<!-- visual -->
<section class="subVisual">
    <img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
    <h2 class="hide">FAQ</h2>

    <!-- search box -->
    <div class="searchBox">
        <input type="text" placeholder="search" />
        <button type="button"><i class="fa fa-search fa-w-16"></i></button>
    </div>
    <!-- //search box -->
    
    <!-- FAQ  -->
    <div class="panel-group mt20">

        <c:forEach var="list" items="${f_list}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title clearfix">
                    <a data-toggle="collapse" href="#faq<c:out value='${list.f_no}'/>" class="pull-left" style="padding-top:8px;"><c:out value="${list.f_name}"/></a>
                    <div class="pull-right">
                        <div style="display:inline-block;margin-right:10px;padding-top:8px;"><c:out value="${list.f_regdate}"/></div>
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
    <!-- //FAQ  -->
</section>
<!-- //sub contents -->
<%@include file= "template/footer.jsp"%>
