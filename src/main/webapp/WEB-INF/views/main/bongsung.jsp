<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>test_idx</td>
			<td>test_no</td>
			<td>test_text</td>
		</tr>
		
		<c:forEach var="list" items="${ list }">
		<tr>
			<td>${ list.test_idx }</td>
			<td>${ list.test_no }</td>
			<td>${ list.test_text }</td>
		</tr>
		</c:forEach>
		
	</table>
</body>
</html>