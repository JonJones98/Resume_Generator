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
							<p>Personal Info</p>
						</div>
						
						<form:form action="/resume/${resume.id}/update_headerinfo" method="post" modelAttribute="headerinfo"
							class="error ">
							<input type="hidden" name="_method" value="put"/>
							<div class="Form_position">
								<form:label path="firstname">First Name:</form:label>
								<form:input type="text" path="firstname" value="${headerinfo.firstname}" />
							</div>
							<div class="Form_position">
								<form:label path="middlename">Middle Initial:</form:label>
								<form:input type="text" path="middlename" value="${headerinfo.middlename}" />
							</div>
							<div class="Form_position">
								<form:label path="lastname">Last Name:</form:label>
								<form:input type="text" path="lastname" value="${headerinfo.lastname}" />
							</div>
							<div class="Form_position">
								<form:label path="email">Email:</form:label>
								<form:input type="text" path="email" value="${headerinfo.email}"/>
							</div>
							<div class="Form_position">
								<form:label path="linkedin">Linkedin Link:</form:label>
								<form:input type="text" path="linkedin" value="${headerinfo.linkedin}"/>
							</div>
							<div class="Form_position">
								<form:label path="github">Github Link:</form:label>
								<form:input type="text" path="github" value="${headerinfo.github}"/>
							</div>
							<form:input type="hidden" path="resume" value="${headerinfo.resume.id}" />
							<input type="submit" value="Update Info" class="submit" />
						</form:form>
						<a href="/preview/${resume.id}"><button>Back to Resume</button></a>
					</div>
				</div>
		</div>
	</div>
</body>
</html>