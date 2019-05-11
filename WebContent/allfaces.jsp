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
	<c:if test="${sta=='full' }">
		<script type="text/javascript">
			alert("该轮面试人数已达上限，请选择其它轮次")
		</script>
	</c:if>
	<c:if test="${sta=='end' }">
		<script type="text/javascript">
			alert("该轮面试已经结束，请选择其它轮次")
		</script>
	</c:if>
	<div class="table-box">
		<table class="table table-hover table-bordered">
			<tr>
				<th>InterviewId</th>
				<th>Date</th>
				<th>Time</th>
				<th>CurrentCount</th>
				<th>HeadCount</th>
				<th>Select To Join</th>
			</tr>
			<c:forEach	var="face"	items="${requestScope.faces }">
			<tr>
				<td>${face.faceid }</td>
				<td>${face.date }</td>
				<td>${face.time}</td>
				<td>${face.curNo }</td>
				<td>${face.totalNo }</td>
				<td><a href="joinFace?faceid=${face.faceid }"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>