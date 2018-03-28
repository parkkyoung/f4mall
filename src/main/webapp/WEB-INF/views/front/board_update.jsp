<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="template/header.jsp" %>
<!-- ckeditor -->
<script
src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<!-- //ckeditor -->
<script type="text/javascript">

function send(f){
	
	//var name= f.name.value;
	var b_name = f.b_name.value;
	var b_content = f.b_content.value;
	var b_content = CKEDITOR.instances.b_content.getData();
	
	if(b_name==""){
		alert("제목을 입력해주세요.");
		f.b_name.focus();
		return;
	}
	if(b_content==""){
		alert("내용을 입력해주세요.");
		f.b_content.focus();
		return;
	}

		swal({
	         text : "수정하시겠습니까?",
	         icon : "info",
	         buttons : true
	      }).then((willDelete) =>{
	         if(willDelete) f.submit();
	      });
	   };
</script>

<!-- visual -->
<section class="subVisual">
    <h2>COMMUNITY</h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_board.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_board.jpg" alt="sub visual" class="imgMobile" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
	<h2 class="hide">커뮤니티 수정</h2>
	
	<!-- 커뮤니티 수정  -->
	<div class="board boardInsert">
		
		<form name="f" action="board_update.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}" class="form-horizontal widthM">
		<input type="hidden" name="m_id" value="${user.m_id}">
		<input type="hidden" name="b_no" value="${param.b_no}">
		<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="search" value="${param.search }">
		<input type="hidden" name="search_text" value="${param.search_text }">
		<input type="hidden" name="b_notice" value="0">

			<div class="form-group">
				<label for="" class="col-sm-2 control-label">작성자 ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" value="${user.m_id}" readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input name="b_name" value="${vo.b_name}" type="text" class="form-control" placeholder="게시글 제목" />
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea name="b_content" rows="20" class="form-control">${vo.b_content}</textarea>
							<script>
							// Replace the <textarea id="editor1"> with a CKEditor
							// instance, using default configuration.
							CKEDITOR
									.replace(
											'b_content',
											{
												filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditorImageUpload.do'
											});
		
							CKEDITOR.on('dialogDefinition', function(ev) {
								var dialogName = ev.data.name;
								var dialogDefinition = ev.data.definition;
		
								switch (dialogName) {
								case 'image': //Image Properties dialog
									//dialogDefinition.removeContents('info');
									dialogDefinition.removeContents('Link');
									dialogDefinition.removeContents('advanced');
									break;
								}
							});
						</script>
				</div>
			</div>
			<div class="form-group btnBox">
				<a href="board_list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}" class="btn btn-default">취소</a>
				<button type="button" onclick='send(this.form); return false;' class="btn btn-primary" >수정</button>
			</div>
		</form>
	</div>
	<!-- //커뮤니티 수정  -->
</section>
<!-- //sub contents -->

<%@ include file="template/footer.jsp" %>