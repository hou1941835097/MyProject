<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link	rel="stylesheet" href="js/jquery-3.4.0.min.js">
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.email-form{
text-align:center;
}
.form-group{
align:center;
}
.form-control{
width:200px;
resize:none;
}
.btn{
width:200px;
text-align:center;
}
</style>
</head>
<body>
	<c:if test="${success!=null }">
		<script type="text/javascript">
			alert("发送成功!")
		</script>
	</c:if>
	<div align="center">
		<form action="sendEmail" method="post" class="email-form">
			<c:if test="${staus=='yes'}">
				<input type="hidden"	name="staus"	id="staus" value="${staus }">
			</c:if>
			<div	class="form-group">
				<h2>To &nbsp &nbsp <font color="red">${email}</font></h2>
			</div>
			<input	type="hidden"	name="email" value="${email }">
			<div class="form-group"	align="center">
			    <label for="subject">Subject</label>
			    <textarea class="form-control"	rows="2" cols="2" name="subject" id="subject" required ></textarea>
			 </div>
			<div class="form-group"		align="center">
			    <label for="detial">Details</label>
			    <textarea class="form-control"	rows="2" cols="2" name="detail" id="detail"  required></textarea>
			 </div>
		<button	type="submit" class="btn btn-default">Send</button>
		</form>
		<br/>
		<c:if test="${col!=''&&col!=null}">
			<input	type="button"	class="btn btn-default" value="Return" onclick="window.location.href='queryById?studentid=${studentid}&spage=${spage}&col=${col }'">
		</c:if>
		<c:if test="${!(col!=''&&col!=null) }">
			<c:if test="${staus=='yes' }">
				<input	type="button"	class="btn btn-default" value="Return" onclick="window.location.href='queryById2?studentid=${studentid}&spage=${spage}&staus=yes'">
			</c:if>
			<c:if test="${staus!='yes' }">
				<input	type="button"	class="btn btn-default" value="Return" onclick="window.location.href='queryById2?studentid=${studentid}&spage=${spage}'">
			</c:if>
		</c:if>
	</div>
</body>
</html>