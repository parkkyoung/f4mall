<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

<script>
// 상품삭제
function productDelete(p_no){
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

// 아이템등록
function itemInsert(f){
    
    var p_no = f.p_no.value;
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
	if(p_no == ''){
		swal({
			text : "상품 번호를 입력해주세요",
			icon : "info"
		}).then((value) =>{
			f.p_no.focus();
		});
	} else if(s_no == ''){
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

// 아이템 삭제
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
<h1 class="page-header">상품목록</h1>
<!-- //page title -->

<!-- 상품목록 -->
<div class="panel panel-default">
	<div class="panel-heading">상품목록</div>
	<div class="panel-body">
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>할인가격</th>
					<th>상품가격(원)</th>
                    <th>등록일자</th>
                    <th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${p_list}">
				<tr>
					<td><a href="goods_update_form.do?p_no=<c:out value='${list.p_no}'/>"><c:out value="${list.p_no}" /></a></td>
					<td><c:out value="${list.p_name}" /></td>
					<td><c:out value="${list.p_sale}" /></td>
					<td><c:out value="${list.p_price}" /></td>
                    <td><c:out value="${list.p_entry}" /></td>
                    <td><button type="button" class="btn btn-danger btn-sm" onclick="productDelete(<c:out value="${list.p_no}" />);">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!-- //상품목록 -->

<%@include file="template/footer.jsp" %>