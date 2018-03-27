<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>


<!-- page title -->
<h1 class="page-header">주문목록</h1>
<!-- //page title -->
<!-- 주문정보 -->
<div class="panel panel-default">
    <div class="panel-heading">주문정보</div>
    <div class="panel-body">
        <table width="100%" class="tableData table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>상품코드</th>
                    <th>아이템코드</th>
                    <th>상품이름</th>
                    <th>수량</th>
                    <th>상품금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="goods_update_form.do?p_no=<c:out value='${vo.p_no}'/>"><c:out value="${vo.p_no}" /></a></td>
                    <td><c:out value="${vo.i_no}" /></td>
                    <td><c:out value="${vo.p_name}" /></td>
                    <td><c:out value="${vo.o_amt}" /></td>
                    <td><c:out value="${vo.o_pay_amt}" /></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- //주문정보 -->

<!-- 배송정보 -->
<div class="panel panel-default">
    <div class="panel-heading">배송정보</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-6 form-horizontal">
                <div class="form-group">
                    <label class="col-xs-3 control-label">주문코드</label>
                    <div class="col-xs-9"><input type="text" class="form-control" value="<c:out value='${vo.o_pay_amt}' />" readonly /></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">주문날짜</label>
                    <div class="col-xs-9"><input type="text" class="form-control" value="<c:out value='${vo.o_regdate}' />" readonly /></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">주소</label>
                    <div class="col-xs-9"><textarea class="form-control" rows="3" readonly><c:out value='${vo.o_addr}' />
<c:out value='${vo.o_addr_d}' /></textarea></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">기타사항</label>
                    <div class="col-xs-9"><textarea class="form-control" rows="3" readonly><c:out value='${vo.o_remarks}' /></textarea></div>
                </div>
            </div>
            <div class="col-lg-6 form-horizontal">
                <div class="form-group">
                    <label class="col-xs-3 control-label">결제방법</label>
                    <div class="col-xs-9"><input type="text" class="form-control" value="무통장입금" readonly /></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">결제금액(원)</label>
                    <div class="col-xs-9"><input type="text" class="form-control" value="<c:out value='${vo.o_pay_amt}' />" readonly /></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">상태</label>
                    <div class="col-xs-9"><input type="text" class="form-control" value="<c:out value='${vo.o_status}' />" readonly /></div>
                </div>
                <div class="form-group text-center">
                    <div>
                        <button type="button" class="btn btn-default">결제대기중</button>
                        <button type="button" class="btn btn-warning">결제완료</button>
                        <button type="button" class="btn btn-primary">배송중</button>
                    </div>
                    <div style="margin-top:10px;">
                        <button type="button" class="btn btn-success">배송완료</button>
                        <button type="button" class="btn btn-danger">주문취소</button>
                        <button type="button" class="btn btn-danger">배송취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //배송정보 -->

<%@include file="template/footer.jsp"%>