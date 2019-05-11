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
	<c:choose>
		<c:when test="${flag=='1' }">
			<script type="text/javascript">
				alert("Error!原密码不正确!")
			</script>
		</c:when>
		<c:when test="${flag=='2' }">
			<script type="text/javascript">
				alert("Error!两次密码不相同!")
			</script>
		</c:when>
		<c:when test="${flag=='3' }">
			<script type="text/javascript">
				alert("Error!密码应为6-14位，需要包含数字和字母!")
			</script>
		</c:when>
		<c:when test="${flag=='4' }">
			<script type="text/javascript">
				alert("修改成功!")
			</script>
		</c:when>
	</c:choose>
	<form action="suppwd" class="form"	method="post">
		  <div class="form-group" align="center">
			    <label for="opwd">Old Password</label>
			    <input type="password" class="form-control" id="opwd" name="opwd" placeholder="Old Password" maxlength="14" required  >
			  </div>
			  <div class="form-group" align="center">
			    <label for="npwd">New Password</label>
			    <input type="password" class="form-control" id="npwd" name="npwd" placeholder="New Password" maxlength="14" required  >
			  </div>
		<div class="form-group" align="center">
		    <label for="tpwd">Sure</label>
		    <input type="password" class="form-control" id="tpwd" name="tpwd" placeholder="Input Again" maxlength="14"  required>
		  </div>		
		<input	type="submit"	class="btn btn-warning" value="Update"><br/><br/>
	</form>
</body>
</html>