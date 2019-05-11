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
<div align="center">
	<c:if test="${sta=='yes' }">
		<script type="text/javascript">
			alert("你已经成功报名面试!")
		</script>
	</c:if>
	<c:if test="${statu=='success' }">
		<script type="text/javascript">
			alert("你已经成功参加笔试!")
		</script>
	</c:if>
	<c:if test="${student.status!='Yes' }">
		<h1>暂无考试相关信息</h1>
	</c:if>
	
	<c:if test="${student.ispass=='No'&&student.status=='Yes'&&student.writeScore=='暂无'}">
		<font size="6px"><b>考试安排</b></font><br/>
		<font size="5px"><b>考试形式:</b>笔试</font><br/>
		<c:if test="${student.textid==null }"> 
			<button	class="btn btn-default" onclick="window.location.href='showWrite'">查看所有考试</button><br/>
		</c:if>
		<c:if test="${student.textid!=null }">
			<font size="5px"><b>通过成绩:</b>${testInfo.passScore }</font><br/>
			<font size="5px"><b>考试时间:</b><br/>${testInfo.date} <br/>${testInfo.time}</font><br/>
		</c:if>
	</c:if>
	
	<c:if test="${student.ispass=='No'&&student.status=='Yes'&&student.writeScore=='暂无'&&flag1==false&&flag2!=false}">
		<button	class="btn btn-default" onclick="window.location.href='startExam'">前往考试</button>
			<br/>(考试中途离开会导致答案清空)
	</c:if>
	
	<c:if test="${student.ispass=='No'&&student.status=='Yes'&&student.writeScore=='暂无'&&flag1==true}">
		<font size="5px"><b>当前不是考试时间</b></font><br/>
	</c:if>
	
	<c:if test="${flag2==false}">
		<font size="5px"><b>笔试已经结束</b></font><br/>
	</c:if>
	
	
	<c:if test="${student.writeScore!='暂无'&&student.ispass=='No' }">
		<font size="6px"><b>考试信息</b></font><br/>
		<font size="5px"><b>笔试:</b>${student.writeScore }</font><br/>
		<font size="5px"><b>通知:</b><br/>非常遗憾!您未通过笔试!</font><br/>
	</c:if>
	
	
	
	<c:if test="${student.ispass!='No'&&student.status=='Yes'}">
	
		<font size="6px"><b>考试信息</b></font><br/>
		<font size="5px"><b>笔试:</b>${student.writeScore }</font><br/>
		<button	class="btn btn-default" onclick="window.location.href='showMyText'">查看试卷</button><br/><br/><br/>
		
		<c:if test="${student.faceScore!='暂无' }">
			<font size="5px"><b>面试:</b>${student.faceScore }</font><br/>
		</c:if>
		<c:if test="${student.faceid==null }">
			<font size="5px"><b>通知:</b>恭喜你通过笔试，可参加面试!</font><br/>
			<button class="btn btn-default" onclick="window.location.href='showFace'">参加面试</button>
		</c:if>
		<c:if test="${student.faceid!=null }">
			<br/>
			<br/>
			<br/>
			<font size="5px"><b>面试场次编号:</b>${face.faceid }</font><br/>
			<font size="5px"><b>面试日期:</b>${face.date }</font><br/>
			<font size="5px"><b>面试时间:</b>${face.time }</font><br/>
			<font size="5px"><b>希望您能准时参加</b></font><br/>
		</c:if>
	</c:if>
	</div>
</body>
</html>