<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="template/header.jsp" %>
<script type="text/javascript">


/* reply */
function reply(){
	
	//로그인 했냐?
			 if ('${empty user}' == 'true') {

				if (confirm('로그인하시겠습니까?') == false) {
					return;
				}
				
				$("#loginPop").modal();
				/* var url = document.location.href;
				
				url = url.replace("view.do","reply_form.do")

				location.href = "../member/login_form.do?url="+escape(url); */

				return;
			} 

			location.href = 'board_reply_form.do?b_no=${vo.b_no}&page=${ param.page }';
}
/* delete */
function del(){
	
	if(confirm('작성하신글을 삭제하시겠습니까?')==false){
		return;
	}
	location.href = "board_delete.do?b_no=${vo.b_no}&page=${param.page}&search=${param.search}&search_text=${param.search_text}";

	return;
}
/* update */
function update(){
	
	if (confirm('작성하신글을 수정하시겠습니까?') == false) {
		return;
	}
	location.href = "board_update_form.do?b_no=${vo.b_no}&page=${param.page}&search=${param.search}&search_text=${param.search_text}";

	return;
}
/* comment_list_page*/
 function comment_list(page){
	$.ajax({
		url:'board_comment_list.do',
		date:{'b_no':'${vo.b_no}','page':page},
		success:function(data){
			$('#board_comment_list').html(data);
		}	
	});
	
}
/* comment_list 불러오기*/
$(document).ready(function(){
	//댓글목록을 가져온다.
	comment_list(1);
	
	
	
});

</script>
		<!-- contents -->
		<div id="container">
		<!--  parameter -->
		<input type="hidden" name="url" value="${ param.url}">
		<input type="hidden" name="page" value="${param.page}"> 
		<input type="hidden" name="search" value="${param.search}"> 
		<input type="hidden" name="search_text" value="${param.search_text}">	
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
						<button type="button" onclick="update()" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-success" onclick="reply()">답글</button>
					</div>

				</div>
				<!-- //커뮤니티 목록  -->
				
				<!-- comment  -->
				<div id="comment_form" class="mt40">
					<textarea id="comment_content" class="form-control" rows="3"><label for="loginPw" class="col-sm-2 col-xs-3 control-label">Password</label></textarea>
					<div class="text-right mt10"><button id="comment_bt_insert" type="button" class="btn btn-primary">댓글달기</button></div>
				</div>
					
				<!-- //comment  -->
				
				<!-- comment list -->
				<div id="board_comment_list"></div>
				<!-- //comment list -->
			</section>
			<!-- //sub contents -->
		</div>
		<!-- //contents -->
		

<%@ include file="template/footer.jsp" %>