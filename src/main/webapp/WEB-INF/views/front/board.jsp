<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="template/header.jsp"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<script type="text/javascript">

$(function() {
    // 게시판 리스트 말줄임
    var blSubjectWidth = 0;
    function blSubjectEllipsis() {
        if ($(window).width() > 767) {
            blSubjectWidth = $(".boardList").width() * 0.5 - 20;
            $(".blSubject a").css("width", blSubjectWidth);
        } else {
            blSubjectWidth = $(".boardList").width() * 0.7 - 20;
            $(".blSubject a").css("width", blSubjectWidth);
        }
    }
    ;
    blSubjectEllipsis();
    $(window).resize(function() {
        blSubjectEllipsis();
    });
});
/* insert btn */
function insert_form(){
	//로그인상태 체크
	if ('${empty user}' == 'true') {
		 swal({
			  title: "로그인 하시겠습니까?",
			  text: "글쓰기는 로그인이후에 이용가능합니다.",
			  type: "success",
			  buttons: true,
			}).then((willDelete) =>{
				if(willDelete) $("#loginPop").modal();
			});
		
	} else {	
		//입력폼으로 이동
		location.href = 'board_insert_form.do?page=${param.page}';
	}
	
}
/*//insert btn */
function find(){
	
	var search_text = document.getElementById("search_text").value;
	
	if(search_text==''){
		swal({
			text : "검색할 내용을 입력하세요",
			icon : "error",
		}).then((value) => {
			document.getElementById("search_text").focus();
			return;
		});
	} else {
		location.href="board_list.do?&search_text=" + encodeURIComponent(search_text);
	}

}
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
	<h2 class="hide">커뮤니티 목록</h2>

	<!-- search box -->
	<div class="searchBox">
		<input type="text" id="search_text" value="${param.search_text}" placeholder="search"  onkeyup="if (window.event.keyCode == 13) find();"/>
		<button type="button" name="검색" onclick="find();"><i class="fa fa-search fa-w-16"></i></button>
	</div>
	<!-- //search box -->
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
						<th class="blViewing mHide">조회수(댓글수)</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시글 없을경우 -->
					<c:if test="${empty list }">
						<tr>
							<td>현재 등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<!-- //게시글 없을경우 -->
					
					<!-- 공지사항 Loop -->
					<c:forEach var="vo" items="${list}">
						<c:if test="${vo.b_notice eq 1 }">
							<tr class="active">
								<td class="blNo mHide">공지</td>
								<td class="blSubject">
								
									<a href="board_view.do?b_no=${vo.b_no}&page=${empty param.page ? 1 : param.page}&search_text=${param.search_text}">
									 
										<!--  NewBoard  -->
										<c:if test="${vo.b_regdateShort eq vo.todayShort }"><c:out value="${vo.b_name}" /> <img alt="" src="${pageContext.request.contextPath }/resources/front/img/new.jpg"></c:if>
										<c:if test="${vo.b_regdateShort ne vo.todayShort }"><c:out value="${vo.b_name}" /></c:if>
										<!--  //NewBoard  -->
									</a>
								</td>
								<td class="blId"><c:out value="${vo.b_nick}" /></td>
								<td class="blDate mHide"><c:out
										value="${vo.b_regdateShort}" /></td>
								<td class="blViewing mHide"><c:out value="${vo.b_readhit}" />( <c:out value="${vo.listCount}"/> )</td>
							</tr>
						</c:if>
					
					<!-- //공지사항 Loop -->

					<!-- 일반글 Loop -->

						<c:if test="${vo.b_notice eq 0 }">
							<tr>
								<td class="blNo mHide"><c:out value="${vo.cnt-vo.no+1}" /></td>
								
								<td class="blSubject">
									<a href="board_view.do?b_no=${vo.b_no}&page=${empty param.page ? 1 : param.page}&search_text=${param.search_text}">

										<!-- Depth  -->
										<c:forEach begin="1" end="${ vo.b_depth }">&nbsp;&nbsp;</c:forEach>
										<c:if test="${vo.b_depth !=0 }">
										<i class="fa fa-share fa-fw fa-flip-vertical"></i>
										</c:if> 
										<!-- //Depth  -->
										
										<!--  NewBoard  -->
										<c:if test="${vo.b_regdateShort eq vo.todayShort }"><c:out value="${vo.b_name}" />  <img style="margin-top: 4px" src="${pageContext.request.contextPath }/resources/front/img/new.jpg"></c:if>
										<c:if test="${vo.b_regdateShort ne vo.todayShort }"><c:out value="${vo.b_name}" /></c:if>
										<!--  //NewBoard  -->

									</a>
								</td>
								
								
								<td class="blId"><c:out value="${vo.b_nick}" /></td>
								<td class="blDate mHide"><c:out
										value="${vo.b_regdateShort}" /></td>
								<td class="blViewing mHide"><c:out value="${vo.b_readhit}" /> ( <c:out value="${vo.listCount}"/> )</td>
							</tr>
						</c:if>
					</c:forEach>
					<!-- //일반글 Loop -->
				</tbody>
			</table>
		</div>
        <!-- pagenation -->
        <nav class="text-center">
            <ul class="pagination">
                ${pageMenu}
                
                <li>
                  <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                
                <li>
                  <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
                
            </ul>
        </nav>
        <!-- //pagenation -->
        
		
		<div class="btnBox">
			<a onclick="insert_form();" class="btn btn-primary">글쓰기</a>
		</div>
	</div>
	<!-- //커뮤니티 목록  -->
</section>
<!-- //sub contents -->
<%@ include file="template/footer.jsp"%>