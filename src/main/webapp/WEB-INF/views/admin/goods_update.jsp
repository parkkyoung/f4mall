<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp" %>

<!-- page script -->
<script>
	function goodsUpdate(){
		swal({
			text : "상품수정이 완료되었습니다.",
			icon : "success"
		});
	};
</script>

<!-- page title -->
<h1 class="page-header">상품상세</h1>
<!-- //page title -->

<!-- 상품상세 -->
<div class="panel panel-default">
	<div class="panel-heading">상품상세</div>

	<!-- 상품수정 -->
	<div class="panel-body">
        <form action="" role="form" class="panel-body">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="">상품명</label>
                        <input type="text" id="p_name" name="p_name" class="form-control" placeholder="상품이름" value="<c:out value='${vo.p_name}'/>" />
                    </div>
                    <div class="form-group">
                        <label for="">상품설명</label>
                        <textarea id="p_content" name="p_content" class="form-control" rows="5" placeholder="상품설명"><c:out value='${vo.p_content}'/></textarea>
                    </div>
                    <div class="form-group">
                        <label for="">상품가격(원)</label>
                        <input type="number" id="p_price" name="p_price"  class="form-control" placeholder="숫자만 입력 가능" value="<c:out value='${vo.p_price}'/>" />
                    </div>
                    <div class="form-group">
                        <label for="">할인가(원)</label>
                        <input type="number" id="p_sale" name="p_sale"  class="form-control" placeholder="숫자만 입력 가능" value="<c:out value='${vo.p_sale}'/>" />
                    </div>
                    <div class="form-group">
                        <label for="">공급업체코드</label>
                        <input type="text" id="p_supply" name="p_supply"  class="form-control" placeholder="공급업체코드" value="<c:out value='${vo.p_supply}'/>" />
                    </div>
                    <div class="form-group">
                        <label for="">제조일자</label>
                        <input data-provide="datepicker" id="p_pdate" name="p_pdate" class="form-control datepicker" placeholder="YYYY-MM-DD" value="<c:out value='${vo.p_pdate}'/>" />
                    </div>
                    <div class="form-group">
                        <label for="">제조국가</label>
                        <select id="p_country" name="p_country" class="form-control">
                            <option value="kor" selected>한국</option>
                            <option value="chi">중국</option>
                            <option value="jap">일본</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="">카테고리</label>
                        <select id="category_no" name="category_no" class="form-control">
                            <c:forEach var="category" items="${category}">
                            <option value="<c:out value='${category.category_no}'/>"><c:out value="${category.category_name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">재질</label>
                        <select id="material_no" name="material_no" class="form-control">
                            <c:forEach var="material" items="${material}">
                            <option value="<c:out value='${material.material_no}'/>"><c:out value="${material.material_name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">색상</label>
                        <select id="color_no" name="color_no" class="form-control">
                            <c:forEach var="color" items="${color}">
                            <option value="<c:out value='${color.color_no}'/>"><c:out value="${color.color_name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">성별</label>
                        <select id="sex_no" name="sex_no" class="form-control">
                            <c:forEach var="sex" items="${sex}">
                            <option value="<c:out value='${sex.sex_no}'/>"><c:out value="${sex.sex_name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">브랜드</label>
                        <select id="brand_no" name="brand_no" class="form-control">
                            <c:forEach var="brand" items="${brand}">
                            <option value="<c:out value='${brand.brand_no}'/>"><c:out value="${brand.brand_name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">사이즈</label>
                        <select id="size_no" name="size_no" class="form-control">
                            <c:forEach var="size" items="${size}">
                            <option value="<c:out value='${size.size_no}'/>"><c:out value="${size.size_name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">이미지 썸네일</label>
                        <input type="file" id="p_image_m" name="p_image_m" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="">이미지 메인</label>
                        <input type="file" id="p_image_s" name="p_image_s" class="form-control" />
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group text-right">
                        <button type="button" class="btn btn-primary" onclick="goodsInsert(this.form);">상품등록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
	<!-- // 상품수정 -->
</div>
<!-- //상품상세 -->

<%@include file="template/footer.jsp" %>
