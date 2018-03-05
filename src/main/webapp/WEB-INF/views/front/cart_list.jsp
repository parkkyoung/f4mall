<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file= "template/header.jsp"%>

	<table border="1" align="center" width='1000'>
		<tr>
			<td>선택</td>
			<td>상품번호</td>
			<td>상품명</td>
			<td>상품단가</td>
			<td>할인가격</td>
			<td>배송비</td>
			<td>수량</td>
			<td>주문</td>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td>1</td>
			<td>나이키</td>
			<td>20000</td>
			<td>18000</td>
			<td>3000</td>
			<td><input type="text"></td>
			<td>취소하기<br>주문하기</td>
		</tr>
		
	</table>
	<br><br>
	<table border="1" align="center" width='1000'>
		<tr>
			<td>총 상품 단가</td>
			<td>총 할인 가격</td>
			<td>결제예상금액</td>
		</tr>
		<tr>
			<td>60000</td>
			<td>54000</td>
			<td>57000</td>
		</tr>
	</table>
	<br><br>
	<table border="1" align='center'>
	<tr>
		<td>
			<input type="button" value="선택주문하기">
		</td>
		<td>
			<input type="button" value="전체주문하기">
		</td>
	</tr>
	</table>
	<br><br>
	<table border='1' align='center' width='1000'>
		<tr>
			<td>수령자</td>
			<td>김봉성</td>
		</tr>
		<tr>
			<td>배달주소</td>
			<td>서울시 송파구 잠실동</td>
		</tr>
		<tr>
			<td>배달상세주소</td>
			<td>롯데타워 98층 9801호</td>
		</tr>
	</table>
</body>
</html>