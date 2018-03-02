<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>목록보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html;">
<script type="text/javascript">
	function insert_form() {
		//로그인상태 체크
		if ('${ empty user }' == 'true') {
			alert('글쓰기는 로그인하신후 가능합니다');
			location.href = '../member/login_form.do';
			return;
		}

		//입력폼으로 이동
		location.href = 'insert_form.do?page=${param.page}';
	}
</script>
</head>

<body>

	<div align="right" style="width: 700px; margin: auto;">
		<!-- 로그인이 안되어있으면 -->
		<c:if test="${ empty user }">
			<input type="button" value="로그인"
				onclick="location.href='../member/login_form.do?page=${param.page}'">
		</c:if>

		<!-- 로그인이 되어있으면 -->
		<c:if test="${ not empty user }">
	   ${ user.name }님 환영합니다.
	   <input type="button" value="로그아웃"
				onclick="location.href='../member/logout.do?page=${param.page}'">
		</c:if>
	</div>

	<!--로케이션 & 로그인끝-->
	<!--타이틀 영역-->
	<table width="700" align="center">
		<tr>
			<td>
				<table width="690" height="50" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/img/title_04.gif" onclick="location.href='../board/list.do?page=1'" border="0px"></td>
					</tr>
				</table> <!--타이틀 영역--끝-->
			</td>
		</tr>
		<tr>
			<td>
				<!--LIST START-->
				<table width="690" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="690" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="50" class="td_a">번호</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td class="td_b" width="300">제목</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">작성자</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>

									<td width="90" class="td_b">작성일</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td width="60" class="td_c">조회수</td>
								</tr>


								<!-- 데이터가 출력되는 부분 -->

								<c:forEach var="vo" items="${list}">
									<tr>
										<td align="center" class="td_a_1">${vo.no }</td>
										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td class="td_b_1 left">
											<!-- depth만큼 공백을 넣는다.  --> <c:forEach begin="1"
												end="${ vo.depth }">
										 &nbsp;&nbsp;
										</c:forEach> <!-- 답글이면 ㄴ 을 붙여라 --> <c:if test="${vo.depth !=0 }">
										ㄴ
										</c:if> <!-- 정상적인 글 --> 
										
										<c:if test="${ vo.readhit ne -1 }">    <!-- 파라메터 페이지정보가? 없으면 1 : 있으면 param.page (3항연산자)      -->
												<a href="view.do?idx=${ vo.idx }&page=${empty param.page ? 1 : param.page}
													&search=${param.search}&search_text=${param.search_text}" class="num"> ${ vo.subject }
												</a>
										</td>
										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${ vo.name }</td>
										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${ vo.regdate }</td>
										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td align="center" class="td_c_1">${ vo.readhit }</td>
										</c:if>

										<!-- 삭제된 글이면 -->
										<c:if test="${ vo.readhit eq -1 }">

											<font color=red>${ vo.subject }</font>
											
											<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
											<td align="center" class="td_b_1"></td>
											<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
											<td align="center" class="td_b_1"></td>
											<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
											<td align="center" class="td_c_1"></td>
										</c:if>
									</tr>
								</c:forEach>

								<!-- 게시물이 없을 겨우  -->
								<c:if test="${empty list } }">
									<tr>
										<td align="center" colspan="11" width="100%" height="50"
											style="border: 1 solid #efefef">현재 등록된 글이 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</td>
					</tr>
					<tr>
						<td height="8"></td>
					</tr>
					<tr>
						<td>
							<table width="690" border="0" cellpadding="0" cellspacing="0"
								bgcolor="#F1F5F4">
								<tr>
									<td width="7"><img src="${pageContext.request.contextPath}/resources/img/search_bg_01.gif"></td>
									<td class="f11" align="center">
									
									<!-- 페이지 메뉴관리 -->
									 ${ pageMenu }
									
									</td>
								</tr>
								<tr>
									<td width="7"><img src="${pageContext.request.contextPath}/resources/img/search_bg_01.gif"></td>
									<td class="f11" align="center">
									
									<!-- 검색 메뉴관리 -->
									  <%@ include file="search_menu.jsp" %>
									 
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif" onClick="insert_form();"
							style="cursor: hand"></td>
					</tr>

				</table> <!--WRITE,MODIFY,REPLY END-->
			</td>
		</tr>
	</table>
</body>

</html>