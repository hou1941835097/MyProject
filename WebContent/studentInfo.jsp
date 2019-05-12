<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link	rel="stylesheet" href="js/jquery-3.4.0.min.js">
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
<c:if test="${su!=null }">
	<script type="text/javascript">
		alert("修改成功!")
	</script>
</c:if>
<div	align="center">
	<form action="aupdateStudent"	method="post">
	<c:if test="${staus=='yes'}">
		<input type="hidden"	name="staus"	id="staus" value="${staus }">
	</c:if>
	<div class="form-group"	>
    <label for="school">School</label>
    <input type="text" class="form-control" id="school" name="school" value="${student.school}"	readonly="readonly">
  </div>
  <div class="form-group">
    <label for="id">Id</label>
    <input type="text" class="form-control" name="id" id="id" value="${student.id }"	readonly="readonly">
  </div>
  <div class="form-group">
    <label for="name">Name</label>
    <input type="text" class="form-control" id="name" name="name" value="${student.name }"	placeholder="Name"	required>
  </div>
  <div class="form-group">
    <label for="grade">Grade</label>
    <input type="text" class="form-control" id="grade" name="grade" value="${student.grade }" maxlength="" onkeyup="value=value.replace(/[^(\d)]/g,'')" placeholder="Grade"	required>
  </div>
  <div class="form-group">
    <label for="phone">Phone</label>
    <input type="text" class="form-control" id="phone" name="phone" value="${student.phone }" onkeyup="value=value.replace(/[^(\d)]/g,'')" placeholder="PhoneNumber"	>
  </div>
		<div class="form-group">
		    <label for="email">Email</label>
		    <input type="email" class="form-control" id="email" name="email" value="${student.email }" placeholder="Email" readonly="readonly">
		  </div>
		  <div class="form-group">
		    <label for="address">Address</label>
		    <input type="text" class="form-control" id="address" name="address" value="${student.address }" placeholder="Address">
		  </div>
		  <div class="form-group">
		    <label for="score">WriteScore</label>
		    <input type="text" class="form-control" id="writeScore" name="writeScore" value="${student.writeScore }" readonly="readonly">
		  </div>
		   <div class="form-group">
		    <label for="faceScore">FaceScore</label>
		    <c:if test="${level!='face'}">
		    	 <input type="text" class="form-control" id="faceScore" name="faceScore" value="${student.faceScore }" readonly="readonly">
		    </c:if>
		     <c:if test="${level=='face' }">
		     	<c:if test="${student.faceScore=='暂无'||student.faceScore==null}">
		  	  		<input type="text" class="form-control" id="faceScore" name="faceScore"  placeholder="FaceScore" onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="3">
		     	</c:if>
		     	<c:if test="${!(student.faceScore=='暂无'||student.faceScore==null)}">
		  	  		<input type="text" class="form-control" id="faceScore" name="faceScore" value="${student.faceScore}" placeholder="FaceScore" onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="3">
		     	</c:if>
		    </c:if>
		  </div>
		<button type="submit" class="btn btn-default">Save</button>
	</form>
	<c:if test="${level=='face' }">
	<br/>
	<c:if test="${staus=='yes' }">
		<button	class="btn btn-default" onclick="window.location.href='email.jsp?staus=yes'">Send Email</button>
		</c:if>
		<c:if test="${staus!='yes' }">
		<button	class="btn btn-default" onclick="window.location.href='email.jsp'">Send Email</button>
		</c:if>
		<br/>
	 </c:if>
		<c:if test="${col!=''&&col!=null}">
		<br/>
			<button	class="btn btn-default" onclick="window.location.href='asupwd.jsp'">Update Password</button>
			<br/>
			<br/>
			<button	class="btn btn-default" onclick="window.location.href='queryByCo?page=${spage}&col=${col}'">Return</button>
		</c:if>
			
		
		<c:if test="${!(col!=''&&col!=null)}">
		<br/>
			<c:if test="${staus=='yes' }">
				<button	class="btn btn-default" onclick="window.location.href='asupwd.jsp?spage=${spage}&staus=yes'">Update Password</button>
				<br/>
			<br/>
				<button	class="btn btn-default" onclick="window.location.href='queryAllStudent?page=${spage}&staus=yes'">Return</button>
			</c:if>
			<c:if test="${staus!='yes' }">
				<button	class="btn btn-default" onclick="window.location.href='asupwd.jsp?spage=${spage}'">Update Password</button>
					<br/>
				<br/>
				<button	class="btn btn-default" onclick="window.location.href='queryAllStudent?page=${spage}'">Return</button>
			</c:if>
			
		</c:if>
	<br/>
	</div>
</body>
</html>