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
body{
text-align:center;
}
.text-form{
text-align:center;

}
.form-control{
width:200px;
text-align:center;
resize:none;
}
.btn{
width:200px;
}
</style>
</head>
<body>
	<c:if test="${textid==null }">
		<h1>第1题</h1>
	</c:if>	
	<c:if test="${textid!=null }">
		<h1>第${textid}题</h1>
	</c:if>	
	<form action="addText"	method="post"	class="text-form">
	<input	type="hidden"	name="textid" value="${textid}">
	<div class="form-group"	align="center">
    <label for="question">Question</label>
    <textarea rows="2" cols="2"  id="question" class="form-control"  name="question"  onkeyup="value=value.replace(/[\n\r]/gi,' ')"required></textarea>
  </div>
  <div class="form-group"	align="center">
    <label for="option1">A</label>
    <input type="text" class="form-control" id="option1" name="option1" required>
  </div>
  <div class="form-group"	align="center">
    <label for="option2">B</label>
    <input type="text" class="form-control" id="option2" name="option2" required>
  </div>
  <div class="form-group"	align="center">
    <label for="option3">C</label>
    <input type="text" class="form-control" id="option3" name="option3" required>
  </div>
  <div class="form-group"	align="center">
    <label>RightAnswer</label><br/>
    <font size="5px">
    <input type="checkbox"  name="rightAnswer" value="A" checked>A &nbsp &nbsp
    <input type="checkbox"  name="rightAnswer" value="B">B &nbsp &nbsp
    <input type="checkbox"  name="rightAnswer" value="C">C</font>
  </div>
  <br/>
  <c:if test="${textid!='5' }">
 	<button type="submit" class="btn btn-default" >Next</button>
 	</c:if>
 	<c:if test="${textid=='5' }">
 		<button type="submit" class="btn btn-default" >End</button>
 	</c:if>
 	
 		</form>
 	<br/>
</body>
</html>