<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.sign-form{
text-align:center;
}
.form-control{
text-align:center;
width:300px;
}
.btn{
width:300px;
text-align:center;
}
</style>
</head>
<body>
<div align="center">
<form action="signUp"	method="post" class="sign-form">
	<div class="form-group" align="center">
	    <label for="password">Id</label>
	    <input type="text" class="form-control" id="id" name="id" value="${id }"	readonly="readonly">
  </div>
	<div class="form-group" align="center">
		    <label for="address">Address</label>
		    <input type="text" class="form-control" id="address" name="address"  placeholder="Address">
		  </div>
<div class="form-group" align="center">
    <label for="phone">Phone</label>
    <input type="text" class="form-control" id="phone" name="phone" onkeyup="value=value.replace(/[^(\d)]/g,'')" placeholder="PhoneNumber">
  </div>
  <div class="form-group" align="center">
	 <label for="email">Email</label>
	 <input type="email" class="form-control" id="email" name="email"  placeholder="Email" required>
	</div>
		<button type="submit" class="btn btn-primary">Sign Up</button>
	</form>
	<br/>
		<button	class="btn btn-default" onclick="window.location.href='stransfer'">Return</button>
	<br/>
	</div>
</body>
</html>