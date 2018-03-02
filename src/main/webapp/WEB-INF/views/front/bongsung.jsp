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
	
	
	<table border="3">
		<tr>
			<td>m_id</td>
			<td>o_no</td>
			<td>category_no</td>
			<td>material_no</td>
			<td>color_no</td>
			<td>sex_no</td>
			<td>brand_no</td>
			<td>size_no</td>
			<td>m_pwd</td>
			<td>m_name</td>
			<td>m_addr</td>
			<td>m_addr_d</td>
			<td>m_zipcode</td>
			<td>m_ip</td>
			<td>m_regdate</td>
			<td>m_tel</td>
			<td>m_image</td>
		</tr>
		
		<c:forEach var="m_list" items="${ m_list }">
		<tr>
			<td>${ m_list.m_id }</td>
			<td>${ m_list.o_no }</td>
			<td>${ m_list.category_no }</td>
			<td>${ m_list.material_no }</td>
			<td>${ m_list.color_no }</td>
			<td>${ m_list.sex_no }</td>
			<td>${ m_list.brand_no }</td>
			<td>${ m_list.size_no }</td>
			<td>${ m_list.m_pwd }</td>
			<td>${ m_list.m_name }</td>
			<td>${ m_list.m_addr }</td>
			<td>${ m_list.m_addr_d }</td>
			<td>${ m_list.m_zipcode }</td>
			<td>${ m_list.m_ip }</td>
			<td>${ m_list.m_regdate }</td>
			<td>${ m_list.m_tel }</td>
			<td>${ m_list.m_image }</td>
		</tr>
		</c:forEach>
		
	</table>
	
</body>
</html>