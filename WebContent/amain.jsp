<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Controller</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
body{
background-color:#212830;
}
.left{
width:140px;
position: absolute;
  top: 50px;
  background-color: #212830;
  height:702px;
}
.right-main{
position: absolute;
width:1380px;
left:100px;
top:50px;
height:702px;
background-color: white;
}
.container{
height:15px;

}
.right-top{
position:absolute;
top:1px;
left:1235px;
heigth:50px;
background-color:#868A95;
}
.txtb {
	background: #868A95;
	border: 1px solid white;
	color: white;
	outline: none;
	border-radius: 6px;
	text-align:center;
}
input::-webkit-input-placeholder{
            color:silver;
 }

</style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top"	style="background-color:#868A95;width:800px;left:1100px;">
	<form action="queryByCo" method="post"	target="main">
	<font size="4px" >
		<input	type="text" class="txtb" name="col"	placeholder="Search From Students" >
		<button	type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	</font>
	</form>
</nav>
<div	class="left">
	<ul class="nav nav-pills nav-stacked">
	  <li role="presentation" ><a target="main" href="toshowAll">All Students</a></li>
	  <c:if	test="${level=='super' }">
	  		<li role="presentation"><a target="main"  href="queryAllAdmin">Show Admins</a></li>
	  		<li role="presentation"><a target="main"  href="addAdmin.jsp">Add Admin</a></li>
	  </c:if>
	  <c:if test="${level=='write' }">
	  	<li role="presentation"><a target="main" href="Text.jsp">Schedule</a></li>
	  	<li role="presentation"><a target="main" href="ashowTest">All Tests</a></li>
	  </c:if>
	  <c:if test="${level=='face' }">
	  	<li role="presentation"><a target="main" href="face.jsp">Schedule</a></li>
	  	<li role="presentation"><a target="main" href="ashowFace">All Faces</a></li>
	  </c:if>
	   <li role="presentation"><a target="main" href="aupwd.jsp">Password</a></li>
	  <li role="presentation"><a href="login.jsp">Sign Out</a></li>
	</ul>
</div>
<nav class="navbar navbar-default navbar-fixed-top"	style="background-color:#868A95;width:1100px">
  <div class="container"	style="text-align:left">
    	<font	size="6px"	color="white">Admin     ${id}</font>
  </div>
</nav>


<div id="main"	class="right-main">
	<iframe name="main"	width="101%" height=700px style="border:0px;padding:0px;" src="default.jsp"></iframe>
</div>

</body>
</html>