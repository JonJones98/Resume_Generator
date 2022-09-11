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
<li class="right"><a href="/logout">Logout</a></li>
	</ul>
	<div class="SubForm_setup">
						<div>
							<p>Projects</p>
						</div>
						<c:forEach items="${allprojects}" var="project"><p>${project.name}  ${project.startyear} ${project.endyear}</p></c:forEach>
						<form:form action="/prj/new" method="post" modelAttribute="project"
							class="error ">
							<form:errors path="name" class="text-danger" />
							<div class="Form_position">
								<form:label path="name">Project Name:</form:label>
								<form:input type="text" path="name" />
							</div>
							<div class="Form_position">
								<form:label path="startyear">Year Started:</form:label>
								<form:select type="text" path="startyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
								<c:when test="${year == currentyear}"><option
										value="${year}" selected>${year}</option></c:when>
										<c:otherwise><option value="${year}">${year}</option></c:otherwise>
								</c:choose>
								</c:forEach>
							</form:select>
							</div>
							<div class="Form_position">
								<form:label path="endyear">Year Completed:</form:label>
								<form:select type="text" path="endyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
								<c:when test="${year == currentyear}"><option
										value="${year}" selected>${year}</option></c:when>
										<c:otherwise><option value="${year}">${year}</option></c:otherwise>
								</c:choose>
								</c:forEach>
							</form:select>
							</div>
							<form:errors path="description" class="text-danger"/>
							<div class="Form_position">
								<form:label path="description">Description:</form:label>
								<form:textarea type="textarea" row="20" cols="30" path="description"/>
							</div>
							<input type="submit" value="Save Project" class="submit" />
							<form:input type="hidden" path="resume" value="${resume.id}" />
						</form:form>
						<a href="/add/honors"><button>Next</button></a>
					</div>
</body>
</html>