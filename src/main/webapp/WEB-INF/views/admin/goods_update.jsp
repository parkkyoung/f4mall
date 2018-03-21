<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp" %>

<!-- ckeditor -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<!-- //ckeditor -->


<script>
// 상품수정
function goodsUpdate(f){
    
    var p_name = f.p_name.value;
    var p_content= CKEDITOR.instances.p_content.getData();
    var p_price = f.p_price.value;
    var p_pdate= f.p_pdate.value;
    var p_image_m= document.getElementById("p_image_m").value;
    var p_image_s= document.getElementById("p_image_s").value;
    
    if(p_name == ''){
        swal({
            text : "상품명을 입력해주세요",
            icon : "error"
        }).then((value) =>{
            f.p_name.focus();
            return;
        });
    } else if(p_content == ''){
        swal({
            text : "상품 설명을 입력해주세요",
            icon : "error"
        }).then((value) =>{
            f.p_content.focus();
            return;
        });
    } else if(p_price == ''){
        swal({
            text : "상품 가격을 입력해주세요",
            icon : "error"
        }).then((value) =>{
            f.p_price.focus();
            return;
        });
    } else if(p_pdate == ''){
        swal({
            text : "제조일자를 입력해주세요",
            icon : "error"
        }).then((value) =>{
            f.p_pdate.focus();
            return;
        });
    } else if(p_image_m == ''){
        swal({
            text : "썸네일 이미지를 등록해주세요",
            icon : "error"
        }).then((value) =>{
            return;
        });
    } else if(p_image_s == ''){
        swal({
            text : "상세 이미지를 등록해주세요",
            icon : "error"
        }).then((value) =>{
            return;
        });
    } else {
        swal({
            text : "상품수정이 완료되었습니다.",
            icon : "success"
        }).then((value) =>{
            f.action = 'goods_update.do';
            f.submit();
        });
    };
};

// 상품삭제
function goodsDelete(p_no){
    swal({
        text : "정말 삭제하시겠습니까?",
        icon : "info",
        buttons : true
    }).then((willDelete) =>{
        swal({
            text : "삭제되었습니다.",
            icon : "succsess"
        }).then((value) =>{
            location.href='product_delete.do?p_no='+p_no;
        });
    });
};


//아이템등록
function itemInsert(f){
 
 var s_no = f.s_no.value;
 var sizeCheck = false;
 var colorCheck = false;
 var categoryCheck = false;
 var materialCheck = false;
 var sexCheck = false;
 var brandCheck = false;
 
 // 사이즈 체크
 $("input[name='size_no']").each(function(){
     if($(this).is(":checked") == true) sizeCheck = true;
 });
 // 색상 체크
 $("input[name='color_no']").each(function(){
     if($(this).is(":checked") == true) colorCheck = true;
 });
 // 카테고리 체크
 $("input[name='category_no']").each(function(){
     if($(this).is(":checked") == true) categoryCheck = true;
 });
 // 재질 체크
 $("input[name='material_no']").each(function(){
     if($(this).is(":checked") == true) materialCheck = true;
 });
 // 성별 체크
 $("input[name='sex_no']").each(function(){
     if($(this).is(":checked") == true) sexCheck = true;
 });
 // 브랜드 체크
 $("input[name='brand_no']").each(function(){
     if($(this).is(":checked") == true) brandCheck = true;
 });

 // all check
 if(s_no == ''){
     swal({
         text : "수량을 입력해주세요",
         icon : "info"
     }).then((value) =>{
         f.s_no.focus();
     });
 } else if(sizeCheck == false){
     swal({
         text : "사이즈를 선택해주세요",
         icon : "info"
     });
 } else if(colorCheck == false){
     swal({
         text : "색상를 선택해주세요",
         icon : "info"
     });
 } else if(categoryCheck == false){
     swal({
         text : "카테고리를 선택해주세요",
         icon : "info"
     });
 } else if(sexCheck == false){
     swal({
         text : "성별을 선택해주세요",
         icon : "info"
     });
 } else if(brandCheck == false){
     swal({
         text : "브랜드를 선택해주세요",
         icon : "info"
     });
 } else if(materialCheck == false){
     swal({
         text : "재질을 선택해주세요",
         icon : "info"
     });
 } else {
     swal({
         text : "아이템등록이 완료되었습니다.",
         icon : "success"
     }).then((value) =>{
         f.action = "items_insert.do";
         f.submit();
     });
 };
};

//아이템 삭제
function itemsDelete(i_no, p_no){
 swal({
     text : "정말 삭제하시겠습니까?",
     icon : "info",
     buttons : true
 }).then((willDelete) =>{
     if(willDelete){
         swal({
             text : "삭제되었습니다.",
             icon : "success"
         }).then((value) =>{
             location.href = "items_delete.do?i_no="+i_no+"&p_no="+p_no;
         });
     };
 });
};
</script>

<!-- page title -->
<h1 class="page-header">상품상세</h1>
<!-- //page title -->

