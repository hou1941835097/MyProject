<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Message:</h1><br/>
		&nbsp  &nbsp  &nbsp 
		<c:if test="${student.message==null }">
			<font	size="4px">暂无消息</font>
		</c:if>
		<font	size="4px">${student.message }</font>
	
</body>
</html>