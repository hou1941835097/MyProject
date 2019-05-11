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
<script type="text/javascript"	src="js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.schedul-form{
text-align:center;
}
.form-control{
width:200px;
text-align:center;
}
.btn{
width:200px;
text-align:center;
}
</style>
</head>
<body>
	<c:if test="${ok=='ok' }">
		<script type="text/javascript">
			alert("创建成功")
		</script>
	</c:if>
	<c:if test="${ok=='exist' }">
		<script type="text/javascript">
			alert("创建失败,该时间段已经安排存在面试")
		</script>
	</c:if>
	<c:if test="${ok=='no' }">
		<script type="text/javascript">
			alert("创建失败,FaceId已经存在")
		</script>
	</c:if>

	<form action="ScheduleFace"	method="post" class="schedul-form">
	  	<div class="form-group" align="center">
		    <label for="faceid">Face Id</label>
		    <input	type="text" class="form-control"	id="faceid" name="faceid"	onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="10" placeholder="Face Id" required>
		  </div>
		  <div class="form-group" align="center">
		    <label for="date">Day</label>
		    <input type="text" class="form-control Wdate" id="date" name="date" onclick="WdatePicker({isShowWeek:true})" placeholder="Day"	required>
		  </div>
		  <div class="form-group" align="center" >
		  	<label	for="time">Select Time</label>
			  <select class="form-control" name="time" id="time">
			  	<option value="09:00-12:00" selected="selected" >09:00-12:00</option>
	            <option value="15:00-18:00">15:00-18:00</option>
			</select>
		</div>
		  <div class="form-group" align="center">
		    <label for="totalNo">Total Number</label>
		    <input	type="text" class="form-control"	id="totalNo" name="totalNo"	onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="3" required>
		  </div>
	<button type="submit" class="btn btn-primary">Create</button>
	</form><br/>
</body>
</html>