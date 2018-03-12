<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function comment_del(c_no){
	

	if(confirm('댓글을 삭제하시겠습니까?')==false){
		return;
	}
	
	location.href = 'board_comment_delete.do?c_no='+c_no+'&b_no=${param.b_no}&page=${ param.page }';
	
}

</script>



<!-- 댓글이 없을경우.-->
<c:if test="${ empty c_list }">
<div>
작성된 댓글이 없습니다.
</div>
</c:if>
<!-- //댓글이 없을경우.-->

<!-- 일반 댓글 -->
<c:forEach var="co"  items="${ c_list }">
<form>
<input type="hidden" name="page" value="${param.page}">
<input type="hidden" name="search_text" value="${param.search_text}">
<div>
	<div>${co.c_no } 작성자 : ${co.m_id }  작성일자 : ${co.c_regdate} (ip: ${co.c_ip})
	 <button type="button"  class="btn btn-danger" onclick="comment_del('${co.c_no}');">삭제</button>
	</div>
	<div class="m_id"> ${co.c_content} </div>

</div>
</form>
 </c:forEach>
<!-- //일반 댓글 -->

</html>