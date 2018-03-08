<!-- /*	2018년3월7일(seo) 	*/-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!-- script btn_write -->
<script type="text/javascript">
function insert_form(){
	//로그인상태 체크
	/* if ('${ empty user }' == 'true') {
		alert('글쓰기는 로그인하신후 가능합니다');
		location.href = '../front/login_form.do';
		return;
	} */
	//입력폼으로 이동
	location.href = 'board_insert_form.do?page=${param.page}';
}

</script>
<!-- //script -->

<!-- contents -->
<div id="container">

	<!-- visual -->
	<section class="subVisual">
		<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
	</section>
	<!-- //visual -->

	<!-- sub contents -->
	<section class="sub container">
		<h2 class="hide">커뮤니티 목록</h2>

		<!-- 커뮤니티 목록  -->
		<div class="board boardList">
			<div class="table-reponsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="blNo mHide">No</th>
							<th class="blSubject">제목</th>
							<th class="blId">ID</th>
							<th class="blDatem mHide">작성일</th>
							<th class="blViewing mHide">조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- 게시글 없을경우 -->
						<c:if test="${empty list }">
							<tr>
								<td align="center" colspan="11" width="100%" height="50"
									style="border: 1 solid #efefef">현재 등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<!-- //게시글 없을경우 -->
						
						<!-- 공지사항 Loop -->
						<c:forEach var="vo" items="${list}">
							<c:if test="${vo.b_notice eq 1 }">
								<tr class="active">
									<td class="blNo mHide">공지</td>
									<td class="blSubject"><a href="board_view.do?b_no=${vo.b_no}&page=${empty param.page ? 1 : param.page}
									 &search=${param.search}&search_text=${param.search_text}">
									 <c:out value="${vo.b_name}" /></a></td>
									<td class="blId"><c:out value="${vo.m_id}" /></td>
									<td class="blDate mHide"><c:out
											value="${vo.b_regdateShort}" /></td>
									<td class="blViewing mHide"><c:out value="${vo.b_readhit}" /></td>
								</tr>
							</c:if>
						
						<!-- //공지사항 Loop -->

						<!-- 일반글 Loop -->

							<c:if test="${vo.b_notice eq 0 }">
								<tr>
									<td class="blNo mHide"><c:out value="${1+vo.cnt-vo.no+1}" /></td>
									<td class="blSubject">
									<c:if test="${vo.b_depth !=0 }">ㄴ</c:if> 
									<a href="board_view.do?b_no=${vo.b_no}&page=${empty param.page ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}">
									<c:out value="${vo.b_name}" /></a></td>
									<td class="blId"><c:out value="${vo.m_id}" /></td>
									<td class="blDate mHide"><c:out
											value="${vo.b_regdateShort}" /></td>
									<td class="blViewing mHide"><c:out value="${vo.b_readhit}" /></td>
								</tr>
							</c:if>
						</c:forEach>
						<!-- //일반글 Loop -->

						
					</tbody>
				</table>
			</div>
			
			<!-- page table  -->
			<table align="center">
				<tr>
					<td>${pageMenu}</td>
				</tr>
				

			</table>
			<%@ include file="board_search.jsp" %>
			<div class="btnBox">
				<!-- <a href="board_insert.html" class="btn btn-primary">글쓰기</a> -->
				<a onclick="insert_form();" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
		<!-- //커뮤니티 목록  -->
	</section>
	<!-- //sub contents -->
</div>
<!-- //contents -->
<%@ include file="template/footer.jsp"%>
<!-- /*	//2018년3월7일(seo) 	*/-->