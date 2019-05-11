<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
function check(){
	var vid=$('input[name="id"]').val();
	if($.trim(vid) == ""){
		$('input[name="id"]').next().text('Id不能为空');
		$('input[name="id"]').next().css('color','red');
	}else{
		$('input[name="id"]').next().text('');
	}
	
	
}

</script>
<style type="text/css">

.login-form{
text-align:center;

}
.form-control{
width:200px;
text-align:center;
}
.btn{
width:200px;
}

</style>
</head>
<body>
	<c:if test="${fault!=null}">
		<script type="text/javascript">
			alert("Id或Password错误!!")
		</script>
	</c:if>
	<form action="isLogin"	method="post"	class="login-form">
	<h1>Login</h1>
	<div class="form-group"	align="center">
    <label for="id">YourId</label>
    <input type="text" class="form-control" id="id" name="id" onkeyup="value=value.replace(/[^(\d)]/g,'')" onblur="check()" maxlength="10" placeholder="Input Id" required><span></span>
  </div>
  
  <div class="form-group"	align="center">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" name="password" maxlength="14" placeholder="Password" required>
  </div>
  <br/>
 	<button type="submit" class="btn btn-default" >Login</button></form>
 	<br/>
 	<div	align="center">
	<input	type="button" class="btn btn-default" 	value="To Register" onclick="window.location.href='register.jsp'">
	</div>
</body>
</html>