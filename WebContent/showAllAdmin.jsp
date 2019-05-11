<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Admins</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.foot-text{
text-align:center;
}
.table-box th{
text-align:center;
}

.table-box td{
text-align:center;
}
</style>
</head>
<body>
<div	align="center" style="width:1000px">
	<p class="foot-text">每页${page.pageSize}条 当前页${page.size}条 ${page.pageNum}/${page.pages}页
		
		记录数${page.total}
		</p>
	<div	class="table-box">	
	<table	class="table table-hover table-bordered " 	>
		<tr>
			<th	style="width:45px"><input	type="checkbox"></th>
			<th >Id</th>
			<th	>Level</th>
			<th style="width:65px">Update</th>
		</tr>
		<c:forEach	var="admin"	items="${requestScope.admins }">
		<tr>
			<td><input	type="checkbox"></td>
			<td>${admin.id }</td>
			<td>${admin.level }</td>
			<td><a href="transfer?adminid=${admin.id}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
	<div	align="right">
				<button type="button" class="btn btn-danger">删除所选</button>
			</div>
	</div>
			
	<div class="foot-text">
	<c:if	test="${page.pageNum!=1&&page.size!=0 }">
		<a	href="queryAllAdmin?page=${page.pageNum-1}">上一页</a>	
	</c:if>
	
	<c:if	test="${page.pageNum !=page.pages}">
		<a	href="queryAllAdmin?page=${page.pageNum+1}">下一页</a>	
	</c:if>
	</div>
</body>
</html>