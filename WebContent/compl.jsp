<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<base target="main">
<meta charset="UTF-8">
<title>Insert title here</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.compl-form{
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
<c:if test="${siup=='success' }">
	<script type="text/javascript">
		alert("报名成功，可前往选择笔试场次")
	</script>
</c:if>
<div align="center">
<form action="updateStudent" class="compl-form"	method="post">
	<div class="form-group"	align="center">
    <label for="school">School</label>
    <input type="text" class="form-control" id="school" name="school" value="${student.school}"	readonly="readonly">
  </div>
  <div class="form-group" align="center">
    <label for="name">Name</label>
    <input type="text" class="form-control" id="name" name="name" value="${student.name }"	placeholder="Name">
  </div>
  <div class="form-group" align="center">
    <label for="grade">Grade</label>
    <input type="text" class="form-control" id="grade" name="grade" value="${student.grade }" onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="4" placeholder="Grade">
  </div>
  <div class="form-group" align="center">
    <label for="phone">Phone</label>
    <input type="text" class="form-control" id="phone" name="phone" value="${student.phone }" onkeyup="value=value.replace(/[^(\d)]/g,'')" placeholder="PhoneNumber">
  </div>
		<c:if	test="${student.status=='Yes'}">
		<div class="form-group" align="center">
		    <label for="email">Email</label>
		    <input type="email" class="form-control" id="email" name="email" value="${student.email }" placeholder="Email">
		  </div>
		  <div class="form-group" align="center">
		    <label for="address">Address</label>
		    <input type="text" class="form-control" id="address" name="address" value="${student.address }" placeholder="Address">
		  </div>
		</c:if>
		<button type="submit" class="btn btn-primary">Save</button>
	</form><br/>
	<c:if	test="${student.status!='Yes'}">
	<button type="button" class="btn btn-info"	onclick="window.location.href='signUp.jsp'">To SignUp</button>
</c:if>
</div>
	
</body>
</html>