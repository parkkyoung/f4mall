<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
		<!-- contents -->
		<div id="container">
			
			<!-- visual -->
			<section class="subVisual">
				<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
			</section>
			<!-- //visual -->
			
			<!-- sub contents -->
			<section class="sub container">
				<h2 class="hide">커뮤니티 수정</h2>
				
				<!-- 커뮤니티 수정  -->
				<div class="board boardInsert">
					
					<form action="" class="form-horizontal widthM">

						<!-- 괄리자만 노출 -->
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">공지사항여부</label>
							<div class="col-sm-10">
								<select class="form-control">
									<option value="" selected>X</option>
									<option value="">O</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="" class="col-sm-2 control-label">작성자 ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="rudals0731@naver.com" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="게시글 제목" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea rows="20" class="form-control"></textarea>
							</div>
						</div>
						<div class="form-group btnBox">
							<a href="board.html" class="btn btn-default">취소</a>
							<a href="board.html" class="btn btn-primary">수정</a>
						</div>
					</form>
				</div>
				<!-- //커뮤니티 수정  -->
			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->

		<%@ include file="footer.jsp" %>
</body>
</html>