<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp" %>

<script>
// 상품수정
function goodsUpdate(f){
    
    var p_name = f.p_name.value;
    var p_content= f.p_content.value;
    var p_price = f.p_price.value;
    var p_pdate= f.p_pdate.value;
    
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
    } else {
        swal({
            text : "상품등록이 완료되었습니다.",
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
</script>

<!-- page title -->
<h1 class="page-header">상품상세</h1>
<!-- //page title -->

<!-- 상품수정 -->
<div class="panel panel-default">
	<div class="panel-heading">상품수정</div>
    <form action="" role="form" class="panel-body">
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
                    <input type="file" id="p_image_m" name="p_image_m" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="">이미지 상세</label>
                    <input type="file" name="p_image_s" class="form-control" />
                    <input type="file" name="p_image_s" class="form-control" />
                    <input type="file" name="p_image_s" class="form-control" />
                    <input type="file" name="p_image_s" class="form-control" />
                    <input type="file" name="p_image_s" class="form-control" />
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
                    <th>아이템코드</th>
                    <th>사이즈</th>
                    <th>색상</th>
                    <th>재고수량</th>
                    <th>등록일자</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop -->
                <tr>
                    <td>1111</td>
                    <td>260</td>
                    <td>WHITE</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
                <!-- //Loop -->
                <tr>
                    <td>2222</td>
                    <td>260</td>
                    <td>BLACK</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
                <tr>
                    <td>3333</td>
                    <td>270</td>
                    <td>WHITE</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
                <tr>
                    <td>4444</td>
                    <td>270</td>
                    <td>BLACK</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- //아이템목록 -->

<!-- 아이템등록 -->
<div class="panel panel-default">
    <div class="panel-heading">아이템등록</div>
    <form class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label>상품코드</label>
                    <input type="number" class="form-control" value="12345" readonly />
                </div>
                <div class="form-group">
                    <label>입고수량</label>
                    <input type="number" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="">사이즈</label>
                    <div class="checkbox">
                        <label><input name="" type="checkbox" />230</label>
                        <label><input name="" type="checkbox" />235</label>
                        <label><input name="" type="checkbox" />240</label>
                        <label><input name="" type="checkbox" />245</label>
                        <label><input name="" type="checkbox" />250</label>
                        <label><input name="" type="checkbox" />255</label>
                        <label><input name="" type="checkbox" />260</label>
                        <label><input name="" type="checkbox" />265</label>
                        <label><input name="" type="checkbox" />270</label>
                        <label><input name="" type="checkbox" />275</label>
                        <label><input name="" type="checkbox" />280</label>
                        <label><input name="" type="checkbox" />285</label>
                        <label><input name="" type="checkbox" />290</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">색상</label>
                    <div class="checkbox">
                        <label><input name="" type="checkbox" />ETC</label>
                        <label><input name="" type="checkbox" />WHITE</label>
                        <label><input name="" type="checkbox" />BLACK</label>
                        <label><input name="" type="checkbox" />RED</label>
                        <label><input name="" type="checkbox" />ORANGE</label>
                        <label><input name="" type="checkbox" />YELLOW</label>
                        <label><input name="" type="checkbox" />GREEN</label>
                        <label><input name="" type="checkbox" />BLUE</label>
                        <label><input name="" type="checkbox" />INDIGO</label>
                        <label><input name="" type="checkbox" />PURPLE</label>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="">카테고리</label>
                    <div class="radio">
                        <label><input name="" type="radio" selected>ETC</label>
                        <label><input name="" type="radio">running</label>
                        <label><input name="" type="radio">sneakers</label>
                        <label><input name="" type="radio">oxfords</label>
                        <label><input name="" type="radio">walkers</label>
                        <label><input name="" type="radio">heels</label>
                        <label><input name="" type="radio">slippers</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">성별</label>
                    <div class="radio">
                        <label><input name="" type="radio" selected>공용</label>
                        <label><input name="" type="radio">남자</label>
                        <label><input name="" type="radio">여자</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">브랜드</label>
                    <div class="radio">
                        <label><input name="" type="radio" selected>ETC</label>
                        <label><input name="" type="radio">NIKE</label>
                        <label><input name="" type="radio">ADIDAS</label>
                        <label><input name="" type="radio">NEWBALANCE</label>
                        <label><input name="" type="radio">SODA</label>
                        <label><input name="" type="radio">FERRAGAMO</label>
                        <label><input name="" type="radio">KUMKANG</label>
                        <label><input name="" type="radio">CHRISTIAN LOUBOUTIN</label>
                        <label><input name="" type="radio">ELCANTO</label>
                        <label><input name="" type="radio">RACHELCOX</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">재질</label>
                    <div class="radio">
                        <label><input name="" type="radio" selected>기타</label>
                        <label><input name="" type="radio">가죽</label>
                        <label><input name="" type="radio">면</label>
                        <label><input name="" type="radio">플라스틱</label>
                        <label><input name="" type="radio">철</label>
                        <label><input name="" type="radio">금</label>
                        <label><input name="" type="radio">다이아몬드</label>
                    </div>
                </div>
                <div class="form-group text-right">
                    <button type="button" class="btn btn-primary">아이템등록</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- //아이템등록 -->

<%@include file="template/footer.jsp" %>
