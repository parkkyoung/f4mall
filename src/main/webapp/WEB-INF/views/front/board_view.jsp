<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="template/header.jsp" %>
<script type="text/javascript">


/* reply */
function reply(){

	//로그인 했냐?
	 if ('${empty user}' == 'true') {
		 swal({
			  title: "로그인 하시겠습니까?",
			  text: "답글은 로그인이후에 이용가능합니다.",
			  type: "success",
			  buttons: true,
			}).then((willDelete) =>{
				if(willDelete) $("#loginPop").modal();
			});
		
	} else {	
		location.href = 'board_reply_form.do?b_no=${vo.b_no}&page=${ param.page }';
	}
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
	location.href = "board_update_form.do?b_no=${vo.b_no}&page=${param.page}&search_text=${param.search_text}";

	return;
}
/* comment_list_page*/
 function comment_list(){
	$.ajax({
		url:'board_comment_list.do',
		data:{'b_no':'${param.b_no}'},
		success:function(data){
			$('#board_comment_list').html(data);
		}	
	});
	
}
/* comment_list 불러오기*/
$(document).ready(function(){
	//댓글목록을 가져온다.
	comment_list();
	
	//글쓰기 버튼이 눌리면
	$('#comment_bt_insert').click(function(){
		
		var url = document.location.href;
		
		
		//로그인 했냐?
		 if ('${empty user}' == 'true') {
			 swal({
				  title: "로그인 하시겠습니까?",
				  text: "댓글은 로그인이후에 이용가능합니다.",
				  type: "success",
				  buttons: true,
				}).then((willDelete) =>{
					if(willDelete) $("#loginPop").modal();
				});		
		} 	
		var c_content = document.getElementById("comment_content").value;
		if ('${empty user}' != 'true') {
			if(c_content==''){
				swal("Error", "댓글 내용을 입력해주세요.","warning")
			}
		}
		
		$.ajax({
			url: 'board_comment_insert.do',
			data:{'b_no':'${vo.b_no}',
				  'm_id':'${user.m_id}',
				  'c_content':c_content
			},
			success:function(data){
				if(data.indexOf("fail") != -1){
					alert("댓글달기 실패했습니다.");
					return;
				}
				comment_list();		
				$('#comment_content').val("");
			}		
		});
	});
});

</script>
	<!-- contents -->
	<div id="container">
		<!-- visual -->
		<section class="subVisual">
			<h2>커뮤니티</h2>
			<img src="${ pageContext.request.contextPath }/fornt/img/visual/bg_visual_pc_board.jpg" alt="sub visual" class="imgPc" />
			<img src="${ pageContext.request.contextPath }/front/img/visual/bg_visual_mobile_board.jpg" alt="sub visual" class="imgMobile" />
		</section>
		<!-- //visual -->
		
		<!--  parameter -->
		<input type="hidden" name="url" value="${ param.url}">
		<input type="hidden" name="page" value="${param.page}"> 
		<input type="hidden" name="search" value="${param.search}"> 
		<input type="hidden" name="search_text" value="${param.search_text}">
		<!--  //parameter -->	
	
		<!-- sub contents -->
		<section class="sub container">
			<h2 class="hide">커뮤니티 상세</h2>
		
			<!-- 커뮤니티 목록  -->
			<div class="board boardView">
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
					<c:if test="${uesr.m_id eq vo.m_id || user.m_grade eq 1}">
					<button type="button" class="btn btn-danger" onclick="del()">삭제</button>
					<button type="button" onclick="update()" class="btn btn-primary">수정</button>
					</c:if>
					<button type="button" class="btn btn-success" onclick="reply()">답글</button>
					<button type="button" class="btn btn-info" onclick="location.href='board_list.do?page=${param.page}&search_text=${param.search_text}'">목록</button>
				</div>
				<!-- //작성자 or 관리자만 노출 -->
			</div>
			<!-- //커뮤니티 목록  -->
		
			<!-- 댓글 -->
			<div class="comments">
			
				<!-- 댓글쓰기 -->
				<div class="commentsInsert row">
					<div class="col-sm-10 col-xs-9"><textarea id="comment_content" class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea></div>
					<div class="col-sm-2 col-xs-3"><button id="comment_bt_insert" type="button" class="btn btn-primary btn-block">작성</button></div>	
				</div>
				<!-- //댓글쓰기 -->
				
				<!-- 댓글목록 -->
				<div id="board_comment_list" class="mt20"></div>
				<!-- //댓글목록 -->
			</div>
			<!-- //댓글 -->
		</section>
		<!-- //sub contents -->
	</div>
	<!-- //contents -->
		

<%@ include file="template/footer.jsp" %>