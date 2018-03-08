<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="template/header.jsp" %>
<script type="text/javascript">

/* delete */
function del(){
	
	if(confirm('작성하신글을 삭제하시겠습니까?')==false){
		return;
	}
	location.href = "board_delete.do?b_no=${vo.b_no}&page=${param.page}&search=${param.search}&search_text=${param.search_text}";

	return;
}


</script>
		<!-- contents -->
		<div id="container">
		<!--  parameter -->
		<input type="hidden" name="url" value="${ param.url }">
		<input type="hidden" name="page" value="${param.page }"> <input
			type="hidden" name="search" value="${param.search }"> <input
			type="hidden" name="search_text" value="${param.search_text }">	
			<!-- visual -->
			<section class="subVisual">
				<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">커뮤니티 상세</h2>
				
				<!-- 커뮤니티 목록  -->
				<div class="board boardView">
					<!-- <div class="bvHead">
						<h3 class="bvTitle">타이틀이 노출됩니다.</h3>
						<span>작성자 : 작성자ID</span>
						<span>IP : 192.168.*.*</span>
						<span>조회 : 0</span>
						<span>댓글 : 123</span>
						<span>작성일 : YYYY-MM-DD</span>
					</div>
					<div class="bvCon">
						내용내용
					</div> -->
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>${vo.b_name}</h3>
							<span>작성자 : ${vo.m_id}</span>
							<span>IP : ${vo.b_ip}</span>
							<span>조회 : ${vo.b_readhit }</span>
							<span>댓글 : 123</span>
							<span>작성일 : ${vo.b_regdate }</span>
						</div>
						<div class="panel-body">
							${vo.b_content }
						</div>
					</div>

					<!-- 작성자 or 관리자만 노출 -->
					<div class="btnBox">
						<button type="button" class="btn btn-danger" onclick="del()">삭제</button>
						<a href="board_update.html" class="btn btn-primary">수정</a>
					</div>

				</div>
				<!-- //커뮤니티 목록  -->
			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->

<%@ include file="template/footer.jsp" %>