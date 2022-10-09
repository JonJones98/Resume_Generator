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
						<div class="Subtitle_setup">
						<h3>Activities and Honors</h3>
						<h3>6 of 6</h3>
						</div>
						<c:forEach items="${allhonors}" var="honor">
						<form id="delete_form" action="/delete/${honor.id}/6/${resume.id}" method="post">
							<div class="remove-btn">
							<p>${honor.name}  ${honor.yearawarded}</p>
							<input type="hidden" name="_method" value="delete"> 
							<a class="delete_img" onclick="document.getElementById('delete_form').submit(); return false;"><img alt="Remove" src="/img/delete_icon.png" width="20" height="20" /></a>
						</div>
						</form>
						</c:forEach>
						<form:form action="/hrs/new/${resume.id}" method="post" modelAttribute="honor"
							class="error ">
							<form:errors path="name" class="text-danger" />
							<div class="Form_position">
								<form:label path="name">Name of Activity/Honor:</form:label>
								<form:input type="text" path="name" />
							</div>

							<div class="Form_position">
								<form:label path="yearawarded">Year Received:</form:label>
								<form:select type="text" path="yearawarded">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
								<c:when test="${year == currentyear}"><option
										value="${year}" selected>${year}</option></c:when>
										<c:otherwise><option value="${year}">${year}</option></c:otherwise>
								</c:choose>
								</c:forEach>
							</form:select>
							</div>
							<input type="submit" value="Save Activity or Honor" class="submit" />
							<form:input type="hidden" path="resume" value="${resume.id}" />
						</form:form>
						<a href="/preview/${resume.id}"><button>Create</button></a>
						</div>
					</div>
					</div>
					</div>
</body>
</html>