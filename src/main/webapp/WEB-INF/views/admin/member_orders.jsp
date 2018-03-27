<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>


<!-- page title -->
<h1 class="page-header">주문목록</h1>
<!-- //page title -->

<!-- 주문목록 -->
<div class="panel panel-default">
	<div class="panel-heading">주문목록</div>
	<div class="panel-body">
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>주문코드</th>
                    <th>ID</th>
                    <th>결제금액(원)</th>
                    <th>상태</th>
					<th>주문일자</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- Loop -->
				<c:forEach var="mo_list" items="${mo_list }">
					<tr>
						<td><a href="member_order.do?o_no=${mo_list.o_no }"><c:out value="${mo_list.o_no }" /></a></td>
                        <td><a href="member_update_form.do?m_id=${mo_list.m_id}"><c:out value="${mo_list.m_id }" /></a></td>
                        <td><c:out value="${mo_list.o_pay_amt }" /></td>
                        <td>    
                            <%-- 0 = 결제대기, 1 = 결제완료, 2 = 배송중, 3 = 배송완료, 4 = 주문취소, 5 = 배송취소--%>
                            <c:choose>
                                <c:when test="${mo_list.o_status eq 0}"><span>결제대기</span></c:when>
                                <c:when test="${mo_list.o_status eq 1}"><span style='color:red'>결제완료</span></c:when>
                                <c:when test="${mo_list.o_status eq 2}"><span style='color:blue'>배송중</span></c:when>
                                <c:when test="${mo_list.o_status eq 3}"><span style='color:green'>배송완료</span></c:when>
                                <c:when test="${mo_list.o_status eq 4}"><span>배송취소</span></c:when>
                                <c:when test="${mo_list.o_status eq 5}"><span>주문취소</span></c:when>
                                <c:otherwise><span style='color:#FF1212'>주문오류</span></c:otherwise>
                            </c:choose>     
                        </td>
						<td><c:out value="${mo_list.o_regdate }" /></td>
						
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		<!-- /.table-responsive -->
	</div>
	<!-- /.panel-body -->
</div>
<!-- //주문목록 -->

<%@include file="template/footer.jsp"%>