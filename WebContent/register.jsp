<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	function register(){
		var school = document.getElementById("school").value;
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		var password = document.getElementById("password").value;
		var grade = document.getElementById("grade").value;
		var phone = document.getElementById("phone").value;
		
		if(checkId(id)&&checkPwd(password)){
				$.ajax({
					type : "post",
					url : "registerStudent",
					data : {
					"school" : school,
					"id" : id,
					"name" : name,
					"password" : password,
					"grade":grade,
					"phone":phone,
					},
					dataType : 'json',
					success:function(msg){ 
					 if(msg.msg ='yes'){
						alert("注册成功");
						window.location.href="login.jsp";
					 }else if(msg.msg ='no'){
					 	alert("注册失败，该Id已被占用");
					 }
					}
			})
		}
		else{
					alert(id+password)
					alert("Id应为10位数字，密码应由6-14位数字和字母组成")
		}
		
	}
	
	function checkId(s){
		var tel=/^\d{10}$/;			
		if(!tel.exec(s)){
			return false;
		}
		return true;
	}
	
	function checkPwd(s){
		var tel=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$/;
		if(!tel.exec(s)){
			return false;
		}
		return true;
	}


</script>
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
		<form action="registerStudent" class="form"	method="post">
		<div class="form-group"	align="center">
		    <label for="school">School</label>
		    <input type="text" class="form-control" id="school" name="school" placeholder="School"	required>
		  </div>
		  <div class="form-group" align="center">
			    <label for="id">Id</label>
			    <input type="text" class="form-control" id="id" name="id" placeholder="Id" onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="10" required>
			  </div>
		<div class="form-group" align="center">
		    <label for="password">Name</label>
		    <input type="text" class="form-control" id="name" name="name"	placeholder="Name" required>
		  </div>
		<div class="form-group" align="center">
		    <label for="password">Password</label>
		    <input type="text" class="form-control" id="password" name="password" maxlength="14"	placeholder="Password" required>
		  </div>		
		  <div class="form-group" align="center">
		    <label for="grade">Grade</label>
		    <input type="text" class="form-control" id="grade" name="grade"  onkeyup="value=value.replace(/[^(\d)]/g,'')" maxlength="4" placeholder="Grade" required>
		  </div>
		<div class="form-group" align="center">
		    <label for="phone">Phone</label>
		    <input type="text" class="form-control" id="phone" name="phone"  onkeyup="value=value.replace(/[^(\d)]/g,'')" placeholder="PhoneNumber">
		  </div>
		<input	type="button" onclick="register()"	class="btn btn-primary" value="Register"><br/><br/>
		<input	type="button"	class="btn btn-default" value="To Login" onclick="window.location.href='login.jsp'">
	</form>
	
</body>
</html>