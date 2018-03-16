<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file= "template/header.jsp"%>

<script>
function findFaq(){
	var find_faq_txt = $("#findFaqTxt").val();
	
	if(find_faq_txt == ''){
		swal({
			text : "검색할 내용을 입력하세요",
			icon : "error",
		}).then((value) => {
			$("#findFaqTxt").focus();
			return;
		});
	} else {
		location.href='faq.do?find_faq_txt='+encodeURIComponent(find_faq_txt);
	}
}
</script>

<!-- visual -->
<section class="subVisual">
    <h2>FAQ</h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_faq.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_faq.jpg" alt="sub visual" class="imgMobile" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
    <!-- search box -->
    <div class="searchBox">
        <input type="text" id="findFaqTxt" placeholder="search" value="${ param.find_faq_txt }" onkeyup="if(window.event.keyCode == 13) findFaq();" />
        <button type="button" onclick="findFaq();"><i class="fa fa-search fa-w-16"></i></button>
    </div>
    <!-- //search box -->
    
    <!-- FAQ  -->
    <div class="panel-group mt20">

        <c:forEach var="list" items="${f_list}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title clearfix">
                    <a data-toggle="collapse" href="#faq<c:out value='${list.f_no}'/>" style="padding-top:8px;"><c:out value="${list.f_name}"/></a>
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