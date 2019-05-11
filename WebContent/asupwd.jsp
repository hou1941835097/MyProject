<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Password</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.form-control{
text-align:center;
width:300px;
}
.form{
text-align:center;
}
.btn{
width:300px;

}
</style>
</head>
<body>
	<c:if test="${success!=null }">
		<script type="text/javascript">
			alert("修改成功!")
		</script>
	</c:if>
	<c:if test="${faliure!=null }">
		<script type="text/javascript">
			alert("修改失败!密码应为6-14位由数字和字母组成")
		</script>
	</c:if>
	<form action="asupdatePwd" class="form"	method="post">
	<c:if test="${staus=='yes' }">
		<input type="hidden" value="yes" name="staus">
	</c:if>
		  <div class="form-group" align="center">
			    <label for="studentid">StudenId</label>
			    <input type="text" class="form-control" id="studentid" name="id" value="${studentid }" readonly="readonly">
			  </div>
		<div class="form-group" align="center">
		    <label for="password">Password</label>
		    <input type="text" class="form-control" id="password" name="password" placeholder="Password"  required>
		  </div>		
		<input	type="submit"	class="btn btn-warning" value="Update"><br/><br/>
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
	</form>
	
</body>
</html>