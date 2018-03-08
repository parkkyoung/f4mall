<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




<!-- 댓글이 없을경우.-->
<c:if test="${ empty c_list }">
<div>
작성된 댓글이 없습니다.
</div>
</c:if>
<!-- //댓글이 없을경우.-->

<!-- 일반 댓글 -->
<c:forEach var="co"  items="${ c_list }">
<div   class="comment_style">
	<div>${co.c_no } 작성자 : ${co.m_id }  작성일자 : ${co.c_regdate} (ip: ${co.c_ip}) <button type="button"   id="delete_comment" class="btn btn-danger">삭제</button></div>
	<div class="m_id"> ${co.c_content} </div>
	
</div>
 </c:forEach>
<!-- //일반 댓글 -->

</html>