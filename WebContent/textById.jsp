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
.body{
text-align:center;
}
.btn{
width:150px;
}
.text-box{
width:1000px;
height:700px;
}

</style>
</head>
<body>
<div class="text-box" >
	<div	align="center">
	<h1>试卷查看</h1></div>
	<hr>
		<c:forEach var="text" items="${texts}" varStatus="num" >
		&nbsp &nbsp&nbsp &nbsp<font size="4px">${num.count }、</font>
		<div align="center" class="test-box">
			<font size="4px">${text.question}</font><br/>
			<font size="3px">${text.option1}</font>  &nbsp &nbsp
			<font size="3px">${text.option2}</font>  &nbsp &nbsp
			<font size="3px">${text.option3}</font>
			<br/>
			<br/>
				正确答案:${text.rightAnswer }
			<hr>
			<br/>
			</div>
		</c:forEach>
		<div align="center">
			<button	class="btn btn-default"	onclick="window.location.href='ashowTest'">Return</button>
		</div>
		</div>
</body>
</html>