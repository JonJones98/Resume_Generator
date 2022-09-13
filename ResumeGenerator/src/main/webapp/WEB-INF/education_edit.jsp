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
						<h3>Education</h3>
					</div>
					<c:forEach items="${alleducations}" var="education">
					<form:form action="/resume/${resume.id}/update_education" method="post"
						modelAttribute="education">
						<input type="hidden" name="_method" value="put" />
						<div>
								<p />
								<p />
								<p>${education.name}</p>
								<p />
							</div>
						<form:errors path="name" class="text-danger" />
						<div class="Form_position">
							<form:label path="name">School Name:</form:label>
							<form:input type="text" path="name" value="${education.name}" />
						</div>
						<form:errors path="city" class="text-danger" />
						<div class="Form_position">
							<form:label path="city">School City:</form:label>
							<form:input type="text" path="city" value="${education.city}"/>
						</div>
						<form:errors path="state" class="text-danger" />
						<div class="Form_position">
							<form:label path="state">School State:</form:label>
							<form:input type="text" path="state" value="${education.state}"/>
						</div>
						<div class="Form_position">
							<form:label path="degreetype">Degree type:</form:label>
							<form:input type="text" path="degreetype" value="${education.degreetype}"/>
						</div>
						<div class="Form_position">
							<form:label path="major">Major:</form:label>
							<form:input type="text" path="major" value="${education.major}"/>
						</div>
						<form:errors path="enrolledyear" class="text-danger" />
						<div class="Form_position">
							<form:label path="enrolledyear">Enrolled Year:</form:label>
							<form:select type="text" path="enrolledyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
								<c:when test="${year == education.enrolledyear}"><option
										value="${year}" selected>${year}</option></c:when>
										<c:otherwise><option value="${year}">${year}</option></c:otherwise>
								</c:choose>
								</c:forEach>
							</form:select>

						</div>
						<form:errors path="graduationyear" class="text-danger" />
						<div class="Form_position">
							<form:label path="graduationyear">Graduation Year:</form:label>
							<form:select type="text" path="graduationyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
								<c:when test="${year == education.graduationyear}"><option
										value="${year}" selected>${year}</option></c:when>
										<c:otherwise><option value="${year}">${year}</option></c:otherwise>
								</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<form:input type="hidden" path="resume" value="${education.resume.id}" />
						<input type="submit" value="Update Education" class="submit" />
					</form:form>
					</c:forEach>
					<a href="/preview/${resume.id}"><button>Back to Resume</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>