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
	<c:if test="${idfault!=null}">
		<script type="text/javascript">
			alert("添加失败!ID应为8位数字组成")
		</script>
	</c:if>
	<c:if test="${pafault!=null}">
		<script type="text/javascript">
			alert("添加失败!Password应为6-14位由数字和字母组成")
		</script>
	</c:if>
	<c:if test="${exist!=null}">
		<script type="text/javascript">
			alert("添加失败!该ID已经存在")
		</script>
	</c:if>
	<c:if test="${succe!=null}">
		<script type="text/javascript">
			alert("添加成功，可继续添加")
		</script>
	</c:if>
	<form action="addAdmin" class="form"	method="post" >
		  <div class="form-group" align="center">
			    <label for="id">AdminId</label>
			    <input type="text" class="form-control" id="id" name="id"  maxlength="8" placeholder="AdminId" required>
			  </div>
		<div class="form-group" align="center">
				<font size="4px"><label >Level</label></font><br/>
			 <font size="3px"><input type="radio" id="level" name="level" value="face" checked >Face<br/>
			    	<input type="radio" id="level" name="level" value="write" >Write<br/></font>   	
			  </div>
		<div class="form-group" align="center">
		    <label for="password">Password</label>
		    <input type="text" class="form-control" id="password" name="password" placeholder="Password"  maxlength="14" required>
		  </div>		
		<input	type="submit"	class="btn btn-default" value="Add"><br/><br/>
	</form>
</body>
</html>