<!-- 상품수정 -->
<div class="panel panel-default">
	<div class="panel-heading">상품수정</div>
    <form action="" role="form" class="panel-body" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="">상품코드</label>
                    <input type="number" id="p_no" name="p_no" class="form-control" value="<c:out value='${vo.p_no}'/>" readonly />
                </div>
                <div class="form-group">
                    <label for="">상품명</label>
                    <input type="text" id="p_name" name="p_name" class="form-control" placeholder="상품이름" value="<c:out value='${vo.p_name}'/>" />
                </div>
                <div class="form-group">
                    <label for="">상품설명</label>
                    <!-- ckeditor -->
					<textarea rows="8" class="form-control" name="p_content" id="p_content"placeholder="상품설명"><c:out value='${vo.p_content}'/></textarea>	
					<script>
						// Replace the <textarea id="editor1"> with a CKEditor
						// instance, using default configuration.
						CKEDITOR
							.replace(
								'p_content',
								{
									filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditorImageUpload.do'
								});
					
						CKEDITOR.on('dialogDefinition', function(ev) {
							var dialogName = ev.data.name;
							var dialogDefinition = ev.data.definition;
					
							switch (dialogName) {
							case 'image': //Image Properties dialog
								//dialogDefinition.removeContents('info');
								dialogDefinition.removeContents('Link');
								dialogDefinition.removeContents('advanced');
								break;
							}
						});
					</script>
					<!-- //ckeditor -->
                    
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
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="">등록일자</label>
                    <input type="text" class="form-control" value="YYYY-MM-DD" readonly value="<c:out value='${vo.p_entry}'/>" />
                </div>
                <div class="form-group">
                    <label for="">제조일자</label>
                    <input data-provide="datepicker" id="p_pdate" name="p_pdate" class="form-control datepicker" placeholder="YYYY-MM-DD" value="<c:out value='${vo.p_pdate}'/>" />
                </div>
                <div class="form-group">
                    <label for="">제조국가</label>
                    <input type="text" id="p_country" name="p_country"  class="form-control" value="<c:out value='${vo.p_country}'/>" />
                </div>
                <div class="form-group">
                    <label for="">이미지 썸네일</label>
                    <input type="file" id="p_image_m" name="p_image" class="form-control" value="<c:out value='${vo.p_image_m}'/>" />
                </div>
                <div class="form-group">
                    <label for="">이미지 상세</label>
                    <input type="file" id="p_image_s" name="p_image" class="form-control" value="<c:out value='${vo.p_image_s}'/>" />
                </div>
            </div>
            <div class="col-lg-12">
                <div class="form-group text-right">
                    <button type="button" class="btn btn-primary" onclick="goodsUpdate(this.form);">상품수정</button>
                    <button type="button" class="btn btn-danger" onclick="goodsDelete(<c:out value='${vo.p_no}'/>);">상품삭제</button>
                </div>
            </div>
        </div>
    </form>
	<!-- // 상품수정 -->
</div>

<!-- 아이템목록 -->
<div class="panel panel-default">
    <div class="panel-heading">아이템목록</div>
    <div class="panel-body">
        <table width="100%" class="tableData table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th>성별</th>
                    <th>브랜드</th>
                    <th>재질</th>
                    <th>사이즈</th>
                    <th>색상</th>
                    <th>재고수량</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${i_list}">
                <tr>
                    <td><c:out value="${list.category_name}"/></td>
                    <td><c:out value="${list.sex_name}"/></td>
                    <td><c:out value="${list.brand_name}"/></td>
                    <td><c:out value="${list.material_name}"/></td>
                    <td><c:out value="${list.size_name}"/></td>
                    <td><c:out value="${list.color_name}"/></td>
                    <td>재고수량</td>
                    <td><button type="button" class="btn btn-danger btn-sm" onclick="itemsDelete(<c:out value='${list.i_no}'/>, <c:out value='${list.p_no}'/>)">삭제</button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- //아이템목록 -->

<!-- 아이템등록 -->
<div class="panel panel-default">
    <div class="panel-heading">아이템등록</div>
    <form class="panel-body">
        <input type="hidden" name="p_no" value="${vo.p_no}" />
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label>입고수량</label>
                    <input type="number" id="s_no" name="s_no" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="">사이즈</label>
                    <div class="checkbox">
                        <c:forEach var="size" items="${size}">
                        <label><input name="size_no" type="checkbox" value="${size.size_no}" />${size.size_name}</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">색상</label>
                    <div class="checkbox">
                        <c:forEach var="color" items="${color}">
                        <label><input name="color_no" type="checkbox" value="${color.color_no}" />${color.color_name}</label>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="">카테고리</label>
                    <div class="radio">
                        <c:forEach var="category" items="${category}">
                        <label><input name="category_no" type="radio" value="${category.category_no}" />${category.category_name}</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">성별</label>
                    <div class="radio">
                        <c:forEach var="sex" items="${sex}">
                        <label><input name="sex_no" type="radio" value="${sex.sex_no}" />${sex.sex_name}</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">브랜드</label>
                    <div class="radio">
                        <c:forEach var="brand" items="${brand}">
                        <label><input name="brand_no" type="radio" value="${brand.brand_no}" />${brand.brand_name}</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">재질</label>
                    <div class="radio">
                        <c:forEach var="material" items="${material}">
                        <label><input name="material_no" type="radio" value="${material.material_no}" />${material.material_name}</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group text-right">
                    <button type="button" class="btn btn-primary" onclick="itemInsert(this.form);">아이템등록</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- //아이템등록 -->

<%@include file="template/footer.jsp" %>
