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
						<h3>Personal Info</h3>
						<h3>1 of 6</h3>
						</div>
						
						<form:form action="/hdr/new" method="post" modelAttribute="headerinfo"
							class="error ">
							<div class="Form_position">
								<form:label path="firstname">First Name:</form:label>
								<form:input type="text" path="firstname" value="${user.firstname}" />
							</div>
							<div class="Form_position">
								<form:label path="middlename">Middle Initial:</form:label>
								<form:input type="text" path="middlename" value="${user.middlename}" />
							</div>
							<div class="Form_position">
								<form:label path="lastname">Last Name:</form:label>
								<form:input type="text" path="lastname" value="${user.lastname}" />
							</div>
							<div class="Form_position">
								<form:label path="email">Email:</form:label>
								<form:input type="text" path="email" value="${user.email}"/>
							</div>
							<div class="Form_position">
								<form:label path="linkedin">Linkedin Link:</form:label>
								<form:input type="text" path="linkedin" />
							</div>
							<div class="Form_position">
								<form:label path="github">Github Link:</form:label>
								<form:input type="text" path="github" />
							</div>
							<form:input type="hidden" path="resume" value="${resume.id}" />
							<input type="submit" value="Add" class="submit" />
						</form:form>
						
					</div>
				</div>
		</div>
	</div>
</body>
</html>