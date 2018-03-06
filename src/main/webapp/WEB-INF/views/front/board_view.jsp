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
							<h3>타이틀이 노출됩니다.</h3>
							<span>작성자 : 작성자ID</span>
							<span>IP : 192.168.*.*</span>
							<span>조회 : 0</span>
							<span>댓글 : 123</span>
							<span>작성일 : YYYY-MM-DD</span>
						</div>
						<div class="panel-body">
							내용내용
						</div>
					</div>

					<!-- 작성자 or 관리자만 노출 -->
					<div class="btnBox">
						<button type="button" class="btn btn-danger">삭제</button>
						<a href="board_update.html" class="btn btn-primary">수정</a>
					</div>

				</div>
				<!-- //커뮤니티 목록  -->
			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->

<%@ include file="template/footer.jsp" %>