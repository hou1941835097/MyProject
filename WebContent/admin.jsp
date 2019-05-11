<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.btn{
width:150px;
}
.box{

}

</style>
</head>
<body>
<br/>
<br/>
<br/>
	<div	class="box"	align="center">
		
		<c:if test="${level=='face'}">
			<button class="btn btn-default"		onclick="window.location.href='schedule.jsp'">安排面试</button><br/><br/>
		</c:if>
		<c:if test="${level=='write'}">
			<button class="btn btn-default"		onclick="window.location.href='schedule.jsp'">安排笔试</button><br/><br/>
		</c:if>
		
	</div>
</body>
</html>