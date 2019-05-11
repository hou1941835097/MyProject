<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<base target="main">
<meta charset="UTF-8">
<title>All Students</title>
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
	var all=document.getElementsByName("selAll")[0];
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
	if(document.getElementById("staus") == ""){
		var s="";
	}else{
		var s="&staus=${staus}";
	}
	$.ajax({
		type : "post",
		url : "deleteStudent?ids="+ids,
		data : JSON.stringify(ids),
		dataType : 'json',
		success:function(msg){ 
		 if(msg.msg ='yes'){
			window.location.href="queryAllStudent?page=${page.pageNum}"+s;
		 }else{
		 	alert("删除失败");
		 }
		}
})
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
		<input	type="hidden" id="staus" value="${staus }">
		<p class="foot-text">每页${page.pageSize}条 当前页${page.size}条 ${page.pageNum}/${page.pages}页
		
		记录数${page.total}
		</p>
		<div class="table-box">
	<table	class="table table-hover table-bordered " >
		<tr>
			<th	style="width:15px"><input	type="checkbox" name="selAll"	onclick="funSelAll(this)"></th>
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
			<td><input	type="checkbox" name="selOne"	value="${student.id }" onclick="funSelOne(this)"></td>
			<td><a	href="queryById2?studentid=${student.id }&spage=${page.pageNum}&staus=${staus}">${student.id }</a></td>
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
	<div>
		<button type="button" class="btn btn-warning" 	onclick="window.location.href='queryAllStudent?staus=yes'">只显示已报名学生</button>
		<font color="white">
		--------------------------------------------------------------------------
		--------------------------------------------------------------------------
		--------------------------------------------------------------------------
		-----------------------
		</font>
		<button type="button" class="btn btn-danger" id="delete"	onclick="delStudent(this)">删除所选</button>
			</div>
	<div class="foot-text">
	<c:if	test="${page.pageNum!=1 &&page.size!=0}">
		<c:if test="${staus!='yes'||staus==null}">
			<a	href="queryAllStudent?page=${page.pageNum-1}">上一页</a>	
		</c:if>
		<c:if test="${staus=='yes'}">
			<a	href="queryAllStudent?page=${page.pageNum-1}&staus=yes">上一页</a>	
		</c:if>
	</c:if>
	
	<c:if	test="${page.pageNum !=page.pages}">
		<c:if test="${staus!='yes'||staus==null }">
			<a	href="queryAllStudent?page=${page.pageNum+1}">下一页</a>	
		</c:if>
		<c:if test="${staus=='yes'}">
			<a	href="queryAllStudent?page=${page.pageNum+1}&staus=yes">下一页</a>	
		</c:if>
	</c:if>
	</div>
</body>
</html>