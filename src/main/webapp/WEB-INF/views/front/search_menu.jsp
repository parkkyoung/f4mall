<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function find(){
	
	var search = document.getElementById("search").value;
	var search_text = document.getElementById("search_text").value;
	
	//전체보기가 아니면서 검색내용이 없으면
	if(search != 'all' && search_text==''){
		alert('검색내용을 입력하세요.');
		document.getElementById("search_text").focus();
		return;
	}
	
	//검색카테고리 + 검색내용을 붙여서 목록요청
	location.href="list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
}
window.onload=function(){
	var search_array = [ 'all','name','subject','content','name_subject_content'];
	var search = document.getElementById("search");
	
	for(var i=0;i<search_array.length;i++){
		
		if('${param.search}'==search_array[i]){
			search[i].selected = true;
			break;
		}
	}
	
	
}



</script>
<style type="text/css">
.search_style{
 height: 25px;
}
</style>
</head>
<body >
	<select id="search"  class="search_style">
		<option value="all">전체보기</option>
		<option value="name">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
		<option value="name_subject_content">작성자+제목+내용</option>
		
	</select>
	<input id="search_text" value="${param.search_text}" class="search_style">
	<input type="button" name="검색" value="검색" onclick="find();" class="search_style">

</body>
</html>