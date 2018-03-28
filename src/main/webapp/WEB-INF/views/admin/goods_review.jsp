<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>

<script>
var star = "";

function eval_delete(eval_no){
	swal({
		text : "정말 삭제하시겠습니까?",
		icon : "info",
		buttons : true
	}).then((willDelete) =>{
		if(willDelete) location.href = "eval_delete.do?eval_no="+eval_no;
	});
}
</script>

<!-- page title -->
<h1 class="page-header">상품평</h1>
<!-- //page title -->

<!-- page contents -->
<div class="panel panel-default">
	<div class="panel-heading">상품평 목록</div>
	<div class="panel-body">
		<!-- 상품평 리스트 -->
		<table width="100%" class="tableData table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>회원ID</th>
					<th>상품평점</th>
					<th>상품평타이틀</th>
					<th>등록일자</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${e_list}">
				<tr>
					<td><a href="goods_update_form.do?p_no=<c:out value='${list.p_no}'/>"><c:out value="${list.p_no}" /></a></td>
					<td><a href="member_update_form.do?m_id=<c:out value='${list.m_id}'/>"><c:out value="${list.m_id}" /></a></td>
					<td>
						<span id="personal_eval_${ list.eval_no }"></span>
                        <script>
                        	var starCount = ${ list.eval_score };
                        	star = "";
                        	for(var i=0;i<starCount;i++){
                        		star = star+"★";
                        	}
                        	$("#personal_eval_${ list.eval_no }").text(star);
                        </script>
					</td>
					<td class="text-left"><c:out value="${list.eval_title}" /></td>
					<td><c:out value="${list.eval_regdate}" /></td>
					<td><button type="button" class="btn btn-danger" onclick="eval_delete(${ list.eval_no });">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- //상품평 리스트 -->
	</div>
</div>
<!-- //page contents -->
				
<%@include file="template/footer.jsp" %>
