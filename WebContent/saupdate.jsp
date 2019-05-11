<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Update</title>
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
	<c:if test="${succ!=null }">
		<script type="text/javascript">
			alert("修改成功!")
		</script>
	</c:if>
	<c:if test="${fal!=null }">
		<script type="text/javascript">
			alert("修改失败!密码应为6-14位由数字和字母组成")
		</script>
	</c:if>
	<form action="saUpdate" class="form"	method="post">
		  <div class="form-group" align="center">
			    <label for="id">AdminId</label>
			    <input type="text" class="form-control" id="id" name="id" value="${admin.id }" readonly="readonly">
			  </div>
		<div class="form-group" align="center">
				<label >Level</label>
			    <c:if test="${admin.level=='super' }">
			    	<input type="text" class="form-control" id="level" name="level" value="${admin.level }" readonly="readonly">
			    </c:if>
			    <c:if test="${admin.level!='super' }">
			    	<input type="radio" class="form-control" id="level" name="level" value="${admin.level }" checked >${admin.level }
			    	<input type="radio" class="form-control" id="level" name="level" value="${admin.level=='face'?'write':'face' }" >${admin.level=='face'?'write':'face' }
			    </c:if>
			  </div>
		<div class="form-group" align="center">
		    <label for="password">Password</label>
		    <input type="text" class="form-control" id="password" name="password" placeholder="Password"  >
		  </div>		
		<input	type="submit"	class="btn btn-warning" value="Update" ><br/><br/>
	</form>
	<div	align="center">
		<button	class="btn btn-default"	onclick="window.location.href='queryAllAdmin'">Return</button>
		</div>
</body>
</html>