<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<base target="main">
<meta charset="UTF-8">
<title>Search Result</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
function funSelAll(){
	var selects=document.getElementsByName("selOne");
	if(document.getElementsByName("selAll")[0].checked==true){
	for(var i=0;i<selects.length;i++){
	selects[i].checked=true;
	}
	}else{
	for(var i=0;i<selects.length;i++){
	selects[i].checked=false;
	}
	}
	}
function funSelOne(){
	var one=document.getElementsByName("selOne");
	var all=document.getElementsByName("selAll")[0]
	var selCount=0;
	var unSelCount=0;
	for(var i=0;i<one.length;i++){
	 if(one[i].checked==true){
	  selCount++;
	 }
	 if(one[i].checked==false){
	  unSelCount++;
	 }
	 if(selCount==one.length){
	  all.checked=true;
	 }
	 if(unSelCount>0){
	  all.checked=false;
	 }
	}
	}
function delStudent(){
	var sels =document.getElementsByName("selOne");
	var ids=new Array();
	var j=0;
	for(var i =0;i<sels.length;i++){
		if(sels[i].checked==true){
			ids[j]=sels[i].value;
			j++;
		}
	}
	//通过ajax异步方式请求服务器
	xmlHttpRequest = new XMLHttpRequest();
	//设置xmlHttpRequest的回调函数
	xmlHttpRequest.onreadystatechange=callBack;
	xmlHttpRequest.open("POST","deleteStudent",true);
	//设置post方式的头信息
	xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlHttpRequest.send("ids="+ids);
	
}


//定义回调函数
function callBack(){
	if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
		//接收服务端的返回数据
		var data = xmlHttpRequest.responseText;
		if(data=="true"){
			window.location.href="queryByCo?page=${page.pageNum}&col=${col}";
		}else if(data=="false"){
		}
	}		
}
</script>
<style type="text/css">
.foot-text{
text-align:center;
}
.table-box th{
text-align:center;
}

.table-box td{
text-align:center;
}
</style>
</head>
<body>
		<p class="foot-text">每页${page.pageSize}条 当前页${page.size}条 ${page.pageNum}/${page.pages}页
		记录数${page.total}
		</p>
		<div class="table-box">
	<table	class="table table-hover table-bordered "	>
		<tr>
			<th	style="width:15px"><input	type="checkbox"	name="selAll"	onclick="funSelAll(this)"></th>
			<th style="width:65px">学号</th>
			<th	style="width:75px">姓名</th>
			<th	style="width:75px">年级</th>
			<th	style="width:75px">手机号</th>
			<th	style="width:75px">地址</th>
			<th	style="width:75px">邮箱</th>
			<th	style="width:75px">报名状态</th>
			<th	style="width:75px">笔试成绩</th>
			<th	style="width:75px">考试通过</th>
		</tr>
		<c:forEach	var="student"	items="${requestScope.students }">
		<tr>
			<td><input	type="checkbox"	name="selOne" value="${student.id }"	onclick="funSelOne(this)"></td>
			<td><a	href="queryById?studentid=${student.id }&spage=${page.pageNum}&col=${col}">${student.id }</a></td>
			<td>${student.name }</td>
			<td>${student.grade}</td>
			<td>${student.phone }</td>
			<td>${student.address }</td>
			<td>${student.email }</td>
			<td>${student.status}</td>
			<td>${student.writeScore}</td>
			<td>${student.ispass}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
			<div	align="right">
			<button type="button" class="btn btn-danger" onclick="delStudent(this)">删除所选</button>
			</div>
	<div class="foot-text">
	<c:if	test="${page.pageNum!=1&&page.size!=0 }">
		<a	href="queryByCo?page=${page.pageNum-1}&col=${col}">上一页</a>	
	</c:if>
	
	<c:if	test="${page.pageNum !=page.pages}">
		<a	href="queryByCo?page=${page.pageNum+1}&col=${col}">下一页</a>	
	</c:if>
	</div>
</body>
</html>