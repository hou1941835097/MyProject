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


</style>
</head>
<body>

	<form action="getScore" class="test-form">
	<div align="center"><h1>Test</h1>(不定项选择)</div>
	<hr>
		<c:forEach var="text" items="${texts}" varStatus="num" >
		<font size="6px">${num.count }、</font>
		<div align="center" class="test-box">
			<font size="6px">${text.question}</font><br/>
			<input	type="checkbox" name="${text.textid}" id="${text.textid}+A" value="A"> 
			<label for="${text.textid}+A"><font size="5px">${text.option1}</font></label> &nbsp &nbsp
			<input	type="checkbox" name="${text.textid}" id="${text.textid}+B" value="B">
			<label for="${text.textid}+B"><font size="5px">${text.option2}</font></label>  &nbsp &nbsp
			<input	type="checkbox" name="${text.textid}" id="${text.textid}+C" value="C">
			<label for="${text.textid}+C"><font size="5px">${text.option3}</font></label>
			<br/>
			<br/>
			<hr>
			<br/>
			</div>
		</c:forEach>
		<div align="center">
			<button type="submit" class="btn btn-default">提交</button>
		</div>
	</form>
	
</body>
</html>