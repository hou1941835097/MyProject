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
input::-webkit-input-placeholder{
            color:silver;
 }

</style>
</head>
<body>
<div class="left">
<br/>
	<ul class="nav nav-pills nav-stacked">
	  <li role="presentation" ><a target="main" href="stransfer">Information</a></li>
	  <li role="presentation"><a  target="main" href="etransfer">My Exam</a></li>
	   <li role="presentation"><a target="main" href="supdatePwd.jsp">Password</a></li>
	   <li role="presentation"><a target="main" href="showMessage">Message</a></li>
	  <li role="presentation"><a href="login.jsp">Sign Out</a></li>
	</ul>
</div>
<nav class="navbar navbar-default navbar-fixed-top"	style="background-color:#172E59;width:1800px">
  <div class="container"	style="text-align:left">
    	<font	size="6px"	color="white">Student   &nbsp    ${id}</font>
  </div>
</nav>


<div id="main"	class="right-main">
	<iframe name="main"	width="101%" height=700px style="border:0px;padding:0px;"  src="default.jsp">
	</iframe>
</div>

</body>
</html>