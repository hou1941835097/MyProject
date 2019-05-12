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
	<c:if test="${ex==null }">
  	<form action="ScheduleWrite"	method="post" class="schedul-form">
  		 <div class="form-group" align="center">
		    <label for="textid">TestId</label>
		    <input type="text" class="form-control" id="textid" name="textid"  	required>
		  </div>
		  <div class="form-group" align="center">
		    <label for="date">Day</label>
		    <input type="text" class="form-control Wdate" id="date" name="date" onclick="WdatePicker({isShowWeek:true})" placeholder="Time"	required>
		  </div>
		  <div class="form-group" align="center" >
		  	<label	for="time">Select Time</label>
			  <select class="form-control" name="time" id="time">
			 	<option value="07:00-08:00" selected>07:00-08:00</option>
			  	<option value="08:00-09:00">08:00-09:00</option>
	            <option value="09:00-10:00">09:00-10:00</option>
	            <option value="10:00-11:00">10:00-11:00</option>
	            <option value="11:00-12:00">11:00-12:00</option>
	            <option value="14:00-15:00">14:00-15:00</option>
	            <option value="15:00-16:00">15:00-16:00</option>
	            <option value="16:00-17:00">16:00-17:00</option>
	            <option value="17:00-18:00">17:00-18:00</option> 
			</select>
		</div>
		<div class="form-group" align="center">
		    <label for="totalNo">Total Number</label>
		    <input	type="text" class="form-control"	id="totalNo" name="totalNo"	onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="4" required>
		  </div>
		  <div class="form-group" align="center">
		    <label for="passScore">Cut-Off Scores</label>
		    <input	type="text" class="form-control"	id="passScore" name="passScore"	onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="2" required>
		  </div>
	<button type="submit" class="btn btn-primary">Create</button>
	</form><br/>
</c:if>
	<c:if test="${ex=='ex' }">
		<script type="text/javascript">
			alert("试卷ID已存在，请更换")
		</script>
	</c:if>
	<c:if test="${exi=='exi' }">
		<script type="text/javascript">
			alert("该时间段已经存在考试，请重新安排")
		</script>
	</c:if>
	<c:if test="${bef=='bef' }">
		<script type="text/javascript">
			alert("错误的时间，请重新安排时间")
		</script>
	</c:if>
	
</body>
</html>