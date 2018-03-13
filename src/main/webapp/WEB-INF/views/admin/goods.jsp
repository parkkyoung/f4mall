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

<!-- 아이템목록 -->
<div class="panel panel-default">
    <div class="panel-heading">아이템목록</div>
    <div class="panel-body">
        <table width="100%" class="tableData table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>아이템코드</th>
                    <th>상품코드</th>
                    <th>상품명</th>
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
                    <td><a href="product_update.html">0000</a></td>
                    <td>나이키신발00</td>
                    <td>260</td>
                    <td>WHITE</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
                <!-- //Loop -->
                <tr>
                    <td>2222</td>
                    <td><a href="product_update.html">0000</a></td>
                    <td>나이키신발00</td>
                    <td>260</td>
                    <td>BLACK</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
                <tr>
                    <td>3333</td>
                    <td><a href="product_update.html">0000</a></td>
                    <td>나이키신발00</td>
                    <td>270</td>
                    <td>WHITE</td>
                    <td>100</td>
                    <td>YYYY-MM-DD</td>
                    <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                </tr>
                <tr>
                    <td>4444</td>
                    <td><a href="product_update.html">0000</a></td>
                    <td>나이키신발00</td>
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

    <!-- form -->
    <form class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label>상품코드</label>
                    <input type="number" class="form-control" />
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
                        <label><input name="" type="radio">ETC</label>
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
                        <label><input name="" type="radio">공용</label>
                        <label><input name="" type="radio">남자</label>
                        <label><input name="" type="radio">여자</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">브랜드</label>
                    <div class="radio">
                        <label><input name="" type="radio">ETC</label>
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
                        <label><input name="" type="radio">기타</label>
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
    <!-- //form -->
</div>
<!-- //아이템등록 -->

<%@include file="template/footer.jsp" %>