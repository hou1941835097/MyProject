<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.table-box th{
text-align:center;
}

.table-box td{
text-align:center;
}
</style>
</head>
<body>
	<c:if test="${yes=='yes' }">
		<script type="text/javascript">
			alert("创建成功")
		</script>
	</c:if>
	<div class="table-box">
		<table class="table table-hover table-bordered">
			<tr>
				<th>TestId</th>
				<th>Date</th>
				<th>Time</th>
				<th>CurrentCount</th>
				<th>TotalCount</th>
			</tr>
			<c:forEach	var="test"	items="${requestScope.tests }">
			<tr>
				<td><a href="showTextById?textid=${test.textid }">${test.textid }</a></td>
				<td>${test.date }</td>
				<td>${test.time}</td>
				<td>${test.curNo }</td>
				<td>${test.totalNo }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>