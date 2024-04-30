<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Board List Page</h1>
	
	<!-- Search Line  -->
	<div>
		<form action="/brd/list" method="get">
			<div>
				<select name="type">
					<option ${ph.pgvo.type eq null ? "selected" : "" }>Choose...</option>
					<option value="t" ${ph.pgvo.type eq "t" ? "selected" : "" }>title</option>
					<option value="w" ${ph.pgvo.type eq "w" ? "selected" : "" }>title>writer</option>
					<option value="c" ${ph.pgvo.type eq "c" ? "selected" : "" }>title>content</option>		
				</select>
				
				<input type="text" name="keyword" placeholder="Search" value="${ph.pgvo.keyword }">
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
				<button type="submit">Search</button>
				<span>totalCount : ${ph.totalCount }</span>
			</div>		
		</form>
	</div>
	
	<div  class="container-sm">
	<table  class="table table-dark table-striped">
		<tr>
			<th>bno</th>
			<th>title</th>
			<th>writer</th>
			<th>regdate</th>
			<th>readCount</th>
		</tr>
	<!-- DB에서 가져온 리스트를 c:FOREACH를 통해 반복 출력  -->
	<c:forEach items="${list }" var="bvo">
		<tr>
			<td>${bvo.bno }</td>
			<td><a href="/brd/detail?bno=${bvo.bno }"> <img alt="" src="/_fileUpload/_th_${bvo.imageFile }"> ${bvo.title } </a></td>
			<td>${bvo.writer }</td>
			<td>${bvo.regdate }</td>		
			<td>${bvo.readCount }</td>		
		</tr>
	
	</c:forEach>
	</table>
	<a href="../index.jsp"><button type="button">index</button></a>
	
	<!-- Paing Line => ph  -->
	<div>
		<!-- prev  -->
		<c:if test="${ph.prev }">
		 <a href="/brd/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ⇐ </a>
		 </c:if>
		<!-- paging  -->
		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
			<a href="/brd/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
		</c:forEach>
		<!-- next  -->
		<c:if test="${ph.next }">
		  <a href="/brd/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ⇒ </a>
		</c:if>
		
	</div>
	
	
	
	</div>
	
</body>
</html>