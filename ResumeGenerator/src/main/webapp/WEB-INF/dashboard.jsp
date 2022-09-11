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
<title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="LRpage_setup">
<ul class="topnav">
        <li><a class="active" href="/">Home</a></li>
        <li><a href="/create">Resume Generator</a></li>
        <c:choose>
        	<c:when test="${user.firstname != null}"><li class="right"><a href="/logout">Logout</a></li></c:when>
        	<c:otherwise>
        	<c:redirect url="/login_user"></c:redirect>
        	</c:otherwise>
        </c:choose>
      </ul>
		<h1>Welcome ${user.firstname}</h1>
	<div class="table_width">
		<table class="table table-striped table-bordered table-sm" id ="table_setup">
			<thead>
				<tr>
					<th>Resume ID</th>
					<th>Date Created</th>
					<th>Date Updated</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allresumes}" var="resume">
					<tr>
						<td><a href="/preview/${resume.id}">Resume ${resume.id}</a></td>
						<td>${resume.createdAt}</td>
						<td>${resume.updatedAt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:choose>
        	<c:when test="${user.firstname != null}"><a href="/create"><button>Create Resume</button></a></c:when>
        </c:choose>
	</div>
</body>
</html>