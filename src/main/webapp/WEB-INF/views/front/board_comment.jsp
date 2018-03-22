<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

function comment_del(c_no){
	
	if(confirm('댓글을 삭제하시겠습니까?')==false){
		return;
	}
	location.href = 'board_comment_delete.do?c_no='+c_no+'&b_no=${param.b_no}&page=${ param.page }';
}

</script>
<!-- 댓글목록 -->
<input type="hidden" name="page" value="${param.page}">
<input type="hidden" name="search_text" value="${param.search_text}">
<div class="commentsList">
	<table class="table">
		<tbody>
			<!-- 댓글이 없을경우.-->
			<c:if test="${ empty c_list }">
			</c:if>
			<!-- //댓글이 없을경우.-->
			<!-- Loop -->
			<c:forEach var="co"  items="${ c_list }">
			<tr>
				<td class="cImg"><img src="" alt="user thumbnail" ></td>
				<td class="cId">${co.c_nick }</td>
				<td class="cContent">${co.c_content}</td>
				<td class="cDate text-right">${co.c_regdate}</td>
				
				
				<!-- 관리자나 작성자가 아니면 삭제 불가 -->
				<c:choose>
				<c:when test="${user.m_id eq co.m_id || user.m_id eq 'admin@f4mall.com' }">
				<td class="cIp text-right"><c:out value="${co.c_ip}" /> &nbsp;
				<button type="button"  class="btn btn-danger" onclick="comment_del('${co.c_no}');">삭제</button></td>
				</c:when>
				
				<c:when test="${uesr.m_id ne co.m_id}">
				<td class="cIp"><c:out value="${co.c_ip}"/></td>	
				</c:when>
				
				<c:otherwise>
				<td class="cIp"><c:out value="${co.c_ip}"/></td>	
				</c:otherwise>
				
				</c:choose>
				<!-- //관리자나 작성자가 아니면 삭제 불가 -->
			</tr>
			
			 </c:forEach>
			<!-- //Loop -->
		</tbody>
	</table>
	<!-- //댓글목록 -->
</div>