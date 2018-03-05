<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file= "header.jsp"%>

	<table align="center" width="1000" border="1"
 style="border-collapse:collapse;font-size:12pt"
 bordercolor="navy" cellpadding="4" cellspacing="0">
		<tr>
			<td colspan="6">:: 장바구니 내용</td>
		</tr>
		<tr bgcolor="#dedede">
			<th>제품번호</th>
			<th width="25%">제품명</th>
			<th>단가</th>
			<th>수량</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>

		<!-- 데이터 출력부분 -->
		<!-- for(CartVo vo : list) -->
			<tr align="center">
				<td>123123</td>
				<td>나이키</td>
				<td>
					단가:<fmt:formatNumber value="30000"/><br>
					<font color="red">
					세일가격:<b><fmt:formatNumber value="27000"/></b>
					</font>
				</td>
				<td>
					<!-- 수량 조정 폼 -->
					<form action="cart_update.do" method="post">
						<input type="hidden" name="c_idx" value="123">
						<input name="c_cnt" size="4"  align="center" value="3">
						<input type="button" value="수정" onclick="modify(this.form);">
					</form>
				</td>
				<td><fmt:formatNumber value="3"/></td>
				<td>
					<input type="button" value="삭제"
	 style="border:1 solid black;cursor:hand"
	 onclick="location.href='cart_delete.do?c_idx=123'">
				</td>
			</tr>
		

		<tr>
			<td colspan="6" align="center">
				<b>장바구니가 비었습니다.</b>
			</td>
		</tr>



		<tr>
			<td colspan="5" align="right">
				총 결재액 :
			</td>
			<td><fmt:formatNumber value="4"/> </td>
		</tr>
	</table>
</body>
</html>