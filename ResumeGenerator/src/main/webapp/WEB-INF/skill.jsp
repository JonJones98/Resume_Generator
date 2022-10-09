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
	<div class="Form_setup">
	<div class="SubForm_setup">
		<div class="Subtitle_setup">
			<h3>Skills</h3>
			<h3>3 of 6</h3>
		</div>
		<c:forEach items="${allskills}" var="skill">
			 <form id="delete_form" action="/delete/${skill.id}/3/${resume.id}" method="post">
							<div class="remove-btn">
							<p>${skill.name}</p>
							<input type="hidden" name="_method" value="delete"> 
							<a class="delete_img" onclick="document.getElementById('delete_form').submit(); return false;"><img alt="Remove" src="/img/delete_icon.png" width="20" height="20" /></a>
						</div>
						</form>
		</c:forEach>
		<form:form action="/skl/new/${resume.id}" method="post" modelAttribute="skill">
			<form:errors path="name" class="text-danger" />
			<div class="Form_position">
				<form:label path="name">Skills:</form:label>
				<form:input type="text" path="name" />
			</div>
			<input type="submit" value="Save Skill" class="submit" />
			<form:input type="hidden" path="resume" value="${resume.id}" />
		</form:form>
		<a href="/add/experience/${resume.id}"><button>Next</button></a>
	</div>
	</div>
	</div>
</body>
</html>