<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Self Update</title>
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
	<c:if test="${suc!=null }">
		<script type="text/javascript">
			alert("修改成功!")
		</script>
	</c:if>
	<c:if test="${fault!=null }">
		<script type="text/javascript">
			alert("修改失败!密码应为6-14位由数字和字母组成!")
		</script>
	</c:if>
	<form action="AupdatePwd" class="form"	method="post">
		  <div class="form-group" align="center">
			    <label for="id">Your Id</label>
			    <input type="text" class="form-control" id="id" name="id" value="${id }" readonly="readonly">
			  </div>
		<div class="form-group" align="center">
		    <label for="password">Password</label>
		    <input type="text" class="form-control" id="password" name="password" placeholder="Password"  required>
		  </div>		
		<input	type="submit"	class="btn btn-warning" value="Update"><br/><br/>
	</form>
	
</body>
</html>