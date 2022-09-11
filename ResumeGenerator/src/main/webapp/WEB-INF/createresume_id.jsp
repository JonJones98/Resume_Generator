<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume Information Form</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="LRpage_setup">
	<ul class="topnav">
		<li><a href="/">Home</a></li>
		<li><a class="active">Resume Generator</a></li>
<c:choose>
        	<c:when test="${user.firstname != null}"><li class="right"><a href="/logout">Logout</a></li></c:when>
        	<c:otherwise>
        	<c:redirect url="/login_user"></c:redirect>
        	</c:otherwise>
        </c:choose>
	</ul>
	<div>
		<h1>Resume Generator</h1>
		<p>Click to begin</p>
						<form:form  action="/resume/new" method="post" modelAttribute="resume">
							<form:input type="hidden" path="user" value="${user.id}" />
							<input type="submit" value="Begin" class="submit" />
						</form:form>
	</div>
</body>
</html>