
<!-- /*	2018년3월7일(seo) 	*/  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<!-- smarteditor 사용을 위한 파일 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- visual -->
<section class="subVisual">
	<img src="http://placehold.it/1200x300" alt="sub visual" class="wFull" />
</section>
<!-- //visual -->


<script type="text/javascript">
/* <!-- script SmartEditer --> */

	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "editor",
	        sSkinURI: "./resources/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : true,
	        }
	    });
	    //전송버튼
	    $("#insertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#f").submit();
	    });
	});
/* <!-- //script SmartEditer --> */
/* <!-- script btn_write  --> */
function send(f){
	var b_name = f.b_name.value;
	var b_notice = f.b_notice.value;
	var b_content = f.b_content.value;
	
	if(b_name=""){
		alert("제목을 입력해주세요.");
		f.b_name.focus();
		return;
	}
	
	f.submit();
	
}

/* <!-- //script btn_write  --> */


</script>



<!-- sub contents -->
<section class="sub container">
	<h2 class="hide">커뮤니티 등록</h2>
	
	<!-- 커뮤니티 등록  -->
	<div class="board boardInsert">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="id" value="${ user.m_id }">
	
		<!-- action="./insertBoard.do" -->
		<form name="f" class="form-horizontal widthM" method="post" id="insertBoardFrm" enctype="multipart/form-data">

			<!-- 관리자만 노출 -->
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">공지사항여부</label>
				<div class="col-sm-10">
					<select name="b_notice" class="form-control">
						<option value=0 selected>X</option>
						<option value=1 >O</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input name="b_name" type="text" class="form-control" placeholder="게시글 제목" />
				</div>
			</div>


			<div class="form-group">
				<label for="" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea rows="20" class="form-control" name="b_content" id="editor" ></textarea>
				</div>
			</div>

			<div class="form-group btnBox">
				<a href="board_list.do?page=${param.page}" class="btn btn-default">취소</a>
				<a onclick="send(this.form); return false;" class="btn btn-primary">글쓰기</a>
			</div>
		</form>
	</div>
	<!-- //커뮤니티 등록  -->
</section>

<%@include file="template/footer.jsp" %>

<!-- /*	//2018년3월7일(seo) 	*/ -->