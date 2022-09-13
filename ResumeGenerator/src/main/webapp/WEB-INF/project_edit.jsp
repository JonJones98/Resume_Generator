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
	<div class="LR_body">
		<h1>Resume Information Form</h1>
	</div>
	<div class="LR_body">
		<div>
			<div class="Form_setup">
				<div class="SubForm_setup">
					<div>
						<p>Projects</p>
					</div>
					<c:forEach items="${allprojects}" var="project">
						<p>${project.name}${project.startyear} ${project.endyear}</p>
					
					<form:form action="/resume/${resume.id}/update_project" method="post" modelAttribute="project"
						class="error ">
						<input type="hidden" name="_method" value="put"/>
						<form:errors path="name" class="text-danger" />
						<div class="Form_position">
							<form:label path="name">Project Name:</form:label>
							<form:input type="text" path="name" value="${project.name}"/>
						</div>
						<div class="Form_position">
							<form:label path="startyear">Year Started:</form:label>
							<form:select type="text" path="startyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
										<c:when test="${year == project.startyear}">
											<option value="${year}" selected>${year}</option>
										</c:when>
										<c:otherwise>
											<option value="${year}">${year}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<div class="Form_position">
							<form:label path="endyear">Year Completed:</form:label>
							<form:select type="text" path="endyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
										<c:when test="${year == project.endyear}">
											<option value="${year}" selected>${year}</option>
										</c:when>
										<c:otherwise>
											<option value="${year}">${year}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<form:errors path="description" class="text-danger" />
						<div class="Form_position">
							<form:label path="description">Description:</form:label>
							<form:textarea type="textarea" row="20" cols="30"
								path="description" value="${project.description}"/>
						</div>
						<input type="submit" value="Update Project" class="submit" />
						<form:input type="hidden" path="resume" value="${project.resume.id}" />
					</form:form>
					</c:forEach>
					<a href="/preview/${resume.id}"><button>Back to Resume</button></a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>