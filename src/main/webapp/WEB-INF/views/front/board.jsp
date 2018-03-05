<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp" %>
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
								<!-- 공지사항 Loop -->
								<tr class="active">
									<td class="blNo mHide">1</td>
									<td class="blSubject"><a href="board_view.html">공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.공지사항 제목입니다.</a></td>
									<td class="blId">작성자ID</td>
									<td class="blDate mHide">YYYY-MM-DD</td>
									<td class="blViewing mHide">0</td>
								</tr>
								<tr class="active">
									<td class="blNo mHide">0</td>
									<td class="blSubject"><a href="board_view.html">공지사항 제목입니다.</a></td>
									<td class="blId">작성자ID</td>
									<td class="blDate mHide">YYYY-MM-DD</td>
									<td class="blViewing mHide">0</td>
								</tr>
								<!-- //공지사항 Loop -->

								<!-- 일반글 Loop -->
								<tr>
									<td class="blNo mHide">4</td>
									<td class="blSubject"><a href="board_view.html">제목입니다.</a></td>
									<td class="blId">작성자ID</td>
									<td class="blDate mHide">YYYY-MM-DD</td>
									<td class="blViewing mHide">0</td>
								</tr>
								<!-- //일반글 Loop -->
								<tr>
									<td class="blNo mHide">3</td>
									<td class="blSubject"><a href="board_view.html">제목입니다.</a></td>
									<td class="blId">작성자ID</td>
									<td class="blDate mHide">YYYY-MM-DD</td>
									<td class="blViewing mHide">0</td>
								</tr>
								<tr>
									<td class="blNo mHide">2</td>
									<td class="blSubject"><a href="board_view.html">제목입니다.</a></td>
									<td class="blId">작성자ID</td>
									<td class="blDate mHide">YYYY-MM-DD</td>
									<td class="blViewing mHide">0</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnBox">
						<a href="board_insert.html" class="btn btn-primary">글쓰기</a>
					</div>
				</div>
				<!-- //커뮤니티 목록  -->
			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->
<%@ include file="template/footer.jsp" %